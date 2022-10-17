<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int types = int.Parse(Request.QueryString["types"]);
        PetUtility Utility = new PetUtility();
        Pet Pet = Utility.GetPets(types);
        LbId.Text = Pet.Id.ToString();
        LbPetName.Text = Pet.PetName;
        LbCustomerId.Text = Pet.CustomerId.ToString();
        Image1.ImageUrl = "~/f_img/" + Pet.PetImageUrl;
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {

        PetUtility PetUtility = new PetUtility();
        PetUtility.DeletePet(int.Parse(LbId.Text));
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
                <div class="col-md-10  grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">寵物刪除</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCustomerId" class="col-sm-2 col-form-label">編號:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="LbId" CssClass="form-control" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCustomerId" class="col-sm-2 col-form-label">客戶編號:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="LbCustomerId" CssClass="form-control" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbPetName" class="col-sm-2 col-form-label">寵物名字:</label>
                                    <div class="col-sm-8">
                                        <asp:Label ID="LbPetName" CssClass="form-control" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_Image1" class="col-sm-2 col-form-label">寵物照片:</label>
                                    <div class="col-sm-9">
                                        <asp:Image ID="Image1" runat="server" Visible="True" Width="300px" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">

                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                        <button type="button" class="btn btn-danger mr-2">
                                            <a href="3_4_Pet.aspx" style="color: white;">取消</a>
                                            <%--<i class="typcn typcn-delete-outline btn-icon-append"></i>--%>
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
</asp:Content>
