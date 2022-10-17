<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Page.IsPostBack == false)
        {

            Label2.Text = "";

            //DrpPetSize.DataTextField = "PetSize";
            //DrpPetSize.DataValueField = "PetSize";

        }

    }

    protected void txtCustomerId_TextChanged(object sender, EventArgs e)
    {
        PetUtility petUtility = new PetUtility();
        if (petUtility.searchCus(int.Parse(txtCustomerId.Text)) == false)
        {
            Label2.Text = "客戶編號不存在";
        }
        else
        {
            Label2.Text = "";

        }

    }


    protected void btnOK_Click(object sender, EventArgs e)
    {

        if (Upload_Img.HasFile)
        {
            try
            {
                string uploadPath = "~/f_img/" + Upload_Img.FileName;
                Upload_Img.SaveAs(Server.MapPath(uploadPath));

                Image1.ImageUrl = uploadPath;
            }
            catch (Exception)
            {
                Lbmsg.Text = "請上傳300px以內的照片";
            }

        }
        else
        {
            //Label1.Text = "請選擇要上傳的檔案!!";
        }

        //MemberUtility memberUtility = new MemberUtility();

        Pet Pet = new Pet();
        //Pet.Member = memberUtility.GetMember(int.Parse(txtCustomerId.Text));
        Pet.CustomerId = int.Parse(txtCustomerId.Text);
        Pet.PetName = txtPetName.Text;
        Pet.PetKind = RdoCat.Checked ? RdoCat.Text : RdoDog.Text;
        Pet.PetSize = DrpPetSize.SelectedValue;
        Pet.PetImageUrl = Upload_Img.FileName;
        Pet.Requirement = txtRequire.Text;



        PetUtility utility = new PetUtility();

        utility.AddPet(Pet);
        Response.Redirect("~/b_03Hotel/3_4_Pet.aspx");
    }

    protected void Demo_Click(object sender, EventArgs e)
    {
        int i = 7;
        txtCustomerId.Text = i.ToString();
        txtPetName.Text = "斑斑";
        txtRequire.Text = "不會跟同類相處但親近人";
        RdoCat.Checked = true;
        DrpPetSize.SelectedValue = "小型";
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
    寵物管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">寵物新增</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_CustomerId" class="col-sm-2 col-form-label">客戶編號</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCustomerId" CssClass="form-control w-50" placeholder="客戶編號" runat="server" AutoPostBack="True" OnTextChanged="txtCustomerId_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="客戶編號不可為空白" ControlToValidate="txtCustomerId" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>


                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_PetName" class="col-sm-2 col-form-label">寵物名字</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPetName" CssClass="form-control w-50" placeholder="寵物名字" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="寵物名字不可為空白" ControlToValidate="txtPetName" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetKind" class="col-sm-2 col-form-label">寵物種類</label>
                                    <div class="col-sm-4">
                                        <asp:RadioButton ID="RdoDog" runat="server" GroupName="pet" Text="狗" CssClass="form-control  js-example-basic-single w-50" Checked="True" />
                                        <asp:RadioButton ID="RdoCat" runat="server" GroupName="pet" Text="貓" CssClass="form-control  js-example-basic-single w-50" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_DrpPetSize" class="col-sm-2 col-form-label">寵物尺寸</label>
                                    <div class="col-sm-4 form-group">
                                        <asp:DropDownList ID="DrpPetSize" runat="server" CssClass="form-control js-example-basic-single w-50" AppendDataBoundItems="True">
                                            <asp:ListItem>----</asp:ListItem>
                                            <asp:ListItem>大型</asp:ListItem>
                                            <asp:ListItem>中型</asp:ListItem>
                                            <asp:ListItem>小型</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="寵物尺寸不可為空白" ControlToValidate="DrpPetSize" ForeColor="#ff3300" InitialValue="----"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRequire" class="col-sm-2 col-form-label">特殊需求</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtRequire" CssClass="form-control w-50" placeholder="特殊需求" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="特殊需求不可為空白" ControlToValidate="txtRequire" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_Upload_Img" class="col-sm-2 col-form-label">上傳寵物照片</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="Upload_Img" runat="server" class="form-control file-upload-info w-50" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="請上傳寵物照片" ControlToValidate="Upload_Img" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                    <br />
                                    <div>
                                        <asp:Label ID="Lbmsg" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Image ID="Image1" runat="server" Visible="False" Width="300px" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                        <%--<asp:Button ID="btnCancel" runat="server" Text="取消" class="btn btn-light" />--%>
                                        <button type="button" id="btnCancel" class="btn btn-danger mr-2">
                                            <a href="3_4_Pet.aspx" style="color: white;">取消</a>
                                            <%--<i class="typcn typcn-edit btn-icon-append"></i>--%>
                                        </button>
                                        <%--<button type="button" class="btn btn-primary mr-2">編輯</button>
                                        <button type="submit" class="btn btn-primary mr-2">確認</button>
                                        <button class="btn btn-light">取消</button>--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                        <asp:Button ID="Demo" runat="server" Text="Demo" CssClass="btn btn-warning mr-3" CausesValidation="False" OnClick="Demo_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
</asp:Content>
