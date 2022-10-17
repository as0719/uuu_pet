<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (Page.IsPostBack == false)
        {
            //RoomUtility roomUtility = new RoomUtility();
            //DrpRoomStatus.DataSource = roomUtility.GetAllRooms();
            DrpRoomStatus.DataTextField = "Status";
            DrpRoomStatus.DataValueField = "Status";
            //DrpRoomStatus.DataBind();
        }


    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (Upload_Img.HasFile)
        {
            string uploadPath = "~/f_img/" + Upload_Img.FileName;
            Upload_Img.SaveAs(Server.MapPath(uploadPath));
            //Label1.Text = "上傳成功!!";
            //Image1.Visible = true;
            Image1.ImageUrl = uploadPath;
        }
        else
        {
            //Label1.Text = "請選擇要上傳的檔案!!";
        }

        Room room = new Room();

        room.RoomType = txtRoomType.Text;
        room.PetType = RdoCat.Checked ? RdoCat.Text : RdoDog.Text;
        room.Price = int.Parse(txtPrice.Text);
        room.Status = DrpRoomStatus.SelectedValue;
        room.RoomImageUrl = Upload_Img.FileName;
        room.RoomHeight = txtHeight.Text;
        room.RoomWidth = txtWidth.Text;
        room.RoomDepth = txtDepth.Text;


        RoomUtility utility = new RoomUtility();
        utility.AddRoom(room);
        Response.Redirect("~/b_03Hotel/3_3_Room.aspx");


    }

    protected void txtRoomType_TextChanged(object sender, EventArgs e)
    {
        RoomUtility roomUtility = new RoomUtility();
        if (roomUtility.IfRoomExist(txtRoomType.Text) == true)
        {
            Label2.Text = "房型名稱重覆";
        }
        else
        {
            Label2.Text = "";
        }
    }

    protected void Demo_Click(object sender, EventArgs e)
    {

        txtRoomType.Text = "大型犬-4 總統房";
        txtPrice.Text = "3300";
        DrpRoomStatus.SelectedValue = "空房";
        txtHeight.Text = "150cm";
        txtWidth.Text = "200cm";
        txtDepth.Text = "165cm";

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
                            <h4 class="card-title">房型新增</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRoomType" class="col-sm-2 col-form-label">房型</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtRoomType" CssClass="form-control w-50" placeholder="房型名稱" runat="server" OnTextChanged="txtRoomType_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoomType" ErrorMessage="房型不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtHeight" class="col-sm-2 col-form-label">房間高度</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtHeight" CssClass="form-control w-50" placeholder="高度" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHeight" ErrorMessage="高度不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtWidth" class="col-sm-2 col-form-label">房間寬度</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtWidth" CssClass="form-control w-50" placeholder="寬度" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtWidth" ErrorMessage="寬度不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtDepth" class="col-sm-2 col-form-label">房間深度</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtDepth" CssClass="form-control w-50" placeholder="深度" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDepth" ErrorMessage="深度不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetType" class="col-sm-2 col-form-label">寵物種類</label>
                                    <div class="col-sm-4">
                                        <asp:RadioButton ID="RdoDog" runat="server" GroupName="pet" Text="狗" CssClass="form-control  js-example-basic-single w-50" Checked="True" />
                                        <asp:RadioButton ID="RdoCat" runat="server" GroupName="pet" Text="貓" CssClass="form-control  js-example-basic-single w-50" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPrice" class="col-sm-2 col-form-label">價錢</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPrice" CssClass="form-control w-50" placeholder="價錢" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" ErrorMessage="價錢不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_DrpRoomStatus" class="col-sm-2 col-form-label">房間狀態</label>
                                    <div class="col-sm-4 form-group">
                                        <asp:DropDownList ID="DrpRoomStatus" runat="server" CssClass="form-control js-example-basic-single w-50" DataSourceID="SqlDataSource1" DataTextField="Status" DataValueField="Status" AppendDataBoundItems="True">
                                            <asp:ListItem>----</asp:ListItem>
                                            <%-- <asp:ListItem Value="Vacant">空房</asp:ListItem>
                                            <asp:ListItem Value="Occupied">使用中</asp:ListItem>
                                            <asp:ListItem Value="Cleaning">已清掃</asp:ListItem>
                                            <asp:ListItem Value="Dirty">未清掃</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=PetHotel;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Status] FROM [Rooms]"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DrpRoomStatus" ErrorMessage="房間狀態不可為空白" ForeColor="#ff3300" InitialValue="----"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_Upload_Img" class="col-sm-2 col-form-label">上傳房間照片</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="Upload_Img" runat="server" class="form-control file-upload-info w-50" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="請上傳房間照片" ControlToValidate="Upload_Img" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                                        <%--<asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" class="btn btn-success mr-2" Text="上傳" />--%>
                                    </div>
                                    <br />
                                    <div>
                                        
                                        <%--<asp:Label ID="Label1" runat="server" Text=""></asp:Label>--%>
                                    </div>
                                    <div>
                                        <asp:Image ID="Image1" runat="server" Visable="false" Width="300px" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                        <%--<asp:Button ID="btnCancel" runat="server" Text="取消" class="btn btn-light" />--%>
                                        <button type="button" id="btnCancel" class="btn btn-danger mr-2">
                                            <a href="3_3_Room.aspx" style="color: white;">取消</a>
                                            <%--<i class="typcn typcn-edit btn-icon-append"></i>--%>
                                        </button>
                                        <br />
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
