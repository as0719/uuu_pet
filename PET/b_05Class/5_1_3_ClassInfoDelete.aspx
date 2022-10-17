<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            CourseUtility utility = new CourseUtility();
            string result = utility.DeleteCourse(id);
            if (result != "") Session["tmpMsg"] = "此課程已有人報名，無法刪除";

            Response.Redirect("~/b_05Class/5_1_ClassInfo.aspx");
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
