<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            if (id == 0)
            {
                Response.Redirect("~/b_05Class/5_4_ClassTeacher.aspx");
            }
            else
            {
                EmployeeUtility utility = new EmployeeUtility();
                V_Trainer trainer = utility.GetTrainer(id);
                lblEmployeeID.Text = trainer.EmployeeID.ToString();
                lblEmployeeName.Text = trainer.EmployeeName;
                txtEmployeeShortName.Text = trainer.EmployeeShortName;
                txtSubject.Text = trainer.Subject.Trim();
                txtSkill.Text = trainer.Skill.Trim();
                txtExperience.Text = trainer.Experience.Trim();
                txtWantToSay.Text = trainer.WantToSay.Trim();
                if (trainer.EmployeeImgUrl == "")
                {
                    Image1.Visible = false;
                }
                else {
                    Image1.ImageUrl = "~/i_trainer/" + trainer.EmployeeImgUrl;
                    hidImageFile.Value = trainer.EmployeeImgUrl;
                }

            }
        }
    }
    string msg = "";
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtEmployeeShortName.Text.Trim() == "" &&
          txtExperience.Text.Trim() == "" &&
          txtSkill.Text.Trim() == "" &&
          txtSubject.Text.Trim() == "" &&
          txtWantToSay.Text.Trim() == "")
        {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: '請填寫訓練師資訊'," +
            "type: 'warning'," +
            "});";
        }
        else {

            Trainer trainer = new Trainer();
            trainer.EmployeeID = int.Parse(lblEmployeeID.Text);
            trainer.EmployeeShortName = txtEmployeeShortName.Text;
            if (FileUpload1.HasFile)
            {
                string f = FileUpload1.FileName;
                string tmpFileName = $"Train{lblEmployeeID.Text}.{f.Split('.')[1]}";
                FileUpload1.SaveAs(Server.MapPath("~/i_trainer/" + tmpFileName));
                trainer.EmployeeImgUrl = tmpFileName;
            }
            else
            {
                trainer.EmployeeImgUrl = hidImageFile.Value;
            }
            trainer.Skill = txtSkill.Text;
            trainer.Subject = txtSubject.Text;
            trainer.WantToSay = txtWantToSay.Text;
            trainer.Experience = txtExperience.Text;
            EmployeeUtility utility = new EmployeeUtility();
            utility.EditTrainer(trainer);

            Response.Redirect("~/b_05Class/5_4_ClassTeacher.aspx");
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/b_05Class/5_4_ClassTeacher.aspx");
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
    訓練師資訊
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">訓練師:
                                <asp:Label ID="lblEmployeeID" runat="server" Text=""></asp:Label> <asp:Label ID="lblEmployeeName" runat="server" Text=""></asp:Label></h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEmployeeShortName" class="col-sm-2 col-form-label">簡稱</label>
                                    <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmployeeShortName" CssClass="form-control" runat="server" placeholder="簡稱" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_FileUpload1" class="col-sm-2 col-form-label">照片</label>
                                    <div class="col-sm-2">
                                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid"  />
                                    </div>
                                     <div class="col-sm-7">
                                             <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                         <asp:HiddenField ID="hidImageFile" runat="server" />
                                     </div>
                                
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtSubject" class="col-sm-2 col-form-label">想說的一句話</label>
                                    <div class="col-sm-9">
                                    <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server" placeholder="想說的一句話" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtSkill" class="col-sm-2 col-form-label">技能</label>
                                    <div class="col-sm-9">
                                    <asp:TextBox ID="txtSkill" CssClass="form-control" runat="server" placeholder="技能" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtExperience" class="col-sm-2 col-form-label">經歷</label>
                                    <div class="col-sm-9">
                                    <asp:TextBox ID="txtExperience" CssClass="form-control" runat="server" placeholder="經歷"  TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtWantToSay" class="col-sm-2 col-form-label">想說的話</label>
                                    <div class="col-sm-9">
                                    <asp:TextBox ID="txtWantToSay" CssClass="form-control" runat="server" placeholder="想說的話"  TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-sm-9"></div>
                                    <div class="col-sm-3">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="btnSubmit_Click" />                                                                      
                                        <asp:Button ID="btnReturn" runat="server"  CssClass="btn btn-light" Text="取消" OnClick="btnReturn_Click" />

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
     <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%= msg %>

    </script>

</asp:Content>
