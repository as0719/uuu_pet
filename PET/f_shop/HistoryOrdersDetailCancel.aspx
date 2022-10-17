<%@ Page Title="歷史訂單細項" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">



    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = int.Parse(Request.QueryString["OrderNumber"]);

            OrderUtility orderUtility = new OrderUtility();
            MallOrder mallOrder = orderUtility.GetOrder(id);
            List<MallOrdersDetail> mallOrdersDetails = orderUtility.GetOrderDetail(id);

            rpt_all.DataSource = mallOrdersDetails;
            rpt_all.DataBind();

            Label1.Text = Request.QueryString["OrderNumber"];
            lbl_Discount.Text = mallOrdersDetails[0].DiscountAmount.ToString();
            lbl_SubAmount.Text = mallOrder.SubTotal.ToString();
            lbl_TotalAmount.Text = mallOrder.Total.ToString();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["OrderNumber"]);

        OrderUtility orderUtility = new OrderUtility();
        MallOrder mallOrder = orderUtility.GetOrder(id);

        mallOrder.OrderStatus = "已取消";

        orderUtility.OrderEdit(mallOrder);


        Response.Redirect("HistoryOrders.aspx");
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <style>
        .card-img,
        .card-img-top,
        .card-img-bottom {
            height: 100%
        }

        body {
            font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        /*.list-group-item {
            border: 0px;
        }*/
    </style>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="container mt-3 pt-4 pb-4">

        <br />
        <%--        <div class="row">--%>
        <h3 class="text-center">
            <strong>訂單號碼:
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></strong>
        </h3>


        <div id="divConfirm"></div>



        <%--</div>--%>
        <%--        <h3 class="text-center">
            <strong>歷史訂單</strong>
            <img class="align-items-end" src="img/search-interface-symbol.png" style="width: 25px" />
        </h3>--%>

        <br />
        <%--<div class="container pt-5">--%>
        <%--<div class="container-fluid">--%>
        <div class="row">


            <%--px-xl-5--%>
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 400px;">品名</th>
                            <th style="width: 300px;">規格</th>
                            <th style="width: 200px;">單價</th>
                            <th style="width: 150px;">數量</th>
                            <%--<th style="width: 150px;">金額</th>--%>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <asp:Repeater ID="rpt_all" runat="server">

                            <ItemTemplate>

                                <tr>
                                    <td class="align-middle"><%# Eval("ProductName") %></td>
                                    <td class="align-middle"><%# Eval("Spec") %></td>
                                    <td class="align-middle">$<%# Eval("UnitPrice") %></td>
                                    <td class="align-middle"><%# Eval("Number") %></td>
                                    <%--<td class="align-middle">$<%# Eval("SubTotal") %></td>--%>
                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>



            </div>



        </div>

        <div class="row">
            <div class="col-lg-4 mb-4"></div>
            <div class="col-lg-4 mb-4">
                <div class="card border-0">

                    <div class="card-body text-center p-0">

                        <br />

                        <div>
                            <h5>小計: 
                                $<asp:Label ID="lbl_SubAmount" runat="server" Text="0"></asp:Label>
                            </h5>
                        </div>
                        <div>
                            <h5>折扣金額: $<asp:Label ID="lbl_Discount" runat="server"></asp:Label></h5>
                        </div>

                        <br />
                        <br />
                        <div>
                            <h5>總金額: </h5>
                            <h2><span>$<asp:Label ID="lbl_TotalAmount" runat="server" Text="0"></asp:Label>
                            </span>
                            </h2>
                        </div>
                        <%--<a href="HistoryOrders.aspx" class="btn btn-primary">回歷史訂單</a>--%>
                        <br />
                        <%--<a href="HistoryOrders.aspx" class="btn btn-warning">取消訂單</a>--%>
                    </div>
                    <br />
                    <div class="card-footer border-0 p-0">
                        <asp:Button ID="Button1" runat="server" Text="確認取消" class="btn btn-warning btn-block p-3" OnClick="Button1_Click" />
                        <a href="HistoryOrders.aspx" class="btn btn-primary btn-block p-3">回歷史訂單</a>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <!-- Cart End -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
</asp:Content>

