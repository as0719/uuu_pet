<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">
    string msg;
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtEmployeeName.Text.Trim() == "")
        {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: '姓名不得為空白'," +
            "type: 'warning'," +
            "});";
        }
        else if (txtEmail.Text.Trim() == "")
        {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: 'Email不得為空白'," +
            "type: 'warning'," +
            "});";
        }
        else if (txtStartDate.Text.Trim() == "")
        {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: '到職日不得為空白'," +
            "type: 'warning'," +
            "});";
        }
        else
        {
            //檢核Email是否有重覆，姓名可以重覆
            EmployeeUtility utility = new EmployeeUtility();
            //if (utility.CheckEmployeeRepeatByName(txtEmployeeName.Text) != null)
            //{
            //    //姓名重覆
            //    msg = "swal({ " +
            //"title: '訊息', " +
            //"text: '姓名與其他員工重覆'," +
            //"type: 'warning'," +
            //"});";
            //}
            if (utility.CheckEmployeeRepeatByEmail(txtEmail.Text) != null)
            {
                //mail重覆
                msg = "swal({ " +
            "title: '請確認', " +
            "text: 'Email與他人重覆'," +
            "type: 'warning'," +
            "});";
            }
            else
            {

                //系統給的預設密碼111,之後自已改密碼
                Employee employee = new Employee()
                {
                    EmployeeName = txtEmployeeName.Text,
                    EmployeePwd = "111",
                    PermissionID = int.Parse(ddlJobTitle.SelectedValue),
                    Email = txtEmail.Text,
                    StartDate = txtStartDate.Text,
                    LeaveDate = txtLeaveDate.Text
                };

                utility.AddEmployee(employee);
                Response.Redirect("~/b_04Employee/4_2_Employee.aspx");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            EmployeeUtility utility = new EmployeeUtility();
            ddlJobTitle.DataSource = utility.GetJobTitles();
            ddlJobTitle.DataTextField = "JobTitle";
            ddlJobTitle.DataValueField = "PermissionID";
            ddlJobTitle.DataBind();
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #hotel i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">新增</h4>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEmployeeName" class="col-sm-2 col-form-label">姓名</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEmployeeName" CssClass="form-control" placeholder="姓名" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEmail" class="col-sm-2 col-form-label">電子郵件</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="電子郵件" runat="server" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_ddlJobTitle" class="col-sm-2 col-form-label">職務</label>
                                    <div class="col-sm-4 form-group">
                                        <asp:DropDownList ID="ddlJobTitle" CssClass="form-control js-example-basic-single w-100" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtStartDate" class="col-sm-2 col-form-label">到職日</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtStartDate" placeholder="到職日" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtLeaveDate" class="col-sm-2 col-form-label">離職日</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtLeaveDate" placeholder="離職日" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-9"></div>
                                    <div class="col-sm-3">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mr-2" OnClick="Button1_Click" Text="確認" />
                                        <a href="/b_04Employee/4_2_Employee.aspx" class="btn btn-light">取消</a>
                                        <input type="button" class="btn btn-info mr-2" onclick="setDemo()" value="demo" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-1"></div>
            </div>


        </div>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%= msg %>
        $(function () {
            $("#BodyHolder_txtStartDate").datepicker({
                dateFormat: "yy/mm/dd",
                changeYear: true,
                changeMonth: true,
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
            });

            $("#BodyHolder_txtLeaveDate").datepicker({
                dateFormat: "yy/mm/dd",
                changeYear: true,
                changeMonth: true,
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
            });
        })

        function setDemo() {
            $("#BodyHolder_txtEmployeeName").val("林怡姍");
            $("#BodyHolder_txtEmail").val("sani13@uuu.com");
            $("#BodyHolder_txtStartDate").val("2022/10/18");
        }
    </script>
</asp:Content>
