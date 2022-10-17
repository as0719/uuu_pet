<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>


<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallProducts", rpt_all, rpt_page, 0, 5);

            //pageUtility.test("select * from MallProducts", rpt_all, rpt_page);

            //ProductUtility productUtility = new ProductUtility();
            //List<MallProduct> mallProducts = productUtility.GetAllProducts();

            //rpt_all.DataSource = mallProducts;
            //rpt_all.DataBind();

        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //OrderUtility orderUtility = new OrderUtility();

        if (String.IsNullOrEmpty(TextBox1.Text))
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from MallProducts", rpt_all, rpt_page, 0, 5);

            //List<MallOrder> mallOrders = orderUtility.GettAllOrders();

            //rpt_all.DataSource = mallOrders;
            //rpt_all.DataBind();
        }
        else
        {
            string search = TextBox1.Text;

            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater($"select * from MallProducts where ProductID = '{search}' ", rpt_all, rpt_page, 0, 5);

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
        pageUtility.BindRepeater("select * from MallProducts", rpt_all, rpt_page, PageNum, 5);
    }

    protected void btn_delete(object sender, EventArgs e)
    {
        ProductUtility productUtility = new ProductUtility();
        List<MallProduct> mallProducts = productUtility.GetAllProducts();

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
    商品管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card-body">


                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">商品ID: </label>
                                &nbsp&nbsp&nbsp
                            <%--<input type="text" class="form-control" placeholder="訂單號碼">--%>
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control col-3" placeholder="請輸入商品ID"></asp:TextBox>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="Button2" runat="server" Text="搜尋" class="btn btn-primary" OnClick="Button2_Click" />
                                        &nbsp&nbsp&nbsp
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
                                                <th class="text-center"><strong>商品ID</strong></th>
                                                <th class="text-center"><strong>商品類別</strong></th>
                                                <th class="text-center"><strong>商品名稱</strong></th>
                                                <th class="text-center"><strong>商品圖</strong></th>
                                                <th class="text-center"><strong>商品規格</strong></th>
                                                <th class="text-center"><strong>商品敘述</strong></th>
                                                <th class="text-center"><strong>商品單價</strong></th>
                                                <th class="text-center"><strong>庫存</strong></th>
                                                <th class="text-center"><strong class="mallEditPermission">編輯</strong></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>


                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 30px;" class="text-center"><%#Eval("ProductID") %></td>
                                        <td style="width: 150px; white-space: pre-wrap; word-wrap: break-word" class="text-center"><%#Eval("Category") %> </td>
                                        <td style="width: 200px; white-space: pre-wrap; word-wrap: break-word" class="text-center"><%#Eval("ProductName") %> </td>
                                        <td class="text-center">
                                            <img src="../ShopImages/<%#Eval("ImageUrl") %>" alt="" style="width: 80px; height: 80px">
                                        </td>
                                        <td style="width: 150px; white-space: pre-wrap; word-wrap: break-word" class="text-center"><%#Eval("Spec") %> </td>
                                        <td style="width: 350px; white-space: pre-wrap; word-wrap: break-word" class="text-center"><%#Eval("Description") %></td>
                                        <td class="text-center">$<%#Eval("Price") %></td>
                                        <td class="text-center"><%#Eval("Stock") %></td>

                                        <td>
                                            <div class="text-center mallEditPermission">
                                                <%--<div class="d-flex align-items-center">--%>
                                                <a href="1_1_2_ProductEditAddDetail.aspx?ProductID=<%#Eval("ProductID") %>" style="color: white;">
                                                    <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                        編輯                                               
                                                        <i class="typcn typcn-edit btn-icon-append"></i>
                                                    </button>

                                                </a>

                                                <a href="1_1_3_ProductEditDelete.aspx?ProductID=<%#Eval("ProductID") %>" style="color: white;">
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
                    <br />



                    <%--Style="align-content:center; padding: 8px; margin: 2px; background: #ffa100; border: solid 1px #666; font: 8pt tahoma;"--%>
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







            <%--新增按鈕--%>
            <!-- partial:partials/_settings-panel.html -->

            <div class="theme-setting-wrapper mallEditPermission">
                <div id="settings-trigger">
                    <a href="1_1_1_ProductEditAdd.aspx" style="color: white">+</a>
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
