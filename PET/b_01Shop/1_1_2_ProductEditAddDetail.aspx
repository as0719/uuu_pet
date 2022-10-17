<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string id = Request.QueryString["ProductID"];

            ProductUtility productUtility = new ProductUtility();

            MallProduct products = productUtility.GetProduct(id);

            Label1.Text = id;
            DropDownList1.SelectedValue = products.Category;
            txt_pdDesc.Text = products.Description;
            txt_pdName.Text = products.ProductName;
            txt_pdSpec.Text = products.Spec;
            txt_pdStock.Text = products.Stock.ToString();
            txt_pdPrice.Text = products.Price.ToString();
            HiddenField1.Value = products.ImageUrl;
        }
    }


    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        //1. 把上傳的圖檔存下來
        if (FileUpload1.HasFile == true)
        {
            FileUpload1.SaveAs(Server.MapPath("../ShopImages/" + FileUpload1.FileName));
        }

        //2. 存進DB
        MallProduct mallProduct = new MallProduct();

        mallProduct.ProductID = Label1.Text;
        mallProduct.Category = DropDownList1.SelectedItem.Text;
        mallProduct.ProductName = txt_pdName.Text;
        mallProduct.Spec = txt_pdSpec.Text;
        mallProduct.Description = txt_pdDesc.Text;
        mallProduct.ProductName = txt_pdName.Text;
        mallProduct.Stock = Convert.ToInt32(txt_pdStock.Text);
        mallProduct.Price = Convert.ToInt32(txt_pdPrice.Text);
        //把原本圖片的檔名存在Hiddenfield，萬一使用者沒有上傳新圖片就可以保留原本的圖片不變
        mallProduct.ImageUrl = FileUpload1.HasFile == true ? FileUpload1.FileName : HiddenField1.Value;

        ProductUtility productUtility = new ProductUtility();

        productUtility.ProductEdit(mallProduct);

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
    商品新增
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="col-md-12  grid-margin">
                        <br />
                        <h5>商品ID:
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h5>
                        <br />

                        <div class="card">
                            <div class="card-body">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputUsername2" class="col-sm-2 col-form-label">商品類別</label>
                                    <div class="col-sm-4 form-group">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" class="form-control" DataTextField="Category" DataValueField="Category" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [MallProducts]"></asp:SqlDataSource>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品名稱</label>
                                    <div class="col-sm-9">

                                        <asp:TextBox ID="txt_pdName" runat="server" class="form-control"></asp:TextBox>

                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品名稱">--%>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品圖</label>
                                    <div class="col-sm-5">
                                        <input type="file" name="img[]" class="file-upload-default">
                                        <div class="input-group col-xs-12">
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control file-upload-info" />

                                            <%--                                            <input type="file" class="form-control file-upload-info" disabled placeholder="上傳照片" accept=".png, .jpg, .jpeg">
                                            <span class="input-group-append">
                                                <button class="file-upload-browse btn btn-primary" type="button">上傳</button>
                                                <asp:Image ID="Image1" runat="server" />
                                            </span>--%>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品規格</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txt_pdSpec" runat="server" class="form-control"></asp:TextBox>
                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品規格">--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品敘述</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txt_pdDesc" runat="server" class="form-control" TextMode="MultiLine" Wrap="true"></asp:TextBox>

                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品敘述">--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品單價</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txt_pdPrice" runat="server" class="form-control"></asp:TextBox>

                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品單價">--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">庫存</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txt_pdStock" runat="server" class="form-control" placeholder="庫存"></asp:TextBox>

                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="庫存">--%>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-sm-10"></div>
                                    <div class="col-sm-2">

                                        <asp:LinkButton ID="btn_confirm" runat="server" type="submit" class="btn btn-primary mr-2" OnClick="btn_confirm_Click">確認</asp:LinkButton>
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


        <%--            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table">
                                <thead>
                                    <tr>
                                        <th class="ml-5">訂單號碼</th>
                                        <th>訂購人ID</th>
                                        <th>房型名稱</th>
                                        <th>入住日</th>
                                        <th>退房日</th>
                                        <th>總金額</th>
                                        <th>編輯</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#P1</td>
                                        <td>NameP1</td>
                                        <td>SM_D1</td>
                                        <td>2022年08月19日</td>
                                        <td>2022年08月23日</td>
                                        <td>$1000</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                    檢視
                                                           
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                    刪除
                                                           
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#P2</td>
                                        <td>NameP2</td>
                                        <td>2022年08月20日</td>
                                        <td>2022年08月25日</td>
                                        <td>$1000</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                    檢視
                                                           
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                    刪除
                                                           
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>--%>
    </div>
    <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
</asp:Content>
