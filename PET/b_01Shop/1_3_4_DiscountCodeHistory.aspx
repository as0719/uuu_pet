<%@ Page Title="已過期折扣碼" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallDiscountCodes " +
                "WHERE CONVERT (date, SYSDATETIME()) > EndDate", rpt_all, rpt_page, 0, 5);


            //DiscountUtility discountUtility = new DiscountUtility();
            //List<MallDiscountCode> mallDiscountCodes = discountUtility.GetAllDiscounts();


            //rpt_all.DataSource = mallDiscountCodes;
            //rpt_all.DataBind();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //OrderUtility orderUtility = new OrderUtility();

        if (String.IsNullOrEmpty(TextBox1.Text))
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallDiscountCodes", rpt_all, rpt_page, 0, 5);


            //List<MallOrder> mallOrders = orderUtility.GettAllOrders();

            //rpt_all.DataSource = mallOrders;
            //rpt_all.DataBind();
        }
        else
        {
            //判斷是否輸入數字(shop order id是數字)
            //int i = 0;
            //bool result = int.TryParse(TextBox1.Text, out i);
            //if (result == true)
            //{
            string search = TextBox1.Text;


            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater($"select * from MallDiscountCodes where DiscountCode = '{search}' ", rpt_all, rpt_page, 0, 5);

            //MallOrder mallOrder = orderUtility.GetOrder(search);
            //List<MallOrder> mallOrders = new List<MallOrder>();
            //mallOrders.Add(mallOrder);

            //rpt_all.DataSource = mallOrders;
            //rpt_all.DataBind();
            //}

        }

    }

    protected void rpt_page_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();

        //ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument);
        //pageUtility.test("select * from MallProducts", rpt_all, rpt_page);

        int PageNum = Convert.ToInt32(e.CommandArgument) - 1;
        pageUtility.BindRepeater("select * from MallDiscountCodes", rpt_all, rpt_page, PageNum, 5);
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
    已過期折扣碼
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">


                <div class="col-md-12 stretch-card">
                    <div class="card-body">


                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">折扣碼: </label>
                                &nbsp&nbsp&nbsp
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control col-3" placeholder="折扣碼"></asp:TextBox>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="Button2" runat="server" Text="搜尋" class="btn btn-primary" OnClick="Button2_Click" />
                                        &nbsp&nbsp&nbsp<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="1_3_DiscountCode.aspx">回上一頁</asp:HyperLink>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>



                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-2">


                            <asp:Repeater ID="rpt_all" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                            <tr>
                                                <%--<th class="col-1">編號</th>--%>
                                                <%--<th class="text-center"></th>--%>
                                                <th class="text-center"><strong>折扣碼</strong></th>
                                                <th class="text-center"><strong>折數</strong></th>
                                                <th class="text-center"><strong>開始日期</strong></th>
                                                <th class="text-center"><strong>結束日期</strong></th>
                                                <th class="text-center mallEditPermission"><strong>編輯</strong></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <%--<td><%#Eval("No") %></td>--%>
                                        <%--<td class="text-center"></td>--%>
                                        <td class="text-center"><strong><%#Eval("DiscountCode") %></strong></td>
                                        <td class="text-center"><%#Eval("NumberOfDiscounts") %> </td>
                                        <td class="text-center"><%#Eval("StartDate").ToString().Insert(4, "/").Insert(7, "/") %> </td>
                                        <td class="text-center"><%#Eval("EndDate").ToString().Insert(4, "/").Insert(7, "/") %> </td>
                                        <td class="text-center mallEditPermission">
                                            <div class="text-center">
                                                <a href="1_3_2_DiscountCodeEdit.aspx?id=<%#Eval("No") %>&DiscountCode=<%#Eval("DiscountCode") %>">
                                                    <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                        編輯
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                    </button>

                                                </a>
                                                <a href="1_3_3_DiscountCodeDelete.aspx?id=<%#Eval("No") %>&DiscountCode=<%#Eval("DiscountCode") %>">
                                                    <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                        刪除
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
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

                </div>

                <div class="col-md-12  text-center">
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
            <%--            <div class="row">
                <div class="col-11"></div>
                <div class="col-1">
                    <button type="button" class="btn btn-secondary btn-sm btn-icon-text mr-3">
                        新增
                    <i class="typcn typcn-edit btn-icon-append"></i>
                    </button>
                </div>
            </div>--%>


            <%--新增按鈕--%>
            <div class="container-fluid page-body-wrapper mallEditPermission">

                <div id="settings-trigger">

                    <a href="1_3_1_DiscountCodeAdd.aspx" style="color: white">+</a>
                </div>

            </div>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
     <script>
        $(function () {
            if ($("#txpMallEdit").val() == "none") {
                $(".mallEditPermission").remove();
            }
            
        })
     </script>
</asp:Content>