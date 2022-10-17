<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    string msg;
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtEmployeeName.Text != null && txtEmal.Text != "")
        {
            EmployeeUtility utility = new EmployeeUtility();
            Employee employee = utility.CheckEmployeeNameMail(txtEmployeeName.Text, txtEmal.Text);
            if (employee == null)
            {
                Session["Emp"] = null;
                msg = "swal({ " +
                "title: '警告', " +
                "text: '帳號或電子信箱不存在'," +
                "type: 'warning'," +
                "});";
            }
            else
            {
                //取得密碼

                //更新資料庫

                //寄信
                Comman.SendEmpPwdMail(employee);
                Response.Redirect("~/b_00Main/b_Login.aspx");
            }
        }
        else
        {
            Session["Emp"] = null;
            msg = "swal({ " +
            "title: '提醒', " +
            "text: '請填帳號名稱與電子信箱'," +
            "type: 'warning'," +
            "});";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>PetLover Admin</title>
    <!-- base:css -->
    <link rel="stylesheet" href="/b_forBackend/vendors/typicons/typicons.css" />
    <link rel="stylesheet" href="/b_forBackend/vendors/css/vendor.bundle.base.css" />
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/b_forBackend/css/vertical-layout-light/style.css" />
    <!-- endinject -->
    <link href="/f_img/favicon.png" rel="icon" />
    <style>
        .full-page-wrapper {
            background-image: url(/f_img/price-1.jpg);
            background-attachment: fixed;
            background-size: cover;
        }

        .helfDiv {
            opacity: 0.9;
        }

        input[type=text], input[type=email]{
            border-color: blueviolet;
            box-shadow: 2px 2px 2px blueviolet;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper dvImage">
                <div class="content-wrapper d-flex align-items-center auth px-0">
                    <div class="row w-100 mx-0">
                        <div class="col-lg-4 mx-auto">
                            <div id="app" class="auth-form-light text-left py-5 px-4 px-sm-5 helfDiv">
                                <div class="brand-logo">
                                   <%-- <img src="/b_forBackend/images/logo-dark.svg" alt="logo" />--%>
                                    <img src="/f_img/3669300_pets_ic_icon.png"  style="width:4rem" />
                                    <label class="text-warning size display-3 font-weight-bold">Pet</label><label class="text-primary display-3 font-weight-bold">Lover</label>
                                </div>
                                <div class="pt-3">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmployeeName" CssClass="form-control form-control-lg" runat="server" placeholder="帳號" required></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmal" CssClass="form-control form-control-lg" runat="server" placeholder="電子郵件" TextMode="Email" required></asp:TextBox>
                                    </div>
                                    <div class="mt-3">
                                        <asp:Button ID="Button1" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" OnClick="Button1_Click" runat="server" Text="送出" />
                                        <input type="button" class="btn btn-block btn-info btn-lg font-weight-medium auth-form-btn" value="demo" onclick="setDemo()" />
                                        <%--  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="/b_00Main/b_Dashboard.aspx">登入</a>--%>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
    </form>
    <!-- base:js -->
    <script src="/b_forBackend/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="/b_forBackend/js/off-canvas.js"></script>
    <script src="/b_forBackend/js/hoverable-collapse.js"></script>
    <script src="/b_forBackend/js/template.js"></script>
    <script src="/b_forBackend/js/settings.js"></script>
    <script src="/b_forBackend/js/todolist.js"></script>
    <!-- endinject -->
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
       <%= msg %>
        function setDemo() {
            document.getElementById("txtEmployeeName").value = "艾主席";
            document.getElementById("txtEmal").value = "eren@uuu.com";
        }
    </script>
</body>
</html>
