<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false || DropDownList1.SelectedValue == "請選擇類別")
        {
            //ProductUtility productUtility = new ProductUtility();
            //List<MallProduct> mallProducts = productUtility.GetAllProducts();
            //Repeater1.DataSource = mallProducts;
            //Repeater1.DataBind();

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallProducts", rpt_all, rpt_page, 0, 6);

        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue != "請選擇類別")
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater($"select * from MallProducts where Category = '{DropDownList1.SelectedValue}'", rpt_all, rpt_page, 0, 6);


            //ProductUtility productUtility = new ProductUtility();
            //List<MallProduct> mallProducts = productUtility.GetAllProducts_cate(DropDownList1.SelectedValue);


            //rpt_all.DataSource = mallProducts;
            //rpt_all.DataBind();
        }
        else
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallProducts", rpt_all, rpt_page, 0, 6);
        }


    }


    protected void rpt_page_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();

        //ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument);
        //pageUtility.test("select * from MallProducts", rpt_all, rpt_page);
        int PageNum = Convert.ToInt32(e.CommandArgument) - 1;

        if (DropDownList1.SelectedValue != "請選擇類別")
        {
            pageUtility.BindRepeater($"select * from MallProducts where Category = '{DropDownList1.SelectedValue}'", rpt_all, rpt_page, PageNum, 6);
        }
        else
        {
            pageUtility.BindRepeater("select * from MallProducts", rpt_all, rpt_page, PageNum, 6);
        }
    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <%--    <style>
        .card-img,
        .card-img-top,
        .card-img-bottom {
            width: 100%;
            height: 100%;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="container mt-3 pt-4 pb-4">

        <div class="col-12 text-dark">
            <%--<h1>商城</h1>--%>
            <!-- Blog Start -->
            <div class="container pt-5">

                <div>
                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>請選擇類別</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=PetHotel;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Category] FROM [MallProducts]"></asp:SqlDataSource>
                </div>

                <br />

                <asp:Repeater ID="rpt_all" runat="server">
                    <HeaderTemplate>
                        <div class="row pb-3">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-lg-4 mb-4">
                            <div class="card border-0 mb-2">
                                <a href="detail.aspx?ProductID=<%#Eval("ProductID") %>">
                                    <img class="card-img-top" src="../ShopImages/<%#Eval("ImageUrl") %>" alt="">
                                </a>
                                <div class="card-body bg-light p-4">
                                    <h4 class="card-title text-truncate"><a href="detail.aspx?ProductID=<%#Eval("ProductID") %>"><%#Eval("ProductName") %></a></h4>
                                    <%-- <div class="d-flex mb-3">--%>
                                    <br />

                                    <div>庫存: <%#Eval("Stock") %></div>
                                    <div>規格: <%#Eval("Spec") %></div>

                                    <br />
                                    <h5>售價: <strong><%#Eval("Price") %> 元</strong> </h5>

                                    <%--<a class="font-weight-bold" href="detail.aspx?ProductID=<%#Eval("ProductID") %>">Read More</a>--%>
                                    <%--<a href="" class="btn btn-sm btn-primary">Add to cart</a>--%>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>

                    </FooterTemplate>
                </asp:Repeater>

                <div class="col-lg-12">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-4">
                            <asp:Repeater ID="rpt_page" runat="server" OnItemCommand="rpt_page_ItemCommand">
                                <ItemTemplate>
                                    <li class="page-item ">
                                        <asp:LinkButton ID="btnPage" class="page-link"
                                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                            runat="server" Font-Bold="True">
                                    <%# Container.DataItem %>
                                        </asp:LinkButton>
                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </nav>
                </div>

            </div>
            <!-- Blog End -->

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script>

        //$(document).ready(function () {
        //    $('li').click(function () {
        //        $(this).addClass('active');
        //    });
        //    $('.active').click(function () {
        //        $("li .active").removeClass('active');
        //        $(this).addClass('active');
        //    });
        //});


        $(document).ready(function () {
            $('li').click(function () {
                $('li.active').removeClass("active");
                $(this).addClass("active");
            });
        });

    </script>
</asp:Content>

