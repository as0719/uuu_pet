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
    課程資訊管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="courseInfo">


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
                                            #</th>
                                        <th>課程名稱</th>
                                        <th>簡介</th>
                                        <th>日期</th>
                                        <th>時間(起)</th>
                                        <th>時間(迄)</th>
                                        <th>人數上限</th>
                                        <th>寵物數上限</th>
                                        <th>                                                                                              
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="course in courseAry">
                                        <td>{{course.CourseID}}</td>
                                        <td>{{course.CourseName}} </td>
                                        <td>{{showIntroduction(course.Introduction)}} </td>
                                        <td>{{course.StartDate}} </td>
                                        <td>{{course.StartTime}}</td>
                                        <td>{{course.EndTime}}</td>
                                        <td>{{course.MaximumPeople}}</td>
                                        <td>{{course.MaximumPet}}</td>
                                        <td>
                                            <div class="d-flex align-items-center" v-if="">
                                                  <button type="button" class="btn btn-primary btn-sm btn-icon-text mr-3">
                                                    <a :href="'/b_05Class/5_1_4_ClassInfoDetail.aspx?id='+ course.CourseID +''" style="color: white">報名情形</a>
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                </button>

                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3" v-if="myData.courseEdit">
                                                    <a :href="'/b_05Class/5_1_2_ClassInfoEdit.aspx?id='+ course.CourseID +''" style="color: white">編輯</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <a :href="'/b_05Class/5_1_3_ClassInfoDelete.aspx?id='+ course.CourseID +''" 
                                                    class="btn btn-danger btn-sm btn-icon-text mr-3"
                                                    @click="chkCourseStatus(course.CourseID)" v-if="myData.courseEdit">
                                                         刪除
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                 </a>
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
            <%--新增按鈕--%>
                <div class="theme-setting-wrapper">
                    <div id="settings-trigger">
                        <a href="5_1_1_ClassInfoAdd.aspx" style="color: white">+</a>
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
            el: '#courseInfo',
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
                courseAry: []
            },
            methods: {
                GetCourse: function () {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetGroupCourses",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            app.courseAry = result.d;
                        }
                    });
                    this.myData.courseEdit = document.getElementById('txpCourseEdit').value=='block';
                },
                GetCourseByPager: function (gotoPage) {
                    pager = [{ "pageSize": 3, "pageIndex": 1 }];
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetAllCourseByPager",
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
                            app.courseAry = result.d._Course;
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
                },
                showIntroduction: function (intr) {
                    if (intr.length > 10) {
                        return intr.slice(0, 9) + "...";
                    }
                    else {
                        return intr;
                    }
                }

            },
            created: function () {
                //this.GetCourse();
                this.GetCourseByPager(1);
                $("#warning-alert").hide();
            }
        });

    </script>
</asp:Content>
