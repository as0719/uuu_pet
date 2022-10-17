<%@ Page Title="購物車" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            if (Session["ShoppingCart"] != null)
            {
                List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>;

                Repeater2.DataSource = myCart;
                Repeater2.DataBind();

                lbl_SubAmount.Text = myCart.Sum(c => c.Total).ToString();
                lbl_TotalAmount.Text = myCart.Sum(c => c.Total).ToString();

                ProductUtility productUtility = new ProductUtility();

                Dictionary<string, int> test = new Dictionary<string, int>();
                foreach (var item in myCart)
                {
                    test.Add(item.ProductID, item.Amount);
                }

                //if (Session["discount"] != null)
                if (Session["testDis"] != null && Session["testDisNum"] != null)
                {

                    txt_Coupon.Text = Session["testDis"].ToString();
                    lbl_Discount.Text = Session["testDisNum"].ToString();

                    DiscountUtility discountUtility = new DiscountUtility();
                    List<MallDiscountCode> mallDiscountCode = discountUtility.GetAllDiscounts();
                    List<MallDiscountCode> mallDiscountCodes = new List<MallDiscountCode>();

                    string userDis = txt_Coupon.Text.ToUpper();
                    foreach (var item in mallDiscountCode)
                    {
                        if (item.DiscountCode.ToUpper() != txt_Coupon.Text.ToUpper())
                        {
                            lbl_Discount.Text = "此折扣碼無效!";
                            lbl_TotalAmount.Text = lbl_SubAmount.Text;
                        }
                        else
                        {
                            if (item.DiscountCode.ToUpper() == txt_Coupon.Text.ToUpper())
                            {
                                DateTime sDate = DateTime.ParseExact(item.StartDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
                                DateTime eDate = DateTime.ParseExact(item.EndDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);

                                if (DateTime.Now <= eDate && DateTime.Now >= sDate)
                                {
                                    string user = txt_Coupon.Text.ToUpper();
                                    int id = item.No;
                                    MallDiscountCode lbl = discountUtility.GetDiscountCode(id, user);
                                    lbl_Discount.Text = lbl.NumberOfDiscounts.ToString();
                                    mallDiscountCodes.Add(lbl);
                                    //List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>;
                                    Session["discount"] = mallDiscountCodes;
                                    lbl_TotalAmount.Text = ((int)(int.Parse(lbl_SubAmount.Text) * mallDiscountCodes[0].NumberOfDiscounts)).ToString();

                                    break;
                                }
                            }

                        }
                    }




                    //List<MallDiscountCode> myDiscount = Session["discount"] as List<MallDiscountCode>;

                    //txt_Coupon.Text = myDiscount[0].DiscountCode;
                    //lbl_Discount.Text = myDiscount[0].NumberOfDiscounts.ToString();

                    //lbl_TotalAmount.Text = ((myCart.Sum(c => c.Total)) * myDiscount[0].NumberOfDiscounts).ToString();
                }
            }

        }
    }

    /// <summary>
    /// 0920新增
    /// 前台折扣碼計算
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_ApplyCoupon_Click(object sender, EventArgs e)
    {
        Session["testDis"] = txt_Coupon.Text;
        Session["testDisNum"] = lbl_Discount.Text;



        DiscountUtility discountUtility = new DiscountUtility();
        List<MallDiscountCode> mallDiscountCode = discountUtility.GetAllDiscounts();
        List<MallDiscountCode> mallDiscountCodes = new List<MallDiscountCode>();

        string userDis = txt_Coupon.Text.ToUpper();
        Session["discount"] = userDis;
        foreach (var item in mallDiscountCode)
        {
            if (item.DiscountCode.ToUpper() != Session["discount"].ToString().ToUpper())
            {
                lbl_Discount.Text = "此折扣碼無效!";
                lbl_TotalAmount.Text = lbl_SubAmount.Text;

            }
            else
            {
                if (item.DiscountCode.ToUpper() == txt_Coupon.Text.ToUpper())
                {
                    DateTime sDate = DateTime.ParseExact(item.StartDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
                    DateTime eDate = DateTime.ParseExact(item.EndDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);

                    if (DateTime.Now <= eDate && DateTime.Now >= sDate)
                    {
                        string user = txt_Coupon.Text.ToUpper();
                        int id = item.No;
                        MallDiscountCode lbl = discountUtility.GetDiscountCode(id, user);
                        lbl_Discount.Text = lbl.NumberOfDiscounts.ToString();
                        mallDiscountCodes.Add(lbl);
                        //List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>;
                        Session["discount"] = mallDiscountCodes;
                        lbl_TotalAmount.Text = ((int)(int.Parse(lbl_SubAmount.Text) * mallDiscountCodes[0].NumberOfDiscounts)).ToString();

                        break;
                    }
                }

            }
        }






        //foreach (var item in mallDiscountCode)
        //{
        //    if (item.DiscountCode.ToUpper() == txt_Coupon.Text.ToUpper())
        //    {
        //        DateTime sDate = DateTime.ParseExact(item.StartDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
        //        DateTime eDate = DateTime.ParseExact(item.EndDate, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);

        //        if (DateTime.Now <= eDate && DateTime.Now >= sDate)
        //        {
        //            string user = txt_Coupon.Text.ToUpper();
        //            int id = item.No;
        //            MallDiscountCode lbl = discountUtility.GetDiscountCode(id, user);
        //            lbl_Discount.Text = lbl.NumberOfDiscounts.ToString();
        //            mallDiscountCodes.Add(lbl);
        //            //List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>;
        //            Session["discount"] = mallDiscountCodes;
        //            lbl_TotalAmount.Text = ((int)(int.Parse(lbl_SubAmount.Text) * mallDiscountCodes[0].NumberOfDiscounts)).ToString();

        //            break;
        //        }
        //    }
        //    else
        //    {
        //        lbl_Discount.Text = "此折扣碼無效!";
        //    }
        //}
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        List<ShoppingItem> lastCart = Session["ShoppingCart"] as List<ShoppingItem>;

        if (lastCart != null)
        {
            //List<ShoppingItem> lastCart = Session["ShoppingCart"] as List<ShoppingItem>;

            foreach (var item in lastCart)
            {
                item.DiscountCode = txt_Coupon.Text;
                item.AllSubTotal = int.Parse(lbl_SubAmount.Text);
                if (lbl_Discount.Text != "此折扣碼無效!" && lbl_Discount.Text != "")
                {
                    item.NumberOfDiscounts = Convert.ToDecimal(lbl_Discount.Text);
                }
                item.AllSubTotal = int.Parse(lbl_SubAmount.Text);
                item.AllTotal = Convert.ToDecimal(lbl_TotalAmount.Text);

            }

            MemberUtility memberUtility = new MemberUtility();
            Member member = Session["loginUser"] as Member;

            int CusId = memberUtility.GetAllMembers().Find(m => member.Email == m.Email).CustomerId;

            MallOrder mallOrder = new MallOrder();
            foreach (var lc in lastCart)
            {
                mallOrder.CustomerId = CusId;
                mallOrder.DiscountCode = lc.DiscountCode;
                mallOrder.SubTotal = lc.AllSubTotal;
                mallOrder.Total = (int)lc.AllTotal;
                mallOrder.OrderDate = DateTime.Now.ToShortDateString();
                mallOrder.OrderTime = DateTime.Now.ToShortTimeString();
                mallOrder.OrderStatus = "已建立";
            }

            OrderUtility orderUtility = new OrderUtility();
            orderUtility.OrderAdd(mallOrder);


            //加入MallOrderDetail
            List<MallOrdersDetail> mallOrdersDetails = new List<MallOrdersDetail>();
            //MallOrdersDetail mallOrdersDetail = new MallOrdersDetail();

            foreach (var lc in lastCart)
            {
                MallOrdersDetail mallOrdersDetail = new MallOrdersDetail();

                mallOrdersDetail.OrderNumber = mallOrder.OrderNumber;
                mallOrdersDetail.CustomerId = mallOrder.CustomerId;
                mallOrdersDetail.ProductID = lc.ProductID;
                mallOrdersDetail.ProductName = lc.ProductName;
                mallOrdersDetail.Spec = lc.Spec;
                mallOrdersDetail.UnitPrice = lc.Price;
                mallOrdersDetail.Number = lc.Amount;
                mallOrdersDetail.SubTotal = lc.AllSubTotal;
                mallOrdersDetail.DiscountCode = mallOrder.DiscountCode;
                mallOrdersDetail.DiscountAmount = (int)((decimal)lc.SubTotal * (1 - lc.NumberOfDiscounts));
                mallOrdersDetail.Total = (int)lc.AllTotal;
                mallOrdersDetail.OrderDate = mallOrder.OrderDate;
                mallOrdersDetail.OrderTime = mallOrder.OrderTime;
                mallOrdersDetail.OrderStatus = "已建立";
                //mallOrdersDetail.OrderStatus = mallOrder.OrderStatus;

                mallOrdersDetails.Add(mallOrdersDetail);

            }
            orderUtility.OrderDetailAdd(mallOrdersDetails);

            Session["ordernumber"] = mallOrder.OrderNumber;

            ProductUtility productUtility = new ProductUtility();
            //List<MallProduct> mallProducts = new List<MallProduct>();
            //foreach (var item in lastCart)
            //{
            //    mallProducts.Add(productUtility.GetProduct(item.ProductID));
            //}

            foreach (var item in lastCart)
            {
                productUtility.ProductEditStock(item.ProductID, (int)item.Amount);
            }


            //加入購物車後 清空頁面及Session
            //Session.Clear();
            Session.Contents.Remove("ShoppingCart");

            Repeater2.DataSource = null;
            Repeater2.DataBind();
            txt_Coupon.Text = "";
            lbl_Discount.Text = "";
            lbl_SubAmount.Text = "0";
            lbl_TotalAmount.Text = "0";

            Response.Redirect($"FinalOrder.aspx?ordernumber={mallOrder.OrderNumber}");

        }

    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <style>
        .card-img,
        .card-img-top,
        .card-img-bottom {
            height: 100%
        }

        body {
            font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        /*.list-group-item {
            border: 0px;
        }*/
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="container mt-3 pt-4 pb-4">

        <%--<div class="container pt-5">--%>
        <%--<div class="container-fluid">--%>
        <div class="row">


            <%--px-xl-5--%>
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 200px;">產品編號</th>
                            <th style="width: 300px;">類別</th>
                            <th style="width: 400px;">品名</th>
                            <th style="width: 400px;">規格</th>
                            <th style="width: 200px;">單價</th>
                            <th style="width: 150px;">庫存</th>
                            <th style="width: 150px;">數量</th>
                            <th style="width: 150px;">金額</th>
                            <th style="width: 100px;">移除</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">

                        <asp:Repeater ID="Repeater2" runat="server">

                            <ItemTemplate>

                                <tr>
                                    <td class="align-middle"><%# Eval("ProductID") %></td>
                                    <td class="align-middle"><%# Eval("Category") %></td>
                                    <td class="align-middle">
                                        <%--<img src='<%# Eval("ImageUrl", "../ShopImages/{0}") %>' alt="" style="width: 50px;">--%>
                                        <%# Eval("ProductName") %></td>
                                    <td class="align-middle"><%# Eval("Spec") %></td>
                                    <td class="align-middle">$<%# Eval("Price") %></td>
                                    <td class="align-middle"><%# Eval("Stock") %></td>
                                    <td class="align-middle">

                                        <div class="input-group quantity mx-auto" style="width: 100px;">


                                            <div class="input-group-btn" id="minusAmount">
                                                <a href='<%# Eval("ProductID", "ChangeAmount.aspx?ProductID={0}&count=-1") %>' class="btn btn-sm btn-primary btn-minus" onclick="validstock('<%# Eval("ProductID","stock{0}") %>',-1,<%# Eval("Stock") %>)">
                                                    <i class="fa fa-minus"></i>
                                                </a>
                                            </div>

                                            <%--<input id="<%# Eval("ProductID","stock{0}") %>" type="text" runat="server" class="form-control form-control-sm border-0 text-center" value='<%# Eval("Amount") %>'/>--%>
                                            <asp:TextBox ID="TextBox1" myName='<%# Eval("ProductID","stock{0}") %>' ClientIDMode="Static" runat="server" value='<%# Eval("Amount") %>' class="form-control form-control-sm border-0 text-center"></asp:TextBox>

                                            <div class="input-group-btn" id="plusAmount">
                                                <a href='<%# Eval("ProductID", "ChangeAmount.aspx?ProductID={0}&count=1") %>' class="btn btn-sm btn-primary btn-plus" onclick="validstock('<%# Eval("ProductID","stock{0}") %>',1,<%# Eval("Stock") %>)">
                                                    <i class="fa fa-plus"></i>
                                                </a>
                                            </div>


                                        </div>

                                    </td>
                                    <td class="align-middle">$<%# Eval("Total") %></td>
                                    <td class="align-middle">
                                        <%--<button class="btn btn-sm btn-danger"><%--<i class="fa fa-times"></i></button>--%>
                                        <a href='<%# Eval("ProductID", "DeleteShoppingItem.aspx?ProductID={0}") %>' class="btn btn-sm btn-danger">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </td>
                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>


            </div>
        </div>
        <div class="row">

            <div class="col-lg-4 mb-4"></div>
            <div class="col-lg-4 mb-4"></div>
            <div class="col-lg-4 mb-4">
                <div class="card border-0">

                    <div class="card-body text-center p-0">

                        <div class="input-group">

                            <%--<input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">--%>
                            <asp:TextBox ID="txt_Coupon" runat="server" class="form-control border-0 p-4" placeholder="請輸入折扣碼"></asp:TextBox>

                            <div class="input-group-append">
                                <asp:Button ID="btn_ApplyCoupon" runat="server" class="btn btn-primary" Text="確認" OnClick="btn_ApplyCoupon_Click" />
                            </div>
                        </div>
                        <hr />
                        <br />

                        <div>
                            <h5 class="text-left">小計: 
                                $<asp:Label ID="lbl_SubAmount" runat="server" Text="0"></asp:Label>
                            </h5>
                        </div>

                        <div>
                            <h5 class="text-left">折數:
                                <asp:Label ID="lbl_Discount" runat="server"></asp:Label></h5>
                        </div>

                        <br />

                        <div>
                            <h5>總金額: </h5>
                            <h2><span>$<asp:Label ID="lbl_TotalAmount" runat="server" Text="0"></asp:Label>
                            </span>
                            </h2>
                        </div>


                    </div>
                    <div class="card-footer border-0 p-0">
                        <%--<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />--%>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-block p-3" OnClick="btn_ApplyCoupon_Click" >確認結帳</asp:LinkButton>--%>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-block p-3" OnClick="LinkButton1_Click">確認結帳</asp:LinkButton>
                        <%--OnClientClick="successalert()"--%>
                        <%--<a href="" class="btn btn-primary btn-block p-3">確認結帳</a>
                             OnClientClick="return successAlert(this, event);"--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Cart End -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">


    <script>

        function validstock(classID, num, stock) {
            //自己加入屬性myName，讓js可以去控制，但瀏覽器不會理他
            if (parseInt($(`input[myName=${classID}]`).val()) + num > stock) {
                event.preventDefault();
                alert("已超過庫存");

            };

            if (parseInt($(`input[myName=${classID}]`).val()) + num < 1) {
                event.preventDefault();
                alert("數量不可小於1");
            };
        }

        //function changestock(classID, stock) {
        //    //自己加入屬性myName，讓js可以去控制，但瀏覽器不會理他
        //    if (parseInt($(`input[myName=${classID}]`).val()) > stock) {
        //        event.preventDefault();
        //        alert("已超過庫存");
        //    };
        //    if (parseInt($(`input[myName=${classID}]`).val()) < 1) {
        //        event.preventDefault();
        //        alert("數量不可小於1");
        //    };
        //}


        //$(function () {
        //    if ($(`input[myName=${classID}]`.val() > stock) {
        //        event.preventDefault();
        //        alert("已超過庫存");
        //    }
        //})
    </script>


    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_shop/shop.aspx']").addClass("active");

        })

        $(function () {
            if ($("#BodyHolder_Button1").click()) {

            }

        })

    </script>

</asp:Content>

