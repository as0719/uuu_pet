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

            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table table-hover">
                                <thead>
                                    <tr>
                                        <th class="ml-5">#</th>
                                        <th>折扣碼</th>
                                        <th>總金額</th>
                                        <th>訂購日期</th>
                                        <th>訂單狀態</th>
                                        <th>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="o in orderAry">
                                        <td>{{o.OrderNumber}}</td>
                                        <td>{{o.DiscountCode}} </td>
                                        <td>{{o.Total}} </td>
                                        <td>{{o.OrderDate}} {{o.OrderTime}} </td>
                                        <td>
                                            <div class="badge badge-primary" v-if="o.OrderStatus == '已完成'">{{o.OrderStatus}}</div>
                                            <div class="badge badge-warning" v-else-if="o.OrderStatus == '配送中'">{{o.OrderStatus}}</div>
                                            <div class="badge badge-info" v-else-if="o.OrderStatus == '已建立'">{{o.OrderStatus}}</div>
                                            <div class="badge badge-danger" v-else-if="o.OrderStatus == '已取消'">{{o.OrderStatus}}</div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-secondary btn-sm btn-icon-text mr-3" >
                                                    <a :href="'/b_01Shop/1_2_1_ShopOrderDetail.aspx?OrderNumber='+ o.OrderNumber +''" style="color: white">查看明細</a>
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
            <ul class="pagination" v-if="pager.totalPage!=0">
                <li class="page-item disabled" v-if="pager.currentPage == 1">
                    <a href="#" class="page-link">&laquo;</a>
                </li>
                <li class="page-item" v-else><a href="" class="page-link" @click="GetOrderByPagerBtn(1)">&laquo;</a></li>
                <template v-for="p in pager.totalPage">
                    <li class="active page-item" v-if="pager.currentPage == p">
                        <a href="#" class="page-link"  @click="GetOrderByPagerBtn(p)">{{p}}</a>
                    </li>
                    <li class="page-item" v-else><a href="#" class="page-link" @click="GetOrderByPagerBtn(p)">{{p}}</a></li>
                </template>        
                <li class="page-item disabled" v-if="pager.currentPage == pager.totalPage"><a href="#" class="page-link">&raquo;</a></li>
                <li class="page-item" v-else><a href="#" class="page-link" @click="GetOrderByPagerBtn(pager.totalPage)">&raquo;</a></li>
            </ul>

            <%--回列表--%>
            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a :href="'/b_02Member/2_1_Member.aspx?id=' + myData.customerId+''" title="回列表">
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

        var app = new Vue({
            el: '#app',
            data: {
                myData: {
                    commentString: "",
                    customerId: null,
                },
                pager: {
                    currentPage: null,
                    totalPage: null,
                    size:5
                },
                orderAry: []
            },
            methods: {
                GetOrderByPager: function (gotoPage) {
                    var getUrl = document.URL;
                    var url = getUrl.split('=');
                    eid = url[1];
                    this.myData.customerId = eid;
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetMemberOrderByPager",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            id:Number(eid),
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                           var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage =  (int3 % int2 > 0)? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.orderAry = result.d._mallOrders;

                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                },
                GetOrderByPagerBtn: function (gotoPage) {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetMemberOrderByPager",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            id: Number(this.myData.customerId),
                            pageSize: this.pager.size,
                            pageIndex: gotoPage
                        }),
                        success: function (result) {
                            var int1 = app.pager.currentPage = gotoPage;
                            var int2 = app.pager.size;
                            var int3 = result.d.TotalCount;
                            app.pager.totalPage = (int3 % int2 > 0) ? parseInt((int3 / int2)) + 1 : parseInt((int3 / int2));
                            app.orderAry = result.d._mallOrders;
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                }
            },
            created: function () {
                this.GetOrderByPager(1);

            }
        });

     
    </script>
</asp:Content>
