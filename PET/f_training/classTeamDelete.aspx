<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("~/f_training/classTeamHistoryList.aspx");
        }
        else
        {
            int id = int.Parse(Request.QueryString["id"]);
            CourseUtility utility = new CourseUtility();
            utility.DeleteCourseRegistrationsByID(id);
            Response.Redirect("~/f_training/classTeamHistoryList.aspx");
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
