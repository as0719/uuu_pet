<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>


<script runat="server">
    string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tmpMsg"] != null)
        {
            msg = "swal({ " +
                "title: '訊息', " +
                "text: '"+ Session["tmpMsg"] +"'," +
                "type: 'warning'," +
                "});";

            Session["tmpMsg"] = null;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #class i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
   一對一報名管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="app">
            <div class="form-group row">
                <div class="col-sm-1"></div>
                <div class="col-sm-2"><label class="col-form-label" >狀態: </label></div>
                <div class="col-sm-5">
                    <select class="form-control" v-model="courseStatus"  @change="GetCourseByPager(1)">
                        <option value="請選擇">請選擇</option>
                        <option value="新增">新增</option>
                        <option value="完成">完成</option>
                        <option value="取消">取消</option>     
                    </select>
                </div>
                <div class="col-sm-4"></div>
            </div>

            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                            <div class="alert alert-warning  " id="warning-alert">
                                <button type="button" class="close" data-dismiss="alert">x</button>
                                <strong>訊息</strong>
                                此課程有人報名無法刪除
                            </div>
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table table-hover">
                                <thead>
                                    <tr>
                                        <th class="ml-5">                          
                                        </th>
                                        <th>姓名</th>
                                        <th>連絡時間</th>
                                        <th>連絡電話</th>
                                        <th>電子郵件</th>
                                        <th>狀態</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="iForm in inquiryFormAry">
                                        <td>{{iForm.FormNo}}</td>
                                        <td>{{iForm.Q1}} </td>
                                        <td>{{iForm.Q5}}</td>
                                        <td>{{iForm.Q4}} </td>
                                        <td>{{iForm.Q7}} </td>                                        
                                        <td>
                                            <div class="badge badge-primary" v-if="iForm.Status == '完成'">{{iForm.Status}}</div>
                                            <div class="badge badge-info" v-else-if="iForm.Status == '新增'">{{iForm.Status}}</div>
                                            <div class="badge badge-danger" v-else-if="iForm.Status == '取消'">{{iForm.Status}}</div>
                                        </td>  
                                        <td>
                                            <div class="d-flex align-items-center">
                                                  <button type="button" class="btn btn-primary btn-sm btn-icon-text mr-3">
                                                    <a :href="'/b_05Class/5_3_2_OnebyoneClassView.aspx?id='+ iForm.FormNo +''" style="color: white">檢視</a>
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3" v-if="myData.courseEdit">
                                                    <a :href="'/b_05Class/5_3_3_OnebyoneClassEdit.aspx?id='+ iForm.FormNo +''" style="color: white">編輯</a>
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
            <div class="row">
             <div class="col-12 text-center">
                <ul class="pagination" v-if="pager.totalPage!=0">
                <li class="page-item disabled" v-if="pager.currentPage == 1">
                    <a href="#" class="page-link">&laquo;</a>
                </li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetCourseByPager(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetCourseByPager(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetCourseByPager(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetCourseByPager(pager.totalPage)">&raquo;</a></li>
                </ul>
             </div>
         </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%= msg %>
        var app = new Vue({
            el: '#app',
            data: {
                myData: {
                    commentString: "",
                    courseEdit:null
                },
                courseStatus:"請選擇",
                pager: {
                    currentPage: null,
                    totalPage: null,
                    size: 5
                },
                inquiryFormAry: []
            },
            methods: {
                GetInquiryForm: function () {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetAllinquiryForms",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            app.inquiryFormAry = result.d;
                        }
                    });
                    this.myData.courseEdit = document.getElementById('txpCourseEdit').value == 'block';
                },
                GetCourseByPager: function (gotoPage) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetInquiryFormByPager",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            status: this.courseStatus,
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                            var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage = (int3 % int2 > 0) ? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.inquiryFormAry = result.d._Course;
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                    this.myData.courseEdit = document.getElementById('txpCourseEdit').value == 'block';
                },
                chkCourseStatus: function (id) {
                    //檢核是否有人報名此課程
                    var boolChk = false;
                    var addNumber = 0;
                    var myData = [{ "id": id }];
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetGroupCourses",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(myData),
                        dataType: "json",
                        success: function (result) {
                            addNumber = result.d;
                        }
                    });
                    boolChk = addNumber == 0 ? true : false;
                    if (boolChk) {
                        if (confirm('確認要刪除？') == false) {
                            event.preventDefault();
                        }
                    }
                    else {
                        $("#warning-alert").show();
                        $("#warning-alertt").fadeTo(2000, 500).slideUp(500, function () {
                            $("#warning-alert").slideUp(500);
                        });
                        event.preventDefault();
                    }
                }

            },
            created: function () {
                //this.GetInquiryForm();
                this.GetCourseByPager(1);
                $("#warning-alert").hide();
            }
        });

    </script>
</asp:Content>
