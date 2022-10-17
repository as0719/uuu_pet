<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["txtPwd"] == Request.Form["txtPwd2"] &&
            Request.Form["txtName"].Trim()!="" && 
            Request.Form["txtEmail"].Trim()!="" &&
            Request.Form["txtPwd"].Trim()!="")
        {
            Member m = new Member();

            m.CustomerName = Request.Form["txtName"];
            m.Email = Request.Form["txtEmail"];
            m.Password = Request.Form["txtPwd"];

            MemberUtility utility = new MemberUtility();
            int i = utility.AddMember(m);

            //sendmail
            Comman.SendRegisterMail(m.Email, m.CustomerName);

            Response.Redirect("~/f_index.aspx");
        }
        else { 

            Response.Redirect("~/f_register.html?result=error");
        }
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
