<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #employee i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    員工管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="emp">

            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="form-group row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-2"><label class="col-form-label" >職務: </label></div>
                        <div class="col-sm-5">
                                <select class="form-control" v-model="permissionId"  @change="GetEmployeeByPager(1)">
                                <option value=0>請選擇</option>
                                <option v-for="item in jobTitleAry" :value="item.PermissionID">{{item.JobTitle}}</option>
                            </select>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <div class="card">

                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table table-hover">
                                <thead>
                                    <tr>
                                        <th class="ml-5">#</th>
                                        <th>姓名</th>
                                        <th>電子郵件</th>
                                        <th>職務</th>
                                        <th>到職日</th>
                                        <th>離職日</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="emp in employeeAry">
                                        <td>{{emp.EmployeeID}}</td>
                                        <td>{{emp.EmployeeName}} </td>
                                        <td>{{emp.Email}} </td>
                                        <td>{{emp.JobTitle}} </td>
                                        <td>{{emp.StartDate}}</td>
                                        <td>{{emp.LeaveDate}}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3" v-if="myData.empEdit=='block'">
                                                    <a :href="'/b_04Employee/4_2_2_EmployeeAddEdit.aspx?id='+ emp.EmployeeID +''" style="color: white">編輯</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
            </div>
            <ul class="pagination">
                <li class="page-item disabled" v-if="pager.currentPage == 1">
                    <a href="#" class="page-link">&laquo;</a>
                </li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetEmployeeByPager(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetEmployeeByPager(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetEmployeeByPager(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetEmployeeByPager(pager.totalPage)">&raquo;</a></li>
            </ul>

            <%--新增按鈕--%>
              <div class="theme-setting-wrapper">
                    <div id="settings-trigger">
                        <a href="4_2_1_EmployeeAdd.aspx" style="color: white">+</a>
                    </div>
                </div>


        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script>

        var app = new Vue({
            el: '#emp',
            data: {
                myData: {
                    commentString: "",
                    empEdit: null,
                },
                permissionId: 0,
                pager: {
                    currentPage: null,
                    totalPage: null,
                    size:5
                },
                employeeAry: [],
                jobTitleAry: []
            },
            methods: {
                GetEmployees: function () {
                    $.ajax({
                        type: "POST",
                        url: "EmployeeJSON.aspx",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            app.employeeAry = result;
                        }
                    });
                    this.myData.empEdit = document.getElementById('txpEmployeeEdit').value;
                },
                GetEmployeeByPager: function (gotoPage) {
                    //pager = [{ "pageSize": 5, "pageIndex": 1 }];
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetEmployeeByPager",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            pid: this.permissionId,
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                           var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage =  (int3 % int2 > 0)? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.employeeAry = result.d._Employees;
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                    this.myData.empEdit = document.getElementById('txpEmployeeEdit').value;
                },
                GetJobTitles: function () {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetJobTitles",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            console.log(result);
                            app.jobTitleAry = result.d;
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                }
            },
            created: function () {
                //this.GetEmployees();
                this.GetEmployeeByPager(1);
                this.GetJobTitles();

            }
        });

    </script>
</asp:Content>
