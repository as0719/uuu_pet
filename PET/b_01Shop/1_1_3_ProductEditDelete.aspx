<%@ Page Title="商品刪除" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    ProductUtility productUtility = new ProductUtility();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string id = Request.QueryString["ProductID"];


            MallProduct product = productUtility.GetProduct(id);

            Label1.Text = id;
            lbl_pdCategory.Text = product.Category;
            lbl_pdDesc.Text = product.Description;
            lbl_pdName.Text = product.ProductName;
            lbl_pdSpec.Text = product.Spec;
            lbl_pdStock.Text = product.Stock.ToString();
            lbl_pdPrice.Text = product.Price.ToString();
            pdIMG.ImageUrl = "../ShopImages/" + product.ImageUrl;
            lbl_pdIMG.Text = product.ImageUrl;


        }
    }


    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["ProductID"];

        productUtility.ProductDelete(id);
        Response.Redirect("1_1_ProductEdit.aspx");

    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("1_1_ProductEdit.aspx");
    }
</script>



<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #hotel i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    商品刪除
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <br />

                            <h3 class="card-title">商品ID : 
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3>

                            <br />

                            <div class="forms-sample">


                                <div class="form-group row">
                                    <div class="col-sm-1  col-form-label"></div>
                                    <label for="exampleInputUsername2" class="col-sm-2"><strong>商品類別</strong></label>
                                    <asp:Label ID="lbl_pdCategory" runat="server" Text="Label" class="col-sm-9"></asp:Label>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2"><strong>商品名稱</strong></label>
                                    <asp:Label ID="lbl_pdName" runat="server" Text="Label" class="col-sm-9"></asp:Label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2"><strong>商品圖</strong></label>
                                    <div class="col-sm-5">
                                        <div class="input-group col-xs-12">
                                            <asp:Label ID="lbl_pdIMG" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="input-group col-xs-12">
                                            <asp:Image runat="server" ID="pdIMG" Width="200px"></asp:Image>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2"><strong>商品規格</strong></label>
                                    <asp:Label ID="lbl_pdSpec" runat="server" Text="Label" class="col-sm-9"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2"><strong>商品敘述</strong></label>
                                    <asp:Label ID="lbl_pdDesc" runat="server" Text="Label" class="col-sm-9"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2"><strong>商品單價</strong></label>
                                    <asp:Label ID="lbl_pdPrice" runat="server" Text="Label" class="col-sm-9"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2"><strong>庫存</strong></label>
                                    <asp:Label ID="lbl_pdStock" runat="server" Text="Label" class="col-sm-9"></asp:Label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-10"></div>
                                    <div class="col-sm-2">

                                        <asp:LinkButton ID="btn_confirm" runat="server" type="submit" class="btn btn-danger mr-2" OnClick="btn_confirm_Click">刪除</asp:LinkButton>
                                        <asp:LinkButton ID="btn_cancel" runat="server" class="btn btn-light" OnClick="btn_cancel_Click">取消</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-1"></div>
        </div>

    </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
</asp:Content>
