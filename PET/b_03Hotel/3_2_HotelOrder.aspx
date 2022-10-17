<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PageUtility page = new PageUtility();
            page.BindRepeater("select * from RoomOrders", RprAll, RprPage, 0, 5);
        }
        //RoomOrderUtility ordersUtility = new RoomOrderUtility();

        //RprAll.DataSource = ordersUtility.GetAllRoomOrders();
        //RprAll.DataBind();

        //Repeater2.DataSource = ordersUtility.GetAllRoomOrderDetails();
        //Repeater2.DataBind();

    }

    protected void RprPage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageUtility pageUtility = new PageUtility();
        int pageNum = Convert.ToInt32(e.CommandArgument) - 1;
        pageUtility.BindRepeater("select * from RoomOrders", RprAll, RprPage, pageNum, 5);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //沒有搜尋訂單號碼
        if (string.IsNullOrEmpty(txtSearch.Text))
        { 
            PageUtility page = new PageUtility();
            page.BindRepeater("select * from RoomOrders", RprAll, RprPage, 0, 5);
        }
        else
        { //判斷是否輸入數字
            int i = 0;
            bool result = int.TryParse(txtSearch.Text, out i);
            if (result == true)
            {
                int search = int.Parse(txtSearch.Text);
                PageUtility page = new PageUtility();
                page.BindRepeater($"select * from RoomOrders where RoomOrderId = '{search}'", RprAll, RprPage, 0, 5);
            }
            
        }
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
    住宿訂單管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">

            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card-body">
                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">訂單編號: </label>
                                &nbsp&nbsp&nbsp
                            <%--<input type="text" class="form-control" placeholder="訂單號碼">--%>
                                <asp:TextBox ID="txtSearch" runat="server" class="form-control col-3" placeholder="請輸入訂單編號"></asp:TextBox>
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
                        <div class="table-responsive pt-3">
                            <asp:Repeater ID="RprAll" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <h4 class="card-title">訂單管理</h4>
                                        <thead>
                                            <tr>
                                                <th class="text-left font-weight-bold">訂單號碼</th>
                                                <th class="text-left font-weight-bold">客戶編號</th>
                                                <th class="text-left font-weight-bold">房型</th>
                                                <th class="text-left font-weight-bold">入住日</th>
                                                <th class="text-left font-weight-bold">退房日</th>
                                                <th class="text-left font-weight-bold">總金額</th>
                                                <th class="text-left font-weight-bold">編輯</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("RoomOrderId")%></td>
                                        <td><%#Eval("CustomerId")%></td>
                                        <td><%#Eval("RoomType")%></td>
                                        <td><%#Eval("CheckIn")%></td>
                                        <td><%#Eval("CheckOut")%></td>
                                        <td><%#Eval("Total")%></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-info btn-sm btn-icon-text mr-3">
                                                    <a href="3_2_1_HotelOrderDetail.aspx?id=<%#Eval("RoomOrderId")%>" style="color: white;">檢視</a>
                                                    <i class="typcn typcn-document btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3 OrderEditPermission">
                                                    <a href="3_2_2_HotelOrderEdit.aspx?id=<%#Eval("RoomOrderId")%>&RoomType=<%#Eval("RoomType")%>" style="color: white;">編輯</a>
                                                    <%--<a href="3_2_2_HotelOrderEdit.aspx?id=<%#Eval("RoomOrderId")%>&RoomType=<%#Eval("RoomType")%>" style="color: white;">編輯</a>--%>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text OrderEditPermission">
                                                    <a href="3_2_3_HotelOrderDelete.aspx?id=<%#Eval("RoomOrderId")%>" style="color: white;">刪除</a>
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
                            <br />
                            <%--<asp:Repeater ID="Repeater2" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                            <tr>
                                                <th>房型</th>
                                                <th>寵物名字</th>
                                                <th>特殊需求</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("RoomType")%></td>
                                        <td><%#Eval("PetName")%></td>
                                        <td><%#Eval("Requirement")%></td>

                                        <td>
                                            <%--<div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                    <a href="3_2_1_HotelOrderDetail.aspx?id=<%#Eval("RoomOrderId")%>" style="color: white;">檢視</a>
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-info btn-sm btn-icon-text mr-3">
                                                        <a href="3_2_2_HotelOrderEdit.aspx?id=<%#Eval("RoomOrderId")%>" style="color: white;">編輯</a>
                                                        <i class="typcn typcn-edit btn-icon-append"></i>
                                                    </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                    <a href="3_2_3_HotelOrderDelete.aspx?id=<%#Eval("RoomOrderId")%>" style="color: white;">刪除</a>
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
                        </div>--%>
                        </div>

                    </div>
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


                <%--新增按鈕--%>
                <%--<div class="container-fluid page-body-wrapper">
                    <!-- partial:partials/_settings-panel.html -->

                    <div class="theme-setting-wrapper">
                        <div id="settings-trigger">
                            <a href="3_2_2_HotelOrderAdd.aspx" style="color: white">+</a>
                        </div>
                    </div>
                </div>--%>
                <!-- content-wrapper ends -->
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script>
        $(function () {
            if ($("#txpRoomEdit").val() == "none") {
                $(".OrderEditPermission").remove();
            }
        }
    </script>
</asp:Content>
