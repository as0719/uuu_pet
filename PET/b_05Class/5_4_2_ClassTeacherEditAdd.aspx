<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">
    string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            EmployeeUtility utility = new EmployeeUtility();
            List<V_EmpTrainer> v_Emps = utility.GetTrainers();
            if (v_Emps == null)
            {
                //已無訓練師可新增
            }
            else
            {
                ddlEmployeeID.DataSource = v_Emps;
                ddlEmployeeID.DataValueField = "EmployeeID";
                ddlEmployeeID.DataTextField = "EmployeeName";
                ddlEmployeeID.DataBind();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //資訊全空
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
        else
        {

            EmployeeUtility utility = new EmployeeUtility();
            Trainer trainer = new Trainer();
            trainer.EmployeeID = int.Parse(ddlEmployeeID.SelectedValue);
            trainer.EmployeeShortName = txtEmployeeShortName.Text;
            if (FileUpload1.HasFile)
            {
                string f = FileUpload1.FileName;
                string tmpFileName = $"Train{ddlEmployeeID.SelectedValue}.{f.Split('.')[1]}";
                FileUpload1.SaveAs(Server.MapPath("~/i_trainer/" + tmpFileName));
                trainer.EmployeeImgUrl = tmpFileName;
            }
            else
            {
                trainer.EmployeeImgUrl = "";
            }
            trainer.Skill = txtSkill.Text;
            trainer.Subject = txtSubject.Text;
            trainer.WantToSay = txtWantToSay.Text;
            trainer.Experience = txtExperience.Text;
            utility.AddTrainer(trainer);

            Response.Redirect("~/b_05Class/5_4_ClassTeacher.aspx");
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/b_05Class/5_4_ClassTeacher.aspx");
    }

    protected void btnDemo_Click(object sender, EventArgs e)
    {
        txtEmployeeShortName.Text = readEmployeeShortName.Text;
        txtExperience.Text = readExperience.Text;
        txtSkill.Text = readSkill.Text;
        txtSubject.Text = readSubject.Text;
        txtWantToSay.Text = readWantToSay.Text;
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
    新增訓練師資訊
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="app">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">訓練師個人資訊</h4>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_ddlEmployeeID" class="col-sm-2 col-form-label">訓練師</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddlEmployeeID" class="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEmployeeShortName" class="col-sm-2 col-form-label">簡稱</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtEmployeeShortName" CssClass="form-control" runat="server" placeholder="簡稱"></asp:TextBox>
                                        <asp:TextBox ID="readEmployeeShortName" runat="server" placeholder="簡稱" Visible="False" Text="艾薇兒"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_FileUpload1" class="col-sm-2 col-form-label">上傳照片</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtSkill" class="col-sm-2 col-form-label">技能</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtSkill" CssClass="form-control" runat="server" placeholder="技能" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        <asp:TextBox ID="readSkill" runat="server" TextMode="MultiLine" Rows="4" Visible="false" Text="分離焦慮改善
幼犬性格養成
緊張/害怕/不親人之行為調整
吠叫行為調整
響片訓練
健康照護相關訓練"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtSubject" class="col-sm-2 col-form-label">想說的一句話</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server" placeholder="想說的一句話"></asp:TextBox>
                                        <asp:TextBox ID="readSubject" runat="server" Visible="False" Text="溫柔的陪伴，堅定的教養，享受一起成長的美好時光"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtWantToSay" class="col-sm-2 col-form-label">跟大家說的話</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtWantToSay" CssClass="form-control" runat="server" placeholder="跟大家說的話" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        <asp:TextBox ID="readWantToSay" runat="server" Visible="false" TextMode="MultiLine" Rows="4" Text="從小成長過程中少不了貓貓狗狗的陪伴，
我的家人非常堅持以正向思考來教育我，
希望我成為一個善良、熱心的人並幫助別人。

長大後也遇到了人生中屬於我的那隻狗狗米糕，
因為米糕的關係，進入了行為教育的領域，
而在探索的過程找到了知名犬類行為訓練師 熊爸，
也學到了相當豐富的知識與技能。

訓練師，除了是我熱愛的職業以外，更​希望幫助更多像我一樣與狗狗生活上遇到問題的媽媽們​，陪伴大家一起改善生活。
讓我們一起實踐與毛孩之間更美好的生活吧！​"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtExperience" class="col-sm-2 col-form-label">經歷</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtExperience" CssClass="form-control" runat="server" placeholder="經歷" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                        <asp:TextBox ID="readExperience" runat="server" TextMode="MultiLine" Rows="4" Visible="false" Text="瑪雅動物醫院 獸醫助理兼駐點訓練師
Dog 老師全能發展學堂 培訓訓練師
Dog 老師全能發展學堂 TTouch 團體班結業
TSPCA 台灣防止虐待動物協會 送養專員兼訓練師
日本APNA二級寵物食育士
中國國家級犬類行為訓練師認證
秘魯當地收容機構國際志工
參與非洲國際志工救援野生動物訓練
臺北市動物保護處「貓犬學校」課程助教
好時光寵物旅館 寵物褓母
逗奇寵物生活館 飼料品解員
浪浪別哭中途咖啡廳 照護員"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-10"></div>
                                    <div class="col-sm-2">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnReturn" runat="server" CssClass="btn btn-light" Text="取消" OnClick="btnReturn_Click" />
                                        <asp:Button ID="btnDemo" runat="server" CssClass="btn btn-secondary" Text="demo" OnClick="btnDemo_Click" />
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

        $(() => {

        });
    </script>
</asp:Content>
