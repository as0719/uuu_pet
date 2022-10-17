<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #member i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    會員管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="app">
             <div class="form-group row">
                <div class="col-sm-1"></div>
                <label for="BodyHolder_txtSearchKey" class="col-sm-2 col-form-label text-right">快速查詢姓名：</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtSearchKey" CssClass="form-control" v-model="myData.searchName" placeholder="查詢姓名" runat="server"></asp:TextBox>                    
                </div>
                <div class="col-sm-5">                    
                    <input type="button" class="btn btn-primary btn-icon-text"  value="搜尋" @click="GetSearchMemberByPager(myData.searchName,1)"/>
                </div>
             </div>

            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table table-hover">
                                <thead>
                                    <tr>
                                        <th class="ml-5">#</th>
                                        <th>姓名</th>
                                        <th>電子郵件</th>
                                        <th>手機</th>
                                        <th>備註</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="m in memberAry">
                                        <td>{{m.CustomerId}}</td>
                                        <td>{{m.CustomerName}} </td>
                                        <td>{{m.Email}} </td>
                                        <td>{{m.Phone}} </td>
                                        <td>{{m.Remark}}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3" v-if="myData.memberEdit=='block'">
                                                    <a :href="'/b_02Member/2_1_1_MemberEdit.aspx?id='+ m.CustomerId +''" style="color: white">編輯</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-secondary btn-sm btn-icon-text mr-3">
                                                    <a :href="'/b_02Member/2_2_MemberOrder.aspx?id='+ m.CustomerId +''" style="color: white">訂單資訊</a>
                                                    <i class="typcn typcn-document btn-icon-append"></i>
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
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetMemberByPager(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetMemberByPager(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetMemberByPager(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetMemberByPager(pager.totalPage)">&raquo;</a></li>
            </ul>


        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script>

        var app = new Vue({
            el: '#app',
            data: {
                myData: {
                    commentString: "",
                    memberEdit: null,
                    searchName:null
                },
                pager: {
                    currentPage: null,
                    totalPage: null,
                    size:5
                },
                memberAry: []
            },
            methods: {
                GetMemberByPager: function (gotoPage) {
                    //pager = [{ "pageSize": 5, "pageIndex": 1 }];
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetMemberByPage",
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
                            app.pager.totalPage =  (int3 % int2 > 0)? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.memberAry = result.d._Members;
                            //alert(app.pager.totalPage);
                        },
                        error: function (event) {
                            alert(event.responseText);
                        }
                    });
                    this.myData.memberEdit = document.getElementById('txpMemberEdit').value;
                },
                GetSearchMemberByPager: function (searchKey,gotoPage) {
                    //pager = [{ "pageSize": 5, "pageIndex": 1 }];
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GeSearchMemberByPage",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            keyName : searchKey,
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                            var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage = (int3 % int2 > 0) ? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.memberAry = result.d._Members;
                            //alert(app.pager.totalPage);
                        },
                        error: function (event) {
                            alert(event.responseText);
                        }
                    });                    
                }
            },
            created: function () {
                this.GetMemberByPager(1);

            }
        });

    </script>
</asp:Content>
