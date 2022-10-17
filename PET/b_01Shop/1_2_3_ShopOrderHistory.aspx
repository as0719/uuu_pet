<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallOrders " +
                "inner join Members " +
                "on Members.CustomerId = MallOrders.CustomerId " +
                "where MallOrders.OrderStatus = '已取消' " +
                "Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, 0, 5);

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        OrderUtility orderUtility = new OrderUtility();

        if (String.IsNullOrEmpty(TextBox1.Text))
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallOrders " +
                "inner join Members " +
                "on Members.CustomerId = MallOrders.CustomerId " +
                "where MallOrders.OrderStatus = '已取消' " +
                "Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, 0, 5);

        }
        else
        {
            //判斷是否輸入數字(shop order id是數字)
            int i = 0;
            bool result = int.TryParse(TextBox1.Text, out i);
            if (result == true)
            {
                int search = int.Parse(TextBox1.Text);


                PageUtility pageUtility = new PageUtility();
                pageUtility.BindRepeater($"select * from MallOrders " +
                    $"inner join Members " +
                    $"on Members.CustomerId = MallOrders.CustomerId " +
                    $"where MallOrders.OrderNumber = '{search}' " +
                    $"and MallOrders.OrderStatus = '已取消' " +
                    $"Order by MallOrders.OrderNumber DESC",
                    rpt_all, rpt_page, 0, 5);
            }

        }

    }

    protected void rpt_page_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();

        //ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument);
        //pageUtility.test("select * from MallProducts", rpt_all, rpt_page);

        int PageNum = Convert.ToInt32(e.CommandArgument) - 1;
        pageUtility.BindRepeater("select * from MallOrders " +
            "inner join Members " +
            "on MallOrders.CustomerId = Members.CustomerId " +
            "where MallOrders.OrderStatus = '已取消' " +
            "Order by MallOrders.OrderNumber DESC",
            rpt_all, rpt_page, PageNum, 5);
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
    已取消訂單
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">

            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card-body">
                        <%--<h4 class="card-title">Basic input groups</h4>--%>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">訂單號碼: </label>
                                &nbsp&nbsp&nbsp
                                        <asp:TextBox ID="TextBox1" runat="server" class="form-control col-3" placeholder="請輸入訂單號碼"></asp:TextBox>
                                <div class="col-sm-3">
                                    <%--<div class="input-group-append">--%>
                                    <asp:Button ID="Button1" runat="server" Text="搜尋" class="btn btn-primary" OnClick="Button2_Click" />
                                    <%--</div>--%>
                            &nbsp&nbsp&nbsp
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/b_01Shop/1_2_ShopOrder.aspx" class="col-form-label">回上一頁</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">


                            <asp:Repeater ID="rpt_all" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                            <tr>
                                                <th class="ml-5">訂單號碼</th>
                                                <th>訂購人</th>
                                                <th>Email</th>
                                                <th>總金額</th>
                                                <th>訂購日期</th>
                                                <th>訂單狀態</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>


                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <a href='<%#Eval("OrderNumber","1_2_1_ShopOrderDetail.aspx?OrderNumber={0}") %>'><%#Eval("OrderNumber") %></a>
                                        </td>
                                        <td><%#Eval("CustomerId") %></td>
                                        <td><%#Eval("Email") %></td>
                                        <td>$<%#Eval("Total") %></td>
                                        <td><%#Eval("OrderDate") %></td>
                                        <td>
                                            <div class="badge badge-primary"><%#Eval("OrderStatus") %></div>
                                        </td>
                                    </tr>
                                </ItemTemplate>


                                <FooterTemplate>
                                    </tbody>
                            </table>
                                </FooterTemplate>
                            </asp:Repeater>


                        </div>
                    </div>

                    <br />

                    <div class="btn-group" style="margin-left: 50%; position: static;">
                        <asp:Repeater ID="rpt_page" runat="server" OnItemCommand="rpt_page_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" class="btn btn-primary"
                                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server" ForeColor="White" Font-Bold="True">
                                    <%# Container.DataItem %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>

            </div>
            <!-- content-wrapper ends -->
        </div>
        <div style="text-align: center">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkPage"
                        Style="padding: 8px; margin: 2px; background: lightgray; border: solid 1px #666; color: black; font-weight: bold"
                        CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server" Font-Bold="True"><%# Container.DataItem %>  
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script>

        $(function () {
            $(".badge").each(function () {
                $(this).html();
                if ($(this).html() == "已取消") {
                    $(this).addClass("badge-danger")
                }
            })
        })



    </script>


</asp:Content>
