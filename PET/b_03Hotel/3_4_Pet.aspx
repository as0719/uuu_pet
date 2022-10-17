<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PageUtility PageUtility = new PageUtility();
            PageUtility.BindRepeater("select * from Pets", RprAll, RprPage, 0, 5);
        }



        //RprAll.DataSource = PetUtility.GetAllPets();
        //RprAll.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(txtSearch.Text))
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from Pets", RprAll, RprPage, 0, 5);
        }
        else
        {
            int i = 0;
            bool result = int.TryParse(txtSearch.Text, out i);
            if (result == true)
            {
                string search = txtSearch.Text;
                PageUtility pageUtility = new PageUtility();
                pageUtility.BindRepeater($"select * from Pets where CustomerId = '{search}'", RprAll, RprPage, 0, 5);
            }
        }
    }

    protected void RprPage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();
        int pageNum = Convert.ToInt32(e.CommandArgument) - 1;
        pageUtility.BindRepeater("select * from Pets", RprAll, RprPage, pageNum, 5);
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
                <div class="col-md-12 stretch-card">
                    <div class="card-body">


                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">客戶編號: </label>
                                &nbsp&nbsp&nbsp
                            <%--<input type="text" class="form-control" placeholder="訂單號碼">--%>
                                <asp:TextBox ID="txtSearch" runat="server" class="form-control col-3" placeholder="請輸入客戶編號"></asp:TextBox>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="btnSearch" runat="server" Text="搜尋" class="btn btn-primary" OnClick="btnSearch_Click" />
                                        &nbsp&nbsp&nbsp
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-2">
                            <asp:Repeater ID="RprAll" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <h4 class="card-title">寵物管理</h4>
                                        <thead>
                                            <tr>
                                                <th class="text-left font-weight-bold">客戶編號</th>
                                                <th class="text-left font-weight-bold">寵物名字</th>
                                                <th class="text-left font-weight-bold">寵物類型</th>
                                                <th class="text-left font-weight-bold">寵物尺寸</th>
                                                <th class="text-left font-weight-bold">寵物照片</th>
                                                <th class="text-left font-weight-bold">特殊需求</th>
                                                <th class="text-left font-weight-bold">編輯</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("CustomerId")%></td>
                                        <td><%#Eval("PetName")%></td>
                                        <td><%#Eval("PetKind")%></td>
                                        <td><%#Eval("PetSize")%></td>
                                        <td>
                                            <img alt="" src="../f_img/<%#Eval("PetImageUrl")%>" /></td>
                                        <td><%#Eval("Requirement")%></td>
                                        <td>
                                            <div class="d-flex align-items-center">

                                                <button type="button" class="btn btn-info btn-sm btn-icon-text mr-3">
                                                    <a href="3_4_4_PetOrder.aspx?types=<%#Eval("Id")%>" style="color: white;">檢視</a>
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3 PetEditPermission">
                                                    <a href="3_4_3_PetEdit.aspx?types=<%#Eval("Id")%>" style="color: white;">編輯</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text PetEditPermission">
                                                    <a href="3_4_2_PetDelete.aspx?types=<%#Eval("Id")%>" style="color: white;">刪除</a>
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                  </table>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-md-12 text-center">
                    <div class="btn-group">
                        <asp:Repeater ID="RprPage" runat="server" OnItemCommand="RprPage_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" class="btn btn-primary"
                                    CommandName="Page" CommandArgument="<%#Container.DataItem%>"
                                    runat="server" ForeColor="White" Font-Bold="true">
                                    <%#Container.DataItem%>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

            </div>
            <%--</div>--%>
            <%--新增按鈕--%>
            <%--<div class="container-fluid page-body-wrapper">--%>
            <!-- partial:partials/_settings-panel.html -->

            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="3_4_1_PetAdd.aspx" style="color: white">+</a>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script>
        $(function () {
            if ($("#txpRoomEdit").val() == "none") {
                $(".PetEditPermission").remove();
            }
        }
    </script>
</asp:Content>
