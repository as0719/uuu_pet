<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = int.Parse(Request.QueryString["id"]);
            CourseUtility utility = new CourseUtility();
            GroupCours groupCours = utility.GetGroupCourseByID(id);
            //lblCourseNameLeft.Text = groupCours.CourseName.Substring(0, 3);
            //lblCourseNameRight.Text = groupCours.CourseName.Substring(3);
            lblCourseNameLeft.Text = groupCours.CourseName;
            lblIntroduction.Text = groupCours.Introduction;
            lblCourseDateTime.Text = $"課程日期：{groupCours.StartDate} {groupCours.StartTime}~{groupCours.EndTime}";
        }
    }
    string msg = "";
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtApplicantName.Text.Trim() == "")
        {
            msg = "swal({ " +
                "title: '訊息', " +
                "text: '請填寫報名人姓名'," +
                "type: 'warning'," +
                "});";
        }
        else if (txtEmail.Text.Trim() == "")
        {
            msg = "swal({ " +
                "title: '訊息', " +
                "text: '請填寫Email'," +
                "type: 'warning'," +
                "});";
        }
        else if (txtPhoneNumber.Text.Trim() == "")
        {
            msg = "swal({ " +
               "title: '訊息', " +
               "text: '請填寫電話號碼'," +
               "type: 'warning'," +
               "});";
        }
        else if (txtJoinPeopleNumber.Text == "" || txtJoinPetNumber.Text == "")
        {
            msg = "swal({ " +
               "title: '訊息', " +
               "text: '請填寫出席人數與毛小孩數量'," +
               "type: 'warning'," +
               "});";
        }
        else if (int.Parse(txtJoinPeopleNumber.Text) <= 0)
        {
            msg = "swal({ " +
               "title: '訊息', " +
               "text: '請填寫出席人數'," +
               "type: 'warning'," +
               "});";
        }
        else if (int.Parse(txtJoinPetNumber.Text) < 0)
        {
            msg = "swal({ " +
               "title: '訊息', " +
               "text: '若無毛小孩出席請選擇0'," +
               "type: 'warning'," +
               "});";
        }
        else
        {
            CourseUtility utility = new CourseUtility();
            //檢核報名人數是否超過
            if (utility.chkPraticeCourseMax(int.Parse(Request.QueryString["id"]),
                int.Parse(txtJoinPeopleNumber.Text),
                int.Parse(txtJoinPetNumber.Text)))
            {
                msg = "swal({ " +
               "title: '訊息', " +
               "text: '對不起，上課人數已額滿。請參考其它課程'," +
               "type: 'warning'," +
               "});";
            }
            else {
                //新增
                CourseRegistration courseRegistration = new CourseRegistration()
                {
                    CourseID = int.Parse(Request.QueryString["id"]),
                    ApplicantName = txtApplicantName.Text,
                    PhoneNumber = txtPhoneNumber.Text,
                    Email = txtEmail.Text,
                    JoinPeopleNumber = int.Parse(txtJoinPeopleNumber.Text),
                    JoinPetNumber = int.Parse(txtJoinPetNumber.Text),
                    RegistrationDate = DateTime.Now.ToString("yyyy/MM/dd"),
                    RegistrationTime = DateTime.Now.ToString("hh:mm")

                };
                utility.AddCourseRegister(courseRegistration);
                Response.Redirect("~/f_training/classTeam.aspx");
            }

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">

    <!-- Booking Start -->
    <div class="container-fluid">
        <div class="container">
            <div class="row align-items-center pt-5">
                <div class="col-lg-5">
                    <div class="bg-primary py-5 px-4 px-sm-5">
                        <div class="py-1">
                            <div class="form-group">
                                <asp:TextBox ID="txtApplicantName" CssClass="form-control border-0 p-4" placeholder="報名人姓名" runat="server" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPhoneNumber" CssClass="form-control border-0 p-4" placeholder="手機號碼" runat="server" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtEmail" CssClass="form-control border-0 p-4" placeholder="Email" runat="server" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtJoinPeopleNumber" CssClass="form-control border-0 p-4" placeholder="出席人數" runat="server" TextMode="Number" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtJoinPetNumber" CssClass="form-control border-0 p-4" placeholder="出席毛小孩數量" runat="server" TextMode="Number" required></asp:TextBox>
                            </div>
                            <div>
                                <asp:Button ID="btnSend" CssClass="btn btn-dark btn-block border-0 py-3" runat="server" Text="送出" OnClick="btnSend_Click" />
                                <a href="/f_training/classTeam.aspx" class="btn btn-light btn-block border-0 py-3">放棄</a>
                                <input type="button" class="btn btn-secondary btn-block border-0 py-3" onclick="funSetDemo();" value="demo" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 py-5 py-lg-0 px-3 px-lg-5">
                    <h4 class="text-secondary mb-3">課程名稱</h4>
                    <h1 class="display-4 mb-4">
                        <asp:Label ID="lblCourseNameLeft" runat="server" Text=""></asp:Label>
                        <span class="text-primary"><asp:Label ID="lblCourseNameRight" runat="server" Text=""></asp:Label></span></h1>
                    <p>
                        <asp:Label ID="lblIntroduction" runat="server" Text=""></asp:Label>
                    </p>
                    <div class="row py-2">
                        <div class="col-sm-6">
                            <div class="d-flex flex-column">
                                <%-- <div class="d-flex align-items-center mb-2">
                                    <h1 class="flaticon-house font-weight-normal text-secondary m-0 mr-3"></h1>
                                    <h5 class="text-truncate m-0">Pet Boarding</h5>
                                </div>--%>
                                <p>
                                    <asp:Label ID="lblCourseDateTime" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Booking Start -->


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%= msg %>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_training/classteam.aspx']").addClass("active");
            $("a[href='/f_training/classteam.aspx']").parent().prev().addClass("active");
        });

        function funSetDemo() {
            $("#BodyHolder_txtApplicantName").val("陳映彤");
            $("#BodyHolder_txtPhoneNumber").val("0911911311");
            $("#BodyHolder_txtEmail").val("sherry1011@uuu.com");
            $("#BodyHolder_txtJoinPeopleNumber").val("2");
            $("#BodyHolder_txtJoinPetNumber").val("2");

        }
    </script>
</asp:Content>

