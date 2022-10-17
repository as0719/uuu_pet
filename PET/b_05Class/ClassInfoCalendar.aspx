<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        List<CalendarEvent> eventsList = new List<CalendarEvent>();
        CourseUtility utility = new CourseUtility();
        List<V_GroupCourse> groupCours = utility.GetGroupCourses();
        foreach (V_GroupCourse item in groupCours)
        {
            CalendarEvent calEvent = new CalendarEvent();
            calEvent.id = item.CourseID.ToString();
            calEvent.start = $"{item.StartDate.Replace('/','-')} {item.StartTime}" ;
            calEvent.end = $"{item.StartDate.Replace('/','-')} {item.EndTime}" ;

            calEvent.title = item.CourseName;
            calEvent.color = "#1221ba";  //填入色碼　
            eventsList.Add(calEvent);
        }

         //此類型旨在提供啟用 AJAX 之應用程式的序列化和還原序列化功能。
        JavaScriptSerializer js = new JavaScriptSerializer();
        //將物件轉換為JSON字串
        string strEvents = js.Serialize(eventsList);

        Response.Clear();
        Response.Write(strEvents);
        Response.End();
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
