<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int types = int.Parse(Request.QueryString["types"]);
            PetUtility Utility = new PetUtility();
            Pet Pet = Utility.GetPets(types);

            ImgPet.ImageUrl = "/f_img/" + Pet.PetImageUrl;
            LbId.Text = Pet.Id.ToString();
            LbCustomerId.Text = Pet.CustomerId.ToString();
            LbPetName.Text = Pet.PetName;
            LbPetKind.Text = Pet.PetKind;
            LbPetSize.Text = Pet.PetSize;
            txtRequire.Text = Pet.Requirement;

        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        int types = int.Parse(Request.QueryString["types"]);
        PetUtility Utility = new PetUtility();
        Pet Pet = Utility.GetPets(types);

        Pet.Requirement = txtRequire.Text;

        Utility.EditPet(Pet);
        Response.Redirect("~/b_03Hotel/3_4_Pet.aspx");
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
            <%--<asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>--%>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">寵物資訊</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbId" class="col-sm-3 col-form-label">編號</label>
                                    <asp:Label ID="LbId" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCustomerId" class="col-sm-3 col-form-label">客戶編號</label>
                                    <asp:Label ID="LbCustomerId" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbPetName" class="col-sm-3 col-form-label">寵物名字</label>
                                    <asp:Label ID="LbPetName" runat="server" Text="Label"></asp:Label>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbPetKind" class="col-sm-3 col-form-label">寵物類型</label>
                                    <asp:Label ID="LbPetKind" runat="server" Text="Label"></asp:Label>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbPetSize" class="col-sm-3 col-form-label">寵物尺寸</label>
                                    <asp:Label ID="LbPetSize" runat="server" Text="Label"></asp:Label>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRequire" class="col-sm-3 col-form-label">特殊需求</label>
                                    <div class="col-sm-8 form-group">
                                        <asp:TextBox ID="txtRequire" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_ImgPet" class="col-sm-3 col-form-label">寵物照片</label>
                                    <asp:Image ID="ImgPet" runat="server" class="img-fluid w-50 h-50" />

                                </div>

                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2">

                                <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                <button type="button" id="btnPrevious" class="btn btn-danger mr-2">
                                    <a href="3_4_Pet.aspx" style="color: white;">回上一頁</a>
                                    <%--<i class="typcn typcn-edit btn-icon-append"></i>--%>
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--新增按鈕--%>
        <%--<div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->

            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="3_3_1_PetAdd.aspx" style="color: white">+</a>
                </div>
            </div>
        </div>--%>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
</asp:Content>
