<%@ Page Title="商城訂單細項" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = int.Parse(Request.QueryString["OrderNumber"]);

            OrderUtility orderUtility = new OrderUtility();
            List<MallOrdersDetail> mallOrdersDetails = orderUtility.GetOrderDetail(id);

            Repeater1.DataSource = mallOrdersDetails;
            Repeater1.DataBind();


            Label1.Text = orderUtility.GetOrder(id).SubTotal.ToString();
            Label2.Text = orderUtility.GetOrder(id).DiscountCode;
            Label3.Text = orderUtility.GetOrder(id).Total.ToString();
            Label4.Text = Request.QueryString["OrderNumber"];

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #shop i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    商城訂單細項
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">
                <div class="col-md-12  grid-margin">

                    <br />
                    <h5>訂單號碼: #<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h5>
                    <br />
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table">

                                <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th><strong>商品ID</strong></th>
                                                <th><strong>商品名稱</strong></th>
                                                <th><strong>商品規格</strong></th>
                                                <th><strong>商品單價</strong></th>
                                                <th><strong>個數</strong></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="width: 20px"><%#Eval("ProductID") %></td>
                                            <td style="width: 100px"><%#Eval("ProductName") %> </td>
                                            <td style="width: 100px"><%#Eval("Spec") %> </td>
                                            <td style="width: 100px">$<%#Eval("UnitPrice") %></td>
                                            <td style="width: 100px"><%#Eval("Number") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>

                                    </FooterTemplate>
                                </asp:Repeater>

                            </table>

                        </div>
                    </div>

                </div>
            </div>

            <div class="row">

                <div class="col-10"></div>
                <div class="col-2">
                    <div class="col-6 d-flex flex-column justify-content-between">
                        <p class="text-muted">總價</p>

                        <h4>$
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                        </h4>
                        <p class="text-muted">折扣</p>
                        <h4>
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h4>
                        <p class="text-black-50" ><strong>最終金額</strong></p>
                        <h4>$
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h4>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server"></asp:Content>
