<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>


<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
       
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
        <div class="content-wrapper" id="app">
            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table table-hover">
                                <thead>
                                    <tr class="table-primary text-center">
                                        <th colspan="7">{{courseName}}</th>
                                    </tr>
                                    <tr>
                                        <th>報名人姓名</th>
                                        <th>手機</th>
                                        <th>Email</th>
                                        <th>報名人數</th>
                                        <th>報名寵物數</th>
                                        <th>報名時間</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="course in courseRegisterAry">
                                        <td>{{course.ApplicantName}}</td>
                                        <td>{{course.PhoneNumber}} </td>
                                        <td>{{course.Email}} </td>
                                        <td>{{course.JoinPeopleNumber}} </td>
                                        <td>{{course.JoinPetNumber}}</td>                                        
                                        <td>{{course.RegistrationDate}} {{course.RegistrationTime }}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                  <button type="button" class="btn btn-danger btn-sm btn-icon-text mr-3">
                                                    <a :href="'/b_05Class/5_1_5_ClassInfoDetailDelete.aspx?id='+ course.CourseRegisterID +'&cid='+ course.CourseID +''" onclick="return confirm('確認要刪除？')" style="color: white">刪除</a>
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
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
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetCourseDetailByPager(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetCourseDetailByPager(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetCourseDetailByPager(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetCourseDetailByPager(pager.totalPage)">&raquo;</a></li>
            </ul>

            <%--回列表--%>
            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="/b_05Class/5_1_ClassInfo.aspx" title="回列表">
                        <i class="typcn typcn-arrow-back  btn-icon-append" style="font-size: 1.5em; padding: 0; margin: 0"></i>
                    </a>                  
                </div>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>

    <script>

        var getUrl = document.URL;
        var url = getUrl.split('=');
        eid = url[1];
        var app = new Vue({
            el: '#app',
            data: {
                myData: {
                    id: eid,
                },
                pager: {
                    currentPage: null,
                    totalPage: null,
                    size: 5
                },
                courseName:"",
                courseRegisterAry: []
            },
            methods: {
                GetCourseDetail: function () {
                    var cData = [{"id":Number(eid)}];
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetCourseRegistrationsByID",
                        data: JSON.stringify(this.myData),
                        contentType: "application/json; charset=utf-8",                        
                        dataType: "json",
                        success: function (result) {
                            app.courseRegisterAry = result.d;
                            app.courseName = result.d[0].CourseName;
                        }
                    });
                },
                GetCourseDetailByPager: function (gotoPage) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetCourseRegistrationsByIDByPager",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            id: Number(eid),
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                            var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage = (int3 % int2 > 0) ? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.courseRegisterAry = result.d._Course;
                            app.courseName = result.d._Course[0].CourseName;
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                },

            },
            created: function () {
                //this.GetCourseDetail();
                this.GetCourseDetailByPager(1);
            }
        });

    </script>
</asp:Content>
