<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            EmployeeUtility utility = new EmployeeUtility();
            utility.DeleteTrainer(id);

            Response.Redirect("~/b_05Class/5_4_ClassTeacher.aspx");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
</body>
</html>
