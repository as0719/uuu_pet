<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string id = Request.QueryString["ProductID"];

            ProductUtility productUtility = new ProductUtility();

            MallProduct products = productUtility.GetProduct(id);

            Image1.ImageUrl = "../ShopImages/" + products.ImageUrl;


            Label1.Text = products.ProductName;
            Label2.Text = products.Price.ToString();
            Label3.Text = products.Description;
            Label4.Text = products.Stock.ToString();
            Label5.Text = products.Spec;
            Label6.Text = products.Category;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["loginUser"] == null)
        {
            Response.Redirect("../f_login.html");
            //Response.Redirect("NoLogin.aspx");
        }
        else
        {
            //"記住"要買"哪個商品","買幾個"

            //從DB拿商品資料
            string id = Request.QueryString["ProductID"];
            ProductUtility productUtility = new ProductUtility();
            MallProduct product = productUtility.GetProduct(id);
            ShoppingItem shoppingItem = new ShoppingItem();


            shoppingItem.ProductID = product.ProductID;
            shoppingItem.ProductName = product.ProductName;
            shoppingItem.Price = (int)product.Price;
            shoppingItem.Spec = product.Spec;
            shoppingItem.Stock = (int)product.Stock;
            //shoppingItem.Description = product.Description;
            shoppingItem.ImageUrl = product.ImageUrl;
            shoppingItem.Amount = int.Parse(TextBox1.Text);
            shoppingItem.Category = product.Category;



            //檢查是否已經建立購物車
            if (Session["ShoppingCart"] == null) //購物車沒有東西
            {
                //建立購物車
                List<ShoppingItem> cart = new List<ShoppingItem>();
                Session["ShoppingCart"] = cart;
            }


            //開一個list去接要加入購物車的資料
            List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>; //用as將session內容轉型成List


            ShoppingItem si = myCart.Find(x => x.ProductID == (shoppingItem.ProductID));

            if (si == null)
            {
                myCart.Add(shoppingItem);
            }
            else
            {
                shoppingItem.Amount = si.Amount + shoppingItem.Amount;
                myCart.RemoveAll(x => x.ProductID == (shoppingItem.ProductID));
                myCart.Add(shoppingItem);
            }
            HiddenField1.Value = "success";
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        if (int.Parse(TextBox1.Text) != 1)
        {
            int amt = int.Parse(TextBox1.Text);
            int amt1 = amt - 1;
            TextBox1.Text = amt1.ToString();
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["ProductID"];

        ProductUtility productUtility = new ProductUtility();
        MallProduct mallProduct = productUtility.GetProduct(id);

        if (int.Parse(TextBox1.Text) < mallProduct.Stock)
        {
            int amt = int.Parse(TextBox1.Text);
            int amt1 = amt + 1;
            TextBox1.Text = amt1.ToString();

        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string id = Request.QueryString["ProductID"];

        ProductUtility productUtility = new ProductUtility();
        MallProduct mallProduct = productUtility.GetProduct(id);


        if (int.Parse(TextBox1.Text) > mallProduct.Stock)
        {
            TextBox1.Text = mallProduct.Stock.ToString();
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <!-- About Start -->
    <div class="container py-5">

        <asp:HiddenField ID="HiddenField1" runat="server" />

        <div class="alert alert-success col-lg-12" id="success_alert" style="display: none">
            <strong>Success!</strong>
            加入購物車成功
        </div>



        <div class="row py-5">
            <div class="col-lg-5">
                <div class="row px-3">

                    <div class="col-12 p-0">
                        <asp:Image ID="Image1" runat="server" class="w-100 h-100" src='<%# Eval("ImageUrl")%>' />
                    </div>
                </div>
            </div>

            <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">


                <%--產品類別Category--%>
                <h5 class="mb-3">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </h5>


                <%--產品名稱ProductName--%>
                <h1 class="display-4 mb-4"><span class="text-primary">
                    <asp:Label ID="Label1" runat="server" Text="Label">a</asp:Label></span>
                </h1>


                <%--產品規格Spec--%>
                <h5 class="mb-3">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </h5>



                <%--產品價格Price--%>
                <h3 class="mb-3">$
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </h3>



                <ul class="list-inline">
                    <li>

                        <%--產品庫存Stock--%>
                        <h5><i class="fa fa-check-double text-secondary mr-3"></i>庫存:
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </h5>

                    </li>
                </ul>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">

                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-minus" OnClick="LinkButton1_Click">
                                        <i class="fa fa-minus"></i>
                            </asp:LinkButton>
                        </div>


                        <asp:TextBox ID="TextBox1" runat="server" class="form-control border-0 text-center" value="1" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

                        <div class="input-group-btn">

                            <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-primary btn-plus" OnClick="LinkButton2_Click">
                                        <i class="fa fa-plus"></i>
                            </asp:LinkButton>

                        </div>
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="加入購物車" class="btn btn-primary px-3" OnClick="Button1_Click" />
                </div>

            </div>
        </div>


        <div class="row py-5">
            <%--產品敘述Description--%>
            <asp:Label ID="Label3" runat="server" Text="Label" CssClass="wrap"></asp:Label>
        </div>
    </div>
    <!-- About End -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">

    <%--    <script>
        function tempAlert(msg, duration) {
            var el = document.createElement("div");
            el.setAttribute("style", "position:absolute;top:40%;left:20%;background-color:white;");
            el.innerHTML = msg;
            setTimeout(function () {
                el.parentNode.removeChild(el);
            }, duration);
            document.body.appendChild(el);
        }



    </script>--%>

    <script>



        $(document).ready(function () {
            if ($("#BodyHolder_HiddenField1").val() == "success") {
                $("#success_alert").show();
                setTimeout(function () {
                    $("#success_alert").hide()
                }, 5000
                );
            }

        })

        $(function () {
            $("#BodyHolder_Button1").click(function () {
                if ($("#BodyHolder_Label4").html() == "0") {
                    event.preventDefault();
                    alert("已無庫存");
                }
            })
        })

    </script>

</asp:Content>
