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
            bool chkRepeatMail = false;
            EmployeeUtility utility = new EmployeeUtility();
            //判斷Email是否重覆
            if (utility.CheckEmployeeRepeatByEmail(txtEmail.Text) != null)
            {
                Employee tmpEmp = utility.CheckEmployeeRepeatByEmail(txtEmail.Text);
                if (tmpEmp.EmployeeID != int.Parse(txtEmployeeID.Text)) chkRepeatMail = true;
            }
            if (!chkRepeatMail)
            {
                Employee employee = new Employee
                {
                    EmployeeID = int.Parse(txtEmployeeID.Text),
                    EmployeeName = txtEmployeeName.Text,
                    PermissionID = int.Parse(txtPermissionID.Text),
                    StartDate = txtStartDate.Text,
                    LeaveDate = txtLeaveDate.Text,
                    Email = txtEmail.Text
                };
                utility.EditEmployeeData(employee);
                Response.Redirect("~/b_04Employee/4_2_Employee.aspx");
            }
            else { 
            msg = "swal({ " +
            "title: '請確認', " +
            "text: '信箱與他人重覆'," +
            "type: 'warning'," +
            "});";
            }
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
    員工維謢
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card" id="app">
                        <div class="card-body">
                            <h4 class="card-title">ID : {{employee.eid}}</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>                          
                                        <label for="BodyHolder_txtEmployeeName" class="col-sm-3 col-form-label">姓名</label>                                                        
                                        <asp:TextBox ID="txtEmployeeName" CssClass="col-sm-5 col-form-control" runat="server" v-model="employeeAry.EmployeeName" required></asp:TextBox>                          
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="ddlJobTitle" class="col-sm-3 col-form-label">職務</label>                

                                      <select class="col-sm-5 col-form-control" id="ddlJobTitle" v-model="employeeAry.PermissionID" @change="SetPermission()">
                                     <%--        <select class="col-sm-5 col-form-control" id="ddlJobTitle" v-model="employeeAry.PermissionID"  @change="GetPermission()">--%>
                                       <option v-for="item in jobTitleAry" :value="item.PermissionID">{{item.JobTitle}}</option>
                                      </select>
                                </div>
                                   <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEmail" class="col-sm-3 col-form-label">電子郵件</label>
                                    <asp:TextBox ID="txtEmail" CssClass="col-sm-5 col-form-contr" runat="server" v-model="employeeAry.Email" required></asp:TextBox>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtStartDate" class="col-sm-3 col-form-label">到職日</label>
                                    <asp:TextBox ID="txtStartDate" CssClass="col-sm-5 col-form-contr" runat="server" v-model="employeeAry.StartDate" required></asp:TextBox>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtLeaveDate" class="col-sm-3 col-form-label">離職日</label>
                                    <asp:TextBox ID="txtLeaveDate" CssClass="col-sm-5 col-form-contr" runat="server" v-model="employeeAry.LeaveDate" ></asp:TextBox>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-9"></div>
                                    <div class="col-sm-3">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="Button1_Click"/>
                                        <a href="/b_04Employee/4_2_Employee.aspx" class="btn btn-light">取消</a>
                                        <div style="display:none">
                                            <asp:TextBox ID="txtEmployeeID" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txtPermissionID" runat="server"></asp:TextBox>
                                        </div>
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
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%=msg%>
        $(() => {
            var getUrl = document.URL;
            var url = getUrl.split('=');
            eid = url[1];
            var app = new Vue({
                el: '#app',
                data: {
                    employee: {
                        eid: eid
                    },
                    employeeAry: [],
                    jobTitleAry: []
                },
                methods: {
                    GetEmployee: function () {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/GetEmployeeById",
                            data: JSON.stringify(this.employee), //js Object => Json
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                //console.log(result);
                                app.employeeAry = result.d;
                                $("#BodyHolder_txtEmployeeID").val(app.employee.eid);
                                $("#BodyHolder_txtPermissionID").val(app.employeeAry.PermissionID);
                            },
                            error: function (event) {
                                console.log(event.responseText);
                            }
                        });
                    },
                    GetJobTitles: function () {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/GetJobTitles",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                console.log(result);
                                app.jobTitleAry = result.d;
                            },
                            error: function (event) {
                                console.log(event.responseText);
                            }
                        });
                    },
                    SetPermission: function () {
                        $("#BodyHolder_txtPermissionID").val(this.employeeAry.PermissionID);
                    },

                },
                created: function () {
                    this.GetEmployee();
                    this.GetJobTitles();
                }
            });

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
        });
    </script>
</asp:Content>
