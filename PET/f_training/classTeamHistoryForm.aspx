<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" Runat="Server">
    <%--<link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" Runat="Server">
     <div class="container mt-3 pt-4 pb-4" id="app">
         <div class="row">
             <div class="col-sm-2">
             </div>
             <div class="col-sm-10">
                <div class="form-group row">    
                    <label for="BodyHolder_txtPhone" class="col-form-label col-sm-2 text-primary font-weight-bolder text-right">手機 </label>
                    <asp:TextBox ID="txtPhone" v-model="myData.phone" CssClass="form-control col-sm-5" placeholder="報名手機" runat="server" ></asp:TextBox>
                </div>
            </div>
             <div class="col-sm-2">
             </div>
             <div class="col-md-10">
                <div class="form-group row">      
                    <label for="BodyHolder_txtEmail" class="col-form-label col-sm-2 text-primary font-weight-bolder text-right">Email </label>
                    <asp:TextBox ID="txtEmail" v-model="myData.email" CssClass="form-control col-sm-5" placeholder="報名Email"  runat="server" TextMode="Email"></asp:TextBox>
                </div>
             </div>
             <div class="col-md-12 text-center">
                 <input type="button" class="btn btn-secondary" @click="SetDemoData()" value="demo" />
                 <input type="button" class="btn btn-primary" @click="GetReserveData(1)" value="查詢" />
             </div>


         <div class="col-md-12  grid-margin">
                    <%--<div class="card">--%>
                    <div>
                        <div class="table-responsive pt-3">
                            <table class="table table-light project-orders-table table-hover">                            
                                <thead class="thead-dark">
                                    <tr v-if="pager.totalPage!=0">
                                        <th class="ml-5">#</th>
                                        <th>姓名</th>
                                        <th>連絡時間</th>
                                        <th>連絡電話</th>                                        
                                        <th>電子郵件</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="c in courseAry">
                                        <td>{{c.FormNo}}</td>
                                        <td>{{c.Q1}} </td>
                                        <td>{{c.Q5}} </td>
                                        <td>{{c.Q4}} </td>                                        
                                        <td>{{c.Q7}}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <a :href="'/f_training/classTeamFormView.aspx?id='+ c.FormNo +''" 
                                                    class="btn btn-info btn-sm btn-icon-text mr-3"  style="color: white">
                                                         檢視
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                 </a>
                                                <a :href="'/f_training/classTeamFormEdit.aspx?id='+ c.FormNo +''" 
                                                    class="btn btn-secondary btn-sm btn-icon-text mr-3"  style="color: white">
                                                         編輯
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                 </a>
                                                <a :href="'/f_training/classTeamFormDelete.aspx?id='+ c.FormNo +''" 
                                                    class="btn btn-danger btn-sm btn-icon-text mr-3"  onclick="return confirm('確認要刪除？')" style="color: white">
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

            <ul class="pagination" v-if="pager.totalPage!=0">
                <li class="page-item disabled" v-if="pager.currentPage == 1">
                    <a href="#" class="page-link">&laquo;</a>
                </li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetReserveData(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetReserveData(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetReserveData(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetReserveData(pager.totalPage)">&raquo;</a></li>
            </ul>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" Runat="Server">
     <script>

         $(function () {
             $("#navbarCollapse div").children("a").removeClass("active");
             $("a[href='/f_training/classTeamHistoryForm.aspx']").addClass("active");
             $("a[href='/f_training/classTeamHistoryForm.aspx']").parent().prev().addClass("active");

             var app = new Vue({
                 el: '#app',
                 data: {
                     myData: {
                         phone: null,
                         email: null
                     },
                     pager: {
                         currentPage: null,
                         totalPage: 0,
                         size: 5
                     },
                     courseAry: []
                 },
                 methods: {
                     GetReserveData: function (gotoPage) {
                         if (this.myData.phone == "" || this.myData.email == "" || this.myData.phone == null || this.myData.email == null) {
                             swal({
                                 title: '訊息',
                                 text: '請輸入手機、email',
                                 type: 'info'
                             });
                         }
                         else {
                             $.ajax({
                                 type: "POST",
                                 url: "/WebService.asmx/GetInquiryFormByPhoneEmailByPager",
                                 contentType: "application/json; charset=utf-8",
                                 dataType: "json",
                                 //async: false,
                                 data: JSON.stringify({
                                     phone: this.myData.phone,
                                     email: this.myData.email,
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
                         }
                     },
                     SetDemoData: function () {
                         this.myData.phone = "0965565418";
                         this.myData.email = "pami@pami.com";
                     }
                 }
             });
         })


     </script>
</asp:Content>

