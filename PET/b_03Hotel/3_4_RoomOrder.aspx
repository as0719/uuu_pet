<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string types = Request.QueryString["types"];
            RoomUtility Utility = new RoomUtility();
            Room room = Utility.GetRooms(types);

            ImgRoom.ImageUrl ="/f_img/" + room.RoomImageUrl;
            LbRoomType.Text = room.RoomType;
            LbPetType.Text = room.PetType;
            LbPrice.Text = room.Price.ToString();
            DrpStatus.SelectedValue = room.Status;
            DrpStatus.DataTextField = "Status";
            DrpStatus.DataValueField = "Status";

        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        string types = Request.QueryString["types"];
        RoomUtility Utility = new RoomUtility();
        Room room = Utility.GetRooms(types);

        room.Status = DrpStatus.SelectedValue;

        Utility.EditRoom(room);
        Response.Redirect("~/b_03Hotel/3_3_Room.aspx");
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
    住宿管理
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
                                    <h4 class="card-title">房型資訊</h4>
                                    <div class="forms-sample">
                                        <div class="form-group row">
                                            <div class="col-sm-1"></div>
                                            <label for="BodyHolder_LbRoomType" class="col-sm-3 col-form-label">房型</label>

                                            <asp:Label ID="LbRoomType" runat="server" Text="Label"></asp:Label>
                                            <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("RoomType")%></label>--%>
                                            <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-1"></div>
                                            <label for="BodyHolder_LbPetType" class="col-sm-3 col-form-label">寵物種類</label>
                                            <asp:Label ID="LbPetType" runat="server" Text="Label"></asp:Label>
                                            <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("PetType")%></label>--%>
                                            <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-1"></div>
                                            <label for="BodyHolder_LbPrice" class="col-sm-3 col-form-label">價錢</label>
                                            <asp:Label ID="LbPrice" runat="server" Text="Label"></asp:Label>
                                            <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label">$<%#Eval("Price")%></label>--%>
                                            <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-1"></div>
                                            <label for="BodyHolder_DrpStatus" class="col-sm-3 col-form-label">房間狀態</label>
                                            <div class="col-sm-8 form-group"> 
                                            <asp:DropDownList ID="DrpStatus" CssClass="form-control js-example-basic-single w-100" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Status" DataValueField="Status"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [Status] FROM [Rooms]"></asp:SqlDataSource>
                                            </div>
                                            <%--<asp:Label ID="LbStatus" runat="server" Text="Label"></asp:Label>--%>
                                            <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("Status")%></label>--%>
                                            <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-1"></div>
                                            <label for="BodyHolder_ImgRoom" class="col-sm-3 col-form-label">房間照片</label>
                                            <asp:Image ID="ImgRoom" runat="server" class="img-fluid w-50 h-50"/>
                                            <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("RoomImageUrl")%></label>--%>
                                            <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<button type="button" id="btnDelete" class="btn btn-primary mr-2">
                                            <a href="3_3_2_RoomDelete.aspx" style="color: white;">刪除</a>
                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                        </button>--%>
                                        <%--<asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-success mr-2" OnClick="btnOK_Click" />--%>
                                        <%--<asp:Button ID="btnPrevious" runat="server" Text="回上一頁" class="btn btn-danger mr-2" />--%>
                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-info mr-2" OnClick="btnOK_Click" />
                                        <button type="button" id="btnPrevious" class="btn btn-warning mr-2">
                                            <a href="3_3_Room.aspx" style="color: white;">回上一頁</a>
                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                        </button>
                                        <%--<button type="button" class="btn btn-primary mr-2">編輯</button>
                                        <button type="submit" class="btn btn-primary mr-2">確認</button>
                                        <button class="btn btn-light">取消</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <%--</ItemTemplate>
            </asp:Repeater>--%>
        </div>

        <%--新增按鈕--%>
        <%--<div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->

            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="3_3_1_RoomAdd.aspx" style="color: white">+</a>
                </div>
            </div>
        </div>--%>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
</asp:Content>
