<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from Rooms", RprAll, RprPage, 0, 5);
        }
        //RoomUtility roomUtility = new RoomUtility();

        //RprAll.DataSource = roomUtility.GetAllRooms();
        //RprAll.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(txtSearch.Text))
        {
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater("select * from Rooms", RprAll, RprPage, 0, 5);
        }
        else
        {
            string search = txtSearch.Text;
            PageUtility pageUtility = new PageUtility();
            pageUtility.BindRepeater($"select * from Rooms where RoomType = '{search}'", RprAll, RprPage, 0, 5);

        }
    }


    protected void RprPage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();
        int pageNum = Convert.ToInt32(e.CommandArgument) - 1;
        pageUtility.BindRepeater("select * from Rooms", RprAll, RprPage, pageNum, 5);

    }

    protected void DrpStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DrpStatus.SelectedItem.Text == "====")
        {
            PageUtility page = new PageUtility();
            page.BindRepeater($"select * from Rooms", RprAll, RprPage, 0, 5);
        }
        else
        {
            PageUtility page = new PageUtility();
            page.BindRepeater($"select * from Rooms where Status ='{DrpStatus.SelectedItem.Text}'", RprAll, RprPage, 0, 5);
        }
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
    住宿管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card-body">

                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">房型名稱: </label>
                                &nbsp&nbsp&nbsp
                            <%--<input type="text" class="form-control" placeholder="訂單號碼">--%>
                                <asp:TextBox ID="txtSearch" runat="server" class="form-control col-3" placeholder="請輸入房型名稱"></asp:TextBox>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="btnSearch" runat="server" Text="搜尋" class="btn btn-primary" OnClick="btnSearch_Click" />
                                        &nbsp&nbsp&nbsp
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">房間狀態: </label>
                                &nbsp&nbsp&nbsp
                                <asp:DropDownList ID="DrpStatus" runat="server" CssClass="form-control col-3" AutoPostBack="true" OnSelectedIndexChanged="DrpStatus_SelectedIndexChanged">
                                    <asp:ListItem>====</asp:ListItem>
                                    <asp:ListItem>使用中</asp:ListItem>
                                    <asp:ListItem>空房</asp:ListItem>
                                    <asp:ListItem>清掃中</asp:ListItem>
                                    <asp:ListItem>未清掃</asp:ListItem>
                                </asp:DropDownList>
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
                                        <h4 class="card-title">房型管理</h4>
                                        <thead>
                                            <tr>
                                                <th class="text-left font-weight-bold">房型名稱</th>
                                                <th class="text-left font-weight-bold">寵物類型</th>
                                                <th class="text-left font-weight-bold">高度</th>
                                                <th class="text-left font-weight-bold">寬度</th>
                                                <th class="text-left font-weight-bold">深度</th>
                                                <th class="text-left font-weight-bold">價錢</th>
                                                <th class="text-left font-weight-bold">目前狀態</th>
                                                <th class="text-left font-weight-bold">房間圖片</th>
                                                <th class="text-left font-weight-bold">編輯</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-left"><%#Eval("RoomType")%></td>
                                        <td class="text-left"><%#Eval("PetType")%></td>
                                        <td class="text-left"><%#Eval("RoomHeight")%></td>
                                        <td class="text-left"><%#Eval("RoomWidth")%></td>
                                        <td class="text-left"><%#Eval("RoomDepth")%></td>
                                        <td class="text-left">$<%#Eval("Price")%></td>
                                        <td class="text-left">
                                            <div class="badge"><%#Eval("Status")%></div>
                                        </td>
                                        <td>
                                            <img alt="" src="../f_img/<%#Eval("RoomImageUrl")%>" /></td>
                                        <td>
                                            <div class="d-flex align-items-center">

                                                <button type="button" class="btn btn-info btn-sm btn-icon-text mr-3">
                                                    <a href="3_3_4_RoomOrder.aspx?types=<%#Eval("RoomType")%>" style="color: white;">檢視</a>
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3 RoomEditPermission">
                                                    <a href="3_3_3_RoomEdit.aspx?types=<%#Eval("RoomType")%>" style="color: white;">編輯</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text RoomEditPermission">
                                                    <a href="3_3_2_RoomDelete.aspx?types=<%#Eval("RoomType")%>" style="color: white;">刪除</a>
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
                                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server" ForeColor="White" Font-Bold="True">
                                    <%# Container.DataItem %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

            </div>
            <%--新增按鈕--%>
            <%-- <div class="container-fluid page-body-wrapper">--%>
            <!-- partial:partials/_settings-panel.html -->

            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="3_3_1_RoomAdd.aspx" style="color: white">+</a>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script>
        $(function () {
            $(".badge").each(function () {
                $(this).html();
                if ($(this).html() == "使用中") {
                    $(this).addClass("badge-primary")
                }
                if ($(this).html() == "空房") {
                    $(this).addClass("badge-info")
                }
                if ($(this).html() == "清掃中") {
                    $(this).addClass("badge-warning")
                }
                if ($(this).html() == "未清掃") {
                    $(this).addClass("badge-dark")
                }
            })

            if ($("#txpRoomEdit").val() == "none") {
                $(".RoomEditPermission").remove();
            }

        })
    </script>
</asp:Content>
