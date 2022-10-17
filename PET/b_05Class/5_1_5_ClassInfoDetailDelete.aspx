<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            int cid = 0;
            int.TryParse(Request.QueryString["cid"], out cid);
            CourseUtility utility = new CourseUtility();
            utility.DeleteCourseRegistrationsByID(id);

            Response.Redirect("~/b_05Class/5_1_4_ClassInfoDetail.aspx?id=" + cid.ToString());
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
