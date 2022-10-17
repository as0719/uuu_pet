<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void txt_pdID_TextChanged(object sender, EventArgs e)
    {
        ProductUtility productUtility = new ProductUtility();
        List<MallProduct> mallProducts = productUtility.GetAllProducts();

        foreach (var item in mallProducts)
        {
            if (txt_pdID.Text == item.ProductID)
            {
                Label1.Text = "ID重複";
                Label1.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
            {
                Label1.Text = "";
            }
        }

    }

    protected void btn_confirm_Click(object sender, EventArgs e)
    {

        MallProduct mallProduct = new MallProduct();

        mallProduct.ProductID = txt_pdID.Text;
        mallProduct.Category = DropDownList1.SelectedValue;
        mallProduct.ProductName = txt_pdName.Text;
        mallProduct.ImageUrl = FileUpload1.FileName;
        mallProduct.Spec = txt_pdSpec.Text;
        mallProduct.Description = txt_pdDesc.Text;
        mallProduct.Price = int.Parse(txt_pdPrice.Text);
        mallProduct.Stock = int.Parse(txt_pdStock.Text);

        if (FileUpload1.HasFile)
        {
            string uploadPath = "~/ShopImages/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(uploadPath));
            Image1.Visible = true;
            Image1.ImageUrl = uploadPath;
        }

        ProductUtility productUtility = new ProductUtility();
        productUtility.ProductAdd(mallProduct);

        Response.Redirect("1_1_ProductEdit.aspx");
    }



    //protected void btn_cancel_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("1_1_ProductEdit.aspx");
    //}



    //protected void btn_demo_Click(object sender, EventArgs e)
    //{
    //    txt_pdID.Text = "T1";
    //    DropDownList1.SelectedValue = "狗狗";
    //    txt_pdName.Text = "DEMO1";
    //    //FileUpload1.FileName = "";
    //    txt_pdSpec.Text = "ForDemo";
    //    txt_pdDesc.Text = "ForDemo123123123";
    //    txt_pdPrice.Text = "200";
    //    txt_pdStock.Text = "30";
    //}
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
                    <div class="card">
                        <div class="card-body">
                            <%--<h4 class="card-title">商品ID: #09</h4>--%>
                            <br />
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品ID</label>
                                    <div class="col-sm-8 form-group">

                                        <asp:TextBox ID="txt_pdID" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txt_pdID_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ID不可為空白" Display="Dynamic" ControlToValidate="txt_pdID" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label1" runat="server"></asp:Label>

                                        <div class="input-group col-xs-12">
                                            <asp:Image runat="server" ID="pdIMG" Width="200px"></asp:Image>
                                        </div>

                                    </div>
                                </div>



                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputUsername2" class="col-sm-2 col-form-label">商品類別</label>
                                    <div class="col-sm-8 form-group">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" class="form-control" DataTextField="Category" DataValueField="Category" AppendDataBoundItems="True">
                                            <asp:ListItem>請選擇</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [MallProducts]"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="商品類別不可為空白" ControlToValidate="DropDownList1" ForeColor="Red" InitialValue="請選擇"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品名稱</label>

                                    <div class="col-sm-8 form-group">

                                        <asp:TextBox ID="txt_pdName" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="商品名稱不可為空白" Display="Dynamic" ControlToValidate="txt_pdName" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品圖</label>
                                    <div class="col-sm-8 form-group">
                                        <input type="file" name="img[]" class="file-upload-default">
                                        <div class="input-group col-xs-12">
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control file-upload-info" />
                                            <%--<asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="確認" OnClick="Button1_Click"></asp:Button>--%>
                                            <br />
                                            <div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="請上傳商品圖" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </div>

                                            <div>
                                                <asp:Image runat="server" ID="Image1" Width="200px"></asp:Image>
                                            </div>

                                            <%--                                            <div class="input-group col-xs-12">
                                                <asp:Image runat="server" ID="Image1" Width="200px"></asp:Image>
                                                <asp:Label runat="server" ID="lbl_img"></asp:Label>
                                            </div>--%>



                                            <%--<input type="file" class="form-control file-upload-info" disabled placeholder="上傳照片" accept=".png, .jpg, .jpeg">
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
                                    <div class="col-sm-8 form-group">
                                        <asp:TextBox ID="txt_pdSpec" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="商品規格不可為空白" ControlToValidate="txt_pdSpec" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品規格">--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品敘述</label>
                                    <div class="col-sm-8 form-group">
                                        <asp:TextBox ID="txt_pdDesc" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="商品敘述不可為空白" ControlToValidate="txt_pdDesc" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品敘述">--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">商品單價</label>
                                    <div class="col-sm-8 form-group">
                                        <asp:TextBox ID="txt_pdPrice" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="商品單價不可為空白" ControlToValidate="txt_pdPrice" BorderStyle="NotSet" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="商品單價">--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="exampleInputMobile" class="col-sm-2 col-form-label">庫存</label>
                                    <div class="col-sm-8 form-group">
                                        <asp:TextBox ID="txt_pdStock" runat="server" class="form-control" placeholder="庫存"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="庫存不可為空白" ControlToValidate="txt_pdStock" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <%--<input type="text" class="form-control" id="exampleInputUsername2" placeholder="庫存">--%>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-sm-9"></div>
                                    <div class="col-sm-3">
                                        <%--<asp:LinkButton ID="btn_demo" runat="server" type="submit" class="btn btn-secondary mr-2" OnClick="btn_demo_Click">DEMO</asp:LinkButton>--%>
                                        <asp:LinkButton ID="btn_demo" runat="server" type="submit" class="btn btn-secondary mr-2">DEMO</asp:LinkButton>
                                        <asp:LinkButton ID="btn_confirm" runat="server" type="submit" class="btn btn-primary mr-2" OnClick="btn_confirm_Click">確認</asp:LinkButton>
                                        <%--<asp:LinkButton ID="btn_cancel" runat="server" class="btn btn-light" OnClick="btn_cancel_Click">取消</asp:LinkButton>--%>
                                        <asp:LinkButton ID="btn_cancel" runat="server" class="btn btn-light">取消</asp:LinkButton>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-1"></div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script>
        $(function () {
            $("#BodyHolder_btn_demo").click(function () {
                event.preventDefault();
                $("#BodyHolder_txt_pdID").val("test");
                $("#BodyHolder_DropDownList1").val("狗狗");
                $("#BodyHolder_txt_pdName").val("DEMO1");
                $("#BodyHolder_txt_pdSpec").val("ForDemo");
                $("#BodyHolder_txt_pdDesc").val("ForDemoForDemoForDemoForDemoForDemo");
                $("#BodyHolder_txt_pdPrice").val("200");
                $("#BodyHolder_txt_pdStock").val("30");
            })

            $("#BodyHolder_btn_cancel").click(function () {
                event.preventDefault();
                history.go(-1);
                //Response.Redirect("1_1_ProductEdit.aspx");
            })
        })
    </script>

</asp:Content>
