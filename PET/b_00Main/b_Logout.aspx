<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

     protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Emp"] != null)
        {
            Session["Emp"] = null;
        }
        Response.Redirect("~/b_00Main/b_Login.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
