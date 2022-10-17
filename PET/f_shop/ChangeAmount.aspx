<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        string id = Request.QueryString["ProductID"];
        int count = int.Parse(Request.QueryString["count"]);


        List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>;
        ShoppingItem item = myCart.Where(c => c.ProductID == id).SingleOrDefault();
        item.Amount += count;


        if (Session["testDis"] != null && Session["testDisNum"] != null)
        {
            string dis = Session["testDis"].ToString();
            string disN = Session["testDisNum"].ToString();

        }

        //if (Session["discount"] != null)
        //{

        //    List<MallDiscountCode> mallDiscountCodes = Session["discount"] as List<MallDiscountCode>;
        //    string dc = mallDiscountCodes[0].DiscountCode; //xxxx
        //    string dcn = mallDiscountCodes[0].NumberOfDiscounts.ToString(); //0.9

        //    //MallDiscountCode mallDiscountCode = mallDiscountCodes.Where(m => (m.DiscountCode == dc) && (m.NumberOfDiscounts.ToString() == dcn)).SingleOrDefault();
        //    //mallDiscountCode.DiscountCode = mallDiscountCode.DiscountCode;
        //    //mallDiscountCode.NumberOfDiscounts = mallDiscountCode.NumberOfDiscounts;


        //}


        Response.Redirect("Cart.aspx");

    }
</script>

