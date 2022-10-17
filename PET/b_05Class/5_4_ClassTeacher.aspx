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
    訓練師管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="trainer">


            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table table-hover">
                                <thead>
                                    <tr>
                                        <th class="ml-5">#</th>
                                        <th>照片</th>
                                        <th>姓名</th>
                                        <th>簡稱</th>
                                        <th>想說的一句話</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody v-for="item in trainerAry">
                                    <%--<templete v-for="item in trainerAry">--%>
                                    <%--   <tr v-for="item in trainerAry">--%>
                                        <tr>
                                        <td>{{item.EmployeeID}}</td>
                                        <td><image :src="'/i_trainer/'+ item.EmployeeImgUrl" class="img-fluid"></image></td>
                                        <td>{{item.EmployeeName}} </td>
                                        <td>{{item.EmployeeShortName}} </td>
                                        <%--<td><image :src="'/i_trainer/'+ item.EmployeeImgUrl" class="img-fluid"></image>{{item.EmployeeImgUrl}} </td>--%>
                                        <td>{{item.Subject}} </td>          
                                        <td >
                                        <%--<td>--%>
                                            <div class="d-flex align-items-end">
                                                <button type="button" class="btn btn-primary btn-sm btn-icon-text mr-3" 
                                                    @click="detailToggle(item.EmployeeID)">
                                                   檢視
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3" v-if="myData.courseEdit=='block'">
                                                    <a :href="'/b_05Class/5_4_1_ClassTeacherEdit.aspx?id='+ item.EmployeeID +''" style="color: white">編輯</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <a :href="'/b_05Class/5_4_3_ClassTeacherDelete.aspx?id='+ item.EmployeeID +''" 
                                                    class="btn btn-danger btn-sm btn-icon-text mr-3"
                                                    onclick="return confirm('確認要刪除?')"  v-if="myData.courseEdit=='block'">
                                                         刪除
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                        <tr  :id="'trA'+item.EmployeeID"  style="display:none" class="table-warning">
                                            <td>技能</td>
                                            <td colspan="2" style="white-space: pre-wrap; word-wrap: break-word">{{item.Skill}}</td>
                                            <td>經歷</td>
                                            <td colspan="2" style="white-space: pre-wrap; word-wrap: break-word">{{item.Experience}}</td>
                                        </tr>
                                         <tr  :id="'trB'+item.EmployeeID"  style="display:none" class="table-success">
                                            <td>想說的話</td>
                                            <td colspan="5"  style="white-space: pre-wrap; word-wrap: break-word">{{item.WantToSay}}</td>             
                                        </tr>
                                  <%--  </templete>--%>
                                    
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
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetTrainerByPager(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetTrainerByPager(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetTrainerByPager(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetTrainerByPager(pager.totalPage)">&raquo;</a></li>
            </ul>

            <%--新增按鈕--%>
                <div class="theme-setting-wrapper">
                    <div id="settings-trigger">
                        <a href="5_4_2_ClassTeacherEditAdd.aspx" style="color: white">+</a>
                    </div>
                </div>


        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script>

        var app = new Vue({
            el: '#trainer',
            data: {
                myData: {
                    commentString: "",
                    courseEdit:null
                },
                pager: {
                    currentPage: null,
                    totalPage: null,
                    size: 5
                },
                trainerAry: []
            },
            methods: {
                GetTrainers: function () {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetTrainersDetail",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            app.trainerAry = result.d;
                        }
                    });
                    this.myData.courseEdit = document.getElementById('txpCourseEdit').value;
                },
                GetTrainerByPager: function (gotoPage) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetTrainerByPager",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                            var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage = (int3 % int2 > 0) ? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.trainerAry = result.d._Trainer;
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                    this.myData.courseEdit = document.getElementById('txpCourseEdit').value;
                },
                detailToggle: function (id) {
                    var tr1 = "#trA" + id;
                    $(tr1).toggle('slow');
                    var tr2 = "#trB" + id;
                    $(tr2).toggle('slow');
                }
            },
            created: function () {
                //this.GetTrainers();
                this.GetTrainerByPager(1);
            }
        });

        $(function () {

        })
    </script>
</asp:Content>
