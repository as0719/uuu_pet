<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["ProductID"];
        List<ShoppingItem> myCart = Session["ShoppingCart"] as List<ShoppingItem>;
        ShoppingItem item = myCart.Where(c => c.ProductID == id).SingleOrDefault();
        myCart.Remove(item);
        Response.Redirect("Cart.aspx");
    }
</script>
