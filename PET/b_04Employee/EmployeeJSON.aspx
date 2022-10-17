<%@ Page Language="C#" %>

<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeUtility utility = new EmployeeUtility();
        //List<Employee> employees = utility.GetEmployees();

        //檢視表
        List<V_EmployeeWithJobTitle> employees = utility.GetAllEmployee();


        //此類型旨在提供啟用 AJAX 之應用程式的序列化和還原序列化功能。
        JavaScriptSerializer js = new JavaScriptSerializer();
        //將物件轉換為JSON字串
        string strEvents = js.Serialize(employees);

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
