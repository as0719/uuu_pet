<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">
    string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            int i = int.Parse(Request.QueryString["id"]);
            CourseUtility utility = new CourseUtility();
            GroupCours groupCours = utility.GetGroupCourseByID(i);
            lblCourseID.Text = groupCours.CourseID.ToString();
            txtCourseName.Text = groupCours.CourseName;
            txtIntroduction.Text = groupCours.Introduction;
            txtStartDate.Text = groupCours.StartDate;
            txtStartTime.Text = groupCours.StartTime;
            txtEndTime.Text = groupCours.EndTime;
            txtMaxPeople.Text = groupCours.MaximumPeople.ToString();
            txtMaxPet.Text = groupCours.MaximumPet.ToString();

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int stime = int.Parse(txtStartTime.Text.Replace(":", string.Empty));
        int etime = int.Parse(txtEndTime.Text.Replace(":", string.Empty));
        //結束時間
        if (etime < stime)
        {
            //結束時間大於等於開始時間，有誤
            msg = "swal({ " +
           "title: '訊息', " +
           "text: '開始時間不得晚於結束時間'," +
           "type: 'warning'," +
           "});";
        }
        else if (txtCourseName.Text == "" || txtStartDate.Text == "" ||
            txtStartTime.Text == "" || txtEndTime.Text == "" ||
            txtMaxPeople.Text == "" || txtMaxPet.Text == "")
        {
            msg = "swal({ " +
           "title: '訊息', " +
           "text: '請填寫課程相關資訊'," +
           "type: 'warning'," +
           "});";
        }
        else if (int.Parse(txtMaxPet.Text) < 1 || int.Parse(txtMaxPeople.Text) < 1) {
            msg = "swal({ " +
          "title: '訊息', " +
          "text: '上限數請大於0'," +
          "type: 'warning'," +
          "});";
        }
        else
        {
            CourseUtility utility = new CourseUtility();
            GroupCours groupCours = new GroupCours()
            {
                CourseID = int.Parse(lblCourseID.Text),
                CourseName = txtCourseName.Text,
                Introduction = txtIntroduction.Text,
                StartDate = txtStartDate.Text,
                StartTime = txtStartTime.Text,
                EndTime = txtEndTime.Text,
                MaximumPeople = int.Parse(txtMaxPeople.Text),
                MaximumPet = int.Parse(txtMaxPet.Text)
            };

            utility.EditCourse(groupCours);
            Response.Redirect("~/b_05Class/5_1_ClassInfo.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #class i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    課程資訊管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                          <div class="card-body">
                            <h4 class="card-title">課程ID:<asp:Label ID="lblCourseID" runat="server" Text=""></asp:Label></h4>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCourseName" class="col-sm-2 col-form-label">課程名稱</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCourseName" class="form-control" runat="server" placeholder="課程名稱" required></asp:TextBox>                                    
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtIntroduction" class="col-sm-2 col-form-label">簡介</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtIntroduction" runat="server" class="form-control" placeholder="簡介" required></asp:TextBox>                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtStartDate" class="col-sm-2 col-form-label">日期</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtStartDate" runat="server" class="form-control" placeholder="日期" autocomplete="off" required></asp:TextBox>                                       
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtStartTime" class="col-sm-2 col-form-label">時間(起)</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtStartTime" runat="server"  class="form-control" placeholder="時間(起)" autocomplete="off" required></asp:TextBox>                                        
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEndTime" class="col-sm-2 col-form-label">時間(迄)</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEndTime" runat="server" class="form-control" placeholder="時間(迄)" autocomplete="off" required></asp:TextBox>                                        
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtMaxPeople" class="col-sm-2 col-form-label">人數上限</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtMaxPeople" runat="server" class="form-control" placeholder="人數上限" TextMode="Number"></asp:TextBox>                                       
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtMaxPet" class="col-sm-2 col-form-label">寵物數上限</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtMaxPet" runat="server" class="form-control" placeholder="寵物數上限" TextMode="Number"></asp:TextBox>                                       
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10"></div>
                                    <div class="col-sm-2">                                        
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="btnSubmit_Click"/>                                                                                
                                        <a href="/b_05Class/5_1_ClassInfo.aspx" class="btn btn-light">取消</a>

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
       <link href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>  
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
                //minDate: "1d",//"-1y+2m-3d"+5 -5 "+5d"
			    //maxDate: "1m",//new Date(2022,9,5),// y m w d
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
            });
            //https://timepicker.co/options/
            $("#BodyHolder_txtStartTime").timepicker({
                timeFormat: "HH:mm", // 時間隔式 hh:mm p
                interval: 30, //時間間隔
                minTime: "09:00", //最小時間
                maxTime: "18:00", //最大時間
                //defaultTime: "09", //預設起始時間
                //startTime: "09:00", // 開始時間
                dynamic: false, //是否顯示項目，使第一個項目按時間順序緊接在所選時間之後
                dropdown: true, //是否顯示時間條目的下拉列表
                scrollbar: false //是否顯示捲軸
            });
            $("#BodyHolder_txtEndTime").timepicker({
                timeFormat: "HH:mm", // 時間隔式
                interval: 30, //時間間隔
                minTime: "09:00", //最小時間
                maxTime: "18:00", //最大時間
                //defaultTime: "09", //預設起始時間
                //startTime: "09:00", // 開始時間
                dynamic: false, //是否顯示項目，使第一個項目按時間順序緊接在所選時間之後
                dropdown: true, //是否顯示時間條目的下拉列表
                scrollbar: false //是否顯示捲軸
            });
        })
     </script>
</asp:Content>
