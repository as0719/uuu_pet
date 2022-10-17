<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" Runat="Server">
     <div class="container mt-3 pt-4 pb-4" id="app">
         <div class="row">
             <div class="col-12 col-sm-6 col-md-4 col-lg-3" v-for="item in courseAry">
                 <div class="card" >
                     <div class="card-header bg-dark text-white text-center">{{item.CourseName}}</div>
                     <div class="card-body bg-light">                         
                         <p class="card-text">簡介：{{item.Introduction}}</p>
                         <p class="card-text">日期：{{item.StartDate}} <small>{{item.StartTime}}~{{item.EndTime}}</small></p>
                     </div>
                     <div class="card-footer text-center">
                         <a :href="'/f_training/classTeamAdd.aspx?id='+ item.CourseID " v-if="item.MaximumPeople > item.JoinPeopleNumber && item.MaximumPet> item.JoinPetNumber" class="btn btn-primary" >報名</a>
                         <a :href="'/f_training/classTeamAdd.aspx?id='+ item.CourseID " class="btn btn-dark disabled" v-else>報名已額滿</a>
                     </div>
                 </div>
             </div>

         </div>
         <div class="row">
             <div class="col-12 text-center">
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
             </div>
         </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" Runat="Server">
     <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
     <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_training/classteam.aspx']").addClass("active");
            $("a[href='/f_training/classteam.aspx']").parent().prev().addClass("active");

            var app = new Vue({
                el: '#app',
                data: {
                    myData: {
                        commentString: "",
                    },
                    pager: {
                        currentPage: null,
                        totalPage: null,
                        size: 8
                    },
                    courseActive:null,
                    courseAry: []
                },
                methods: {
                    GetCourse: function () {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/GetGroupCourseActives",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                app.courseAry = result.d;
                            }
                        });
                    },
                    GetCourseByPager: function (gotoPage) {
                        pager = [{ "pageSize": 3, "pageIndex": 1 }];
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/GetCourseByPager",
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
                                alert(event.responseText);
                            }
                        });
                    },
                    chkCourseActive: function (courseDate) {
                        var today = new Date();
                        var dd = String(today.getDate()).padStart(2, '0');
                        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                        var yyyy = today.getFullYear();
                        numToday = yyyy +"/"+ mm +"/"+ dd;
                        return courseDate > numToday;
                    }
                },
                created: function () {
                    //this.GetCourse(); 
                    this.GetCourseByPager(1);
                }
            });
        })


     </script>
</asp:Content>

