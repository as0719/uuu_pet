<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化控制項
        if (Page.IsPostBack == false)
        {

            string types = Request.QueryString["types"];
            RoomUtility Utility = new RoomUtility();
            Room room = Utility.GetRooms(types);

            LbRoomType.Text = room.RoomType;
            txtHeight.Text = room.RoomHeight;
            txtWidth.Text = room.RoomWidth;
            txtDepth.Text = room.RoomDepth;
            //RdoDog.Text = room.PetType;
            if (room.PetType=="狗")
                RdoDog.Checked = true;
            else
                RdoCat.Checked = true;
            txtPrice.Text = room.Price.ToString();
            DrpRoomStatus.SelectedValue = room.Status;
            HiddenField1.Value = room.RoomImageUrl;
            Image1.ImageUrl = "~/f_img/" + room.RoomImageUrl;
            DrpRoomStatus.DataTextField = "Status";
            DrpRoomStatus.DataValueField = "Status";



        }

    }


    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (Upload_Img.HasFile)
        {
            string uploadPath = "~/f_img/" + Upload_Img.FileName;
            Upload_Img.SaveAs(Server.MapPath(uploadPath));
            //Label1.Text = "上傳成功!!";
            //Image1.Visible = false;
            Image1.ImageUrl = Upload_Img.FileName;
        }


        Room room = new Room
        {
            RoomType = LbRoomType.Text,
            RoomHeight = txtHeight.Text,
            RoomWidth = txtWidth.Text,
            RoomDepth = txtDepth.Text,
            PetType = RdoCat.Checked ? RdoCat.Text : RdoDog.Text,
            Price = int.Parse(txtPrice.Text),
            Status = DrpRoomStatus.SelectedValue,
            RoomImageUrl = Upload_Img.HasFile == true ? Upload_Img.FileName : HiddenField1.Value
        };

        RoomUtility utility = new RoomUtility();
        utility.EditRoom(room);
        Response.Redirect("~/b_03Hotel/3_3_Room.aspx");
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
                <div class="col-md-1"></div>
                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">房型編輯</h4>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRoomType" class="col-sm-2 col-form-label">房型</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbRoomType" CssClass="form-control w-50" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtRoomType" CssClass="form-control" placeholder="房型" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtHeight" class="col-sm-2 col-form-label">房間高度</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtHeight" CssClass="form-control w-50" placeholder="高度" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtWidth" class="col-sm-2 col-form-label">房間寬度</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtWidth" CssClass="form-control w-50" placeholder="寬度" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtDepth" class="col-sm-2 col-form-label">房間深度</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtDepth" CssClass="form-control w-50" placeholder="深度" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetType" class="col-sm-2 col-form-label">寵物種類</label>
                                    <div class="col-sm-4"> 
                                        <asp:RadioButton ID="RdoDog" runat="server" GroupName="pet" Text="狗" CssClass="form-control  js-example-basic-single w-25" />
                                        <asp:RadioButton ID="RdoCat" runat="server" GroupName="pet" Text="貓" CssClass="form-control  js-example-basic-single w-25" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPrice" class="col-sm-2 col-form-label">價錢</label>
                                    <div class="col-sm-9"> 
                                        <asp:TextBox ID="txtPrice" CssClass="form-control w-50" placeholder="價錢" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_DrpRoomStatus" class="col-sm-2 col-form-label">房間狀態</label>
                                    <div class="col-sm-9 form-group"> 
                                        <asp:DropDownList ID="DrpRoomStatus" runat="server" CssClass="form-control js-example-basic-single w-50" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Status" DataValueField="Status">
                                        <asp:ListItem>----</asp:ListItem>
                                        <%--<asp:ListItem Value="Vacant">空房</asp:ListItem>
                                        <asp:ListItem Value="Occupied">使用中</asp:ListItem>
                                        <asp:ListItem Value="Cleaning">已清掃</asp:ListItem>
                                        <asp:ListItem Value="Dirty">未清掃</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [Status] FROM [Rooms]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_Upload_Img" class="col-sm-2 col-form-label">上傳房間照片</label>
                                    <div class="col-sm-9"> 
                                    <asp:FileUpload ID="Upload_Img" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <%--<asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" class="btn btn-success mr-2" Text="上傳" />--%>
                                    </div>
                                    <br />
                                    <%--<asp:Label ID="Label1" runat="server" Text=""></asp:Label>--%>
                                    
                                    <asp:Image ID="Image1" runat="server" Visible="False" />
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                        <button type="button" id="btnCancel" class="btn btn-danger mr-2">
                                            <a href="3_3_Room.aspx" style="color: white;">取消</a>
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
