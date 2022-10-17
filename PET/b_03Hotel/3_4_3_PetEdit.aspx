<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化控制項
        if (Page.IsPostBack == false)
        {

            int types = int.Parse(Request.QueryString["types"]);
            PetUtility Utility = new PetUtility();
            Pet Pet = Utility.GetPets(types);

            LbId.Text = Pet.Id.ToString();
            txtCustomerId.Text = Pet.CustomerId.ToString();
            txtPetName.Text = Pet.PetName;
            if (Pet.PetKind == "狗")
                RdoDog.Checked = true;
            else
                RdoCat.Checked = true;
            DrpPetSize.SelectedValue = Pet.PetSize;
            txtRequire.Text = Pet.Requirement;  
            HiddenField1.Value = Pet.PetImageUrl;
            Image1.ImageUrl = "~/f_img/" + Pet.PetImageUrl;
            
        }

    }


    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (Upload_Img.HasFile)
        {
            string uploadPath = "~/f_img/" + Upload_Img.FileName;
            Upload_Img.SaveAs(Server.MapPath(uploadPath));

            Image1.ImageUrl = Upload_Img.FileName;
        }


        Pet Pet = new Pet
        {
            Id = int.Parse(LbId.Text),
            CustomerId = int.Parse(txtCustomerId.Text),
            PetName = txtPetName.Text,
            PetKind = RdoCat.Checked ? RdoCat.Text : RdoDog.Text,
            PetSize = DrpPetSize.SelectedValue,
            Requirement = txtRequire.Text,
            PetImageUrl = Upload_Img.HasFile == true ? Upload_Img.FileName : HiddenField1.Value
        };

        PetUtility utility = new PetUtility();
        utility.EditPet(Pet);
        Response.Redirect("~/b_03Hotel/3_4_Pet.aspx");
    }


</script>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #hotel i.menu-arrow:before {
            content: "\e0bd";
        }

        .auto-style2 {
            margin-left: 3rem;
            height: 132px;
        }

        .auto-style3 {
            height: 132px;
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
                            <h4 class="card-title">寵物編輯</h4>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCustomerId" class="col-sm-2 col-form-label">編號</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbId" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="LbCustomerId" CssClass="form-control" placeholder="CustomerId" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCustomerId" class="col-sm-2 col-form-label">客戶編號</label>
                                    <div class="col-sm-9">
                                        <%--<asp:Label ID="LbCustomerId" runat="server" Text="Label"></asp:Label>--%>
                                        <asp:TextBox ID="txtCustomerId" CssClass="form-control w-50" placeholder="CustomerId" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetName" class="col-sm-2 col-form-label">寵物名字</label>
                                    <div class="col-sm-9">
                                        <%--<asp:Label ID="LbPetName" runat="server" Text="Label"></asp:Label>--%>
                                        <asp:TextBox ID="txtPetName" CssClass="form-control w-50" placeholder="PetName" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_RdoDog" class="col-sm-2 col-form-label">寵物種類</label>
                                    <div class="col-sm-4">
                                        <asp:RadioButton ID="RdoDog" runat="server" GroupName="pet" Text="狗" CssClass="form-control  js-example-basic-single w-50" />
                                        <asp:RadioButton ID="RdoCat" runat="server" GroupName="pet" Text="貓" CssClass="form-control  js-example-basic-single w-50" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_DrpPetSize" class="col-sm-2 col-form-label">寵物尺寸</label>
                                    <div class="col-sm-4 form-group">
                                        <asp:DropDownList ID="DrpPetSize" runat="server" CssClass="form-control js-example-basic-single w-50" DataSourceID="SqlDataSource1" DataTextField="PetSize" DataValueField="PetSize" AppendDataBoundItems="True">
                                            <asp:ListItem>----</asp:ListItem>
                                           
                                        </asp:DropDownList>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [PetSize] FROM [Pets]"></asp:SqlDataSource>
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRequire" class="col-sm-2 col-form-label">特殊需求</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtRequire" CssClass="form-control w-50" placeholder="特殊需求" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_Upload_Img" class="col-sm-2 col-form-label">上傳寵物照片</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="Upload_Img" runat="server" />
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </div>
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                                    <asp:Image ID="Image1" runat="server" Visible="False" />
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                        <button type="button" id="btnCancel" class="btn btn-danger mr-2">
                                            <a href="3_4_Pet.aspx" style="color: white;">取消</a>
                                        </button>
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
