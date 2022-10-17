<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MemberUtility utility = new MemberUtility();
            Member loginUser =
              utility.ChkMember(Request.Form["txtEmail"], Request.Form["txtPwd"]);
            if (loginUser == null)
            {
                Session["loginUser"] = null;
                Response.Redirect("~/f_login.html?login=error");
            }
            else
            {
                Session["loginUser"] = loginUser;
                Response.Redirect("~/f_index.aspx");
            }
        }
        else
        {
            Response.Redirect("~/f_login.html");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>

</body>
</html>
