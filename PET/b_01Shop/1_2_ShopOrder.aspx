<%@ Page Title="商城訂單管理" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallOrders " +
                "inner join Members " +
                "on Members.CustomerId = MallOrders.CustomerId " +
                "where MallOrders.OrderStatus <> '已取消' " +
                "Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, 0, 5);

            //HiddenField1.Value = "nopermission";

            //OrderUtility orderUtility = new OrderUtility();
            //List<MallOrder> mallOrders = orderUtility.GettAllOrders();

            //rpt_all.DataSource = mallOrders;
            //rpt_all.DataBind();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        OrderUtility orderUtility = new OrderUtility();

        //沒有搜尋訂單號碼
        if (String.IsNullOrEmpty(TextBox1.Text))
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallOrders " +
                "inner join Members " +
                "on Members.CustomerId = MallOrders.CustomerId " +
                "where MallOrders.OrderStatus <> '已取消' " +
                "Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, 0, 5);

            //List<MallOrder> mallOrders = orderUtility.GettAllOrders();

            //rpt_all.DataSource = mallOrders;
            //rpt_all.DataBind();
        }
        else
        {
            //有搜尋訂單號碼
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
                    $"and MallOrders.OrderStatus <> '已取消' " +
                    $"Order by MallOrders.OrderNumber DESC",
                    rpt_all, rpt_page, 0, 5);

                //MallOrder mallOrder = orderUtility.GetOrder(search);
                //List<MallOrder> mallOrders = new List<MallOrder>();
                //mallOrders.Add(mallOrder);

                //rpt_all.DataSource = mallOrders;
                //rpt_all.DataBind();
            }

        }

        TextBox2.Text = "";
        DropDownList2.SelectedValue = "請選擇";
    }

    protected void rpt_page_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();
        int PageNum = Convert.ToInt32(e.CommandArgument) - 1;

        //ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument);
        //pageUtility.test("select * from MallProducts", rpt_all, rpt_page);

        if (TextBox1.Text != "")
        {
            int i = 0;
            bool result = int.TryParse(TextBox1.Text, out i);
            if (result == true)
            {
                int searchNo = int.Parse(TextBox1.Text);
                pageUtility.BindRepeater($"select * from MallOrders " +
                    $"inner join Members " +
                    $"on Members.CustomerId = MallOrders.CustomerId " +
                    $"where MallOrders.OrderNumber = '{searchNo}' " +
                    $"and MallOrders.OrderStatus <> '已取消' " +
                    $"Order by MallOrders.OrderNumber DESC",
                    rpt_all, rpt_page, PageNum, 5);

            }
        }
        else if (TextBox2.Text != "")
        {
            string searchEmail = TextBox2.Text;

            pageUtility.BindRepeater($"select * from MallOrders " +
                $"inner join Members " +
                $"on Members.CustomerId = MallOrders.CustomerId " +
                $"where Members.Email like '%{searchEmail}%' " +
                $"and MallOrders.OrderStatus <> '已取消' " +
                $"Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, PageNum, 5);

        }
        else if (DropDownList2.SelectedValue != "請選擇")
        {
            pageUtility.BindRepeater($"select * from MallOrders " +
                $"inner join Members " +
                $"on Members.CustomerId = MallOrders.CustomerId " +
                $"where MallOrders.OrderStatus = '{DropDownList2.SelectedItem.Text}' " +
                $"and Mallorders.OrderStatus <> '已取消' " +
                $"Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, PageNum, 5);
        }
        else
        {
            pageUtility.BindRepeater("select * from MallOrders " +
                "inner join Members " +
                "on MallOrders.CustomerId  = Members.CustomerId " +
                "where MallOrders.OrderStatus <> '已取消' " +
                "Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, PageNum, 5);
        }



    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "請選擇")
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater($"select * from MallOrders " +
                $"inner join Members " +
                $"on Members.CustomerId = MallOrders.CustomerId " +
                $"where Mallorders.OrderStatus <> '已取消' " +
                $"Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, 0, 5);
        }
        else
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater($"select * from MallOrders " +
                $"inner join Members " +
                $"on Members.CustomerId = MallOrders.CustomerId " +
                $"where MallOrders.OrderStatus = '{DropDownList2.SelectedItem.Text}' " +
                $"and Mallorders.OrderStatus <> '已取消' " +
                $"Order by MallOrders.OrderNumber DESC",
                rpt_all, rpt_page, 0, 5);

        }
        TextBox2.Text = "";
        TextBox1.Text = "";
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        OrderUtility orderUtility = new OrderUtility();
        PageUtility pageUtility = new PageUtility();

        //沒有搜尋訂購人email
        if (String.IsNullOrEmpty(TextBox2.Text))
        {
            pageUtility.BindRepeater("select * from MallOrders " +
                "inner join Members " +
                "on Members.CustomerId = MallOrders.CustomerId " +
                "where MallOrders.OrderStatus <> '已取消' " +
                "Order by CONVERT(date,MallOrders.OrderDate) DESC",
                rpt_all, rpt_page, 0, 5);


        }
        else
        {
            string search = TextBox2.Text;

            pageUtility.BindRepeater($"select * from MallOrders " +
                $"inner join Members " +
                $"on Members.CustomerId = MallOrders.CustomerId " +
                $"where Members.Email like '%{search}%' " +
                $"and MallOrders.OrderStatus <> '已取消' " +
                $"Order by CONVERT(date,MallOrders.OrderDate) DESC",
                rpt_all, rpt_page, 0, 5);

        }
        TextBox1.Text = "";
        DropDownList2.SelectedValue = "請選擇";

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
    商城訂單管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel" id="app">
        <div class="content-wrapper">

            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card-body">
                        <%--<h4 class="card-title">Basic input groups</h4>--%>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">訂單號碼: </label>
                                &nbsp&nbsp&nbsp
                            <%--<input type="text" class="form-control" placeholder="訂單號碼">--%>
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control col-3" placeholder="請輸入訂單號碼"></asp:TextBox>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="Button2" runat="server" Text="搜尋" class="btn btn-primary" OnClick="Button2_Click" />
                                        &nbsp&nbsp&nbsp<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="1_2_3_ShopOrderHistory.aspx">已取消訂單</asp:HyperLink>
                                    </div>
                                </div>

                            </div>
                            <div class="input-group">
                                <label class="col-form-label">訂購人: </label>
                                &nbsp&nbsp&nbsp
                            <%--<input type="text" class="form-control" placeholder="訂單號碼">--%>
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control col-3" placeholder="請輸入訂購人Email"></asp:TextBox>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="Button3" runat="server" Text="搜尋" class="btn btn-primary" OnClick="Button3_Click" />
                                    </div>
                                </div>

                            </div>


                            <div class="input-group">
                                <label class="col-form-label">訂單狀態: </label>
                                &nbsp&nbsp&nbsp
                                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control col-3" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem>請選擇</asp:ListItem>
                                    <asp:ListItem>已建立</asp:ListItem>
                                    <asp:ListItem>備貨中</asp:ListItem>
                                    <asp:ListItem>配送中</asp:ListItem>
                                    <asp:ListItem>已完成</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <%--</div>--%>

                <%--<div class="row">--%>
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-2">
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:Repeater ID="rpt_all" runat="server">


                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><strong>訂單號碼</strong></th>
                                                <th class="text-center"><strong>訂購人</strong></th>
                                                <th class="text-center"><strong>Email</strong></th>
                                                <th class="text-center"><strong>總金額</strong></th>
                                                <th class="text-center"><strong>訂購日期</strong></th>
                                                <th class="text-center"><strong>訂單狀態</strong></th>
                                                <th class="text-center"><strong>編輯</strong></th>
                                                <%--<th class="text-center"><strong class="editelement">編輯</strong>--%></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <tr>
                                        <td class="text-center"><%#Eval("OrderNumber") %></td>
                                        <td class="text-center"><%#Eval("CustomerName") %></td>
                                        <td class="text-center">
                                            <a href="../b_02Member/2_2_MemberOrder.aspx?id=<%#Eval("CustomerId") %>">
                                                <%#Eval("Email") %>
                                            </a></td>
                                        <td class="text-center">$<%#Eval("Total") %></td>
                                        <td class="text-center"><%#Eval("OrderDate") %></td>
                                        <td class="text-center">
                                            <div class="badge"><%#Eval("OrderStatus") %></div>
                                        </td>
                                        <td class="text-center">
                                            <div class="text-center ">
                                                <%--<div class="d-flex align-items-center">--%>
                                                <a href="1_2_1_ShopOrderDetail.aspx?OrderNumber=<%#Eval("OrderNumber") %>">
                                                    <button type="button" class="btn btn-info btn-sm btn-icon-text mr-3 ">
                                                        檢視
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                    </button>
                                                </a>
                                                <a href="1_2_2_ShopOrderStatus.aspx?OrderNumber=<%#Eval("OrderNumber") %>">
                                                    <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3 mallEditPermission">
                                                        編輯
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                    </button>
                                                </a>

                                            </div>
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


                </div>

                <div class="col-md-12 text-center">
                    <div class="btn-group">
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

        </div>
        <!-- content-wrapper ends -->
    </div>
    <div style="text-align: center">
        <%--OnItemCommand="Repeater1_ItemCommand"--%>
        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="lnkPage"
                    Style="padding: 8px; margin: 2px; background: lightgray; border: solid 1px #666; color: black; font-weight: bold"
                    CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server" Font-Bold="True"><%# Container.DataItem %>  
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script>

        $(function () {
            $(".badge").each(function () {
                $(this).html();
                if ($(this).html() == "已完成") {
                    $(this).addClass("badge-primary")
                }
                if ($(this).html() == "配送中") {
                    $(this).addClass("badge-warning")
                }
                if ($(this).html() == "已建立") {
                    $(this).addClass("badge-info")
                }
                if ($(this).html() == "備貨中") {
                    $(this).addClass("badge-dark")
                }
            })
        })


        $(function () {
            $("#BodyHolder_Button2").click(function () {
                if ($(".a").html().each(function () {
                    $(this).contains($("#BodyHolder_TextBox1").html())
                })) {
                    event.preventDefault();
                    alert("已無庫存");

                }
            })

            //if ($("#BodyHolder_HiddenField1").val() == "nopermission") {
            //    //$(".editelement").css("display", "none");
            //    $(".editelement").remove();

            //}
            $(function () {
                if ($("#txpMallEdit").val() == "none") {
                    $(".mallEditPermission").remove();
                }

            })

        })


    </script>

</asp:Content>
