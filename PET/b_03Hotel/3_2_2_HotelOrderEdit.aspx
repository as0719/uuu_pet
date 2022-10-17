<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string roomType = Request.QueryString["RoomType"];
            int id = int.Parse(Request.QueryString["id"]);
            //int types = 1;
            RoomOrderUtility orderUtility = new RoomOrderUtility();

            RoomOrder roomOrder = orderUtility.GetRoomOrder(id);
            List<RoomOrderDetail> roomOrderDetails = orderUtility.GetRoom(id);
            //List<RoomOrderDetail> roomOrderDetail = orderUtility.GetRoomOrderDetail(types);


            LbRoomOrderId.Text = roomOrder.RoomOrderId.ToString();
            LbCustomerId.Text = roomOrder.CustomerId.ToString();
            LbRoomType.Text = roomType;
            txtCheckIn.Text = Convert.ToDateTime(roomOrder.CheckIn).ToShortDateString();
            txtCheckOut.Text = Convert.ToDateTime(roomOrder.CheckOut).ToShortDateString();
            LbTotal.Text = roomOrder.Total;
            txtPetName.Text = roomOrderDetails[0].PetName;
            txtRequire.Text = roomOrderDetails[0].Requirement;


            //RoomOrderDetail orderDetail = orderUtility.GetRoomOrderDetail(types);
            //LbRoomType.Text = roomOrderDetails[0].RoomType;


        }


    }



    protected void btnOK_Click(object sender, EventArgs e)
    {

        string roomType = Request.QueryString["RoomType"];
        int id = int.Parse(Request.QueryString["id"]);


        RoomOrderUtility orderUtility = new RoomOrderUtility();

        RoomOrder roomOrder = orderUtility.GetRoomOrder(id);

        //RoomOrderId = int.Parse(LbRoomOrderId.Text),
        //roomOrder.RoomType = LbRoomType.Text;
        roomOrder.CustomerId = int.Parse(LbCustomerId.Text);
        roomOrder.CheckIn = DateTime.Parse(txtCheckIn.Text);
        roomOrder.CheckOut = DateTime.Parse(txtCheckOut.Text);
        roomOrder.Total = LbTotal.Text;




        orderUtility.EditRoomOrder(roomOrder);


        RoomOrderDetail orderDetail = orderUtility.GetRoomOrderDetail(id);

        //RoomOrderId = int.Parse(LbRoomOrderId.Text),

        //orderDetail.RoomType = LbRoomType.Text;
        orderDetail.PetName = txtPetName.Text;
        orderDetail.Requirement = txtRequire.Text;



        orderUtility.EditRoomOrderDetail(orderDetail);

        Response.Redirect("~/b_03Hotel/3_2_HotelOrder.aspx");


    }


    protected void txtCustomerId_TextChanged(object sender, EventArgs e)
    {
        //RoomOrderUtility orderUtility = new RoomOrderUtility();
        //if (orderUtility.searchCus(int.Parse(txtCustomerId.Text)) == false)
        //{
        //    Label1.Text = "客戶編號不存在";
        //}
        //else
        //{
        //    Label1.Text = "";
        //}


    }



    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void txtCheckIn_TextChanged(object sender, EventArgs e)
    {
        string roomType = Request.QueryString["RoomType"];
        RoomUtility Utility = new RoomUtility();
        Room room = Utility.GetRooms(roomType);

        DateTime SdateTime = DateTime.Parse(txtCheckIn.Text);
        DateTime EdateTime = DateTime.Parse(txtCheckOut.Text);
        int time = (EdateTime - SdateTime).Days;
        LbTotal.Text = (time * room.Price.GetValueOrDefault(0)).ToString();

    }

    protected void txtCheckOut_TextChanged(object sender, EventArgs e)
    {
        string roomType = Request.QueryString["RoomType"];

        RoomUtility Utility = new RoomUtility();

        Room room = Utility.GetRooms(roomType);

        DateTime SdateTime = DateTime.Parse(txtCheckIn.Text);
        DateTime EdateTime = DateTime.Parse(txtCheckOut.Text);
        int time = (EdateTime - SdateTime).Days;
        LbTotal.Text = (time * room.Price.GetValueOrDefault(0)).ToString();
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
                <div class="col-md-1"></div>
                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">訂單編輯</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRoomOrderId" class="col-sm-2 col-form-label">訂單編號</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbRoomOrderId" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCustomerId" class="col-sm-2 col-form-label">客戶編號</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbCustomerId" CssClass="form-control" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtCustomerId" CssClass="form-control" placeholder="客戶編號" runat="server" OnTextChanged="txtCustomerId_TextChanged" AutoPostBack="True"></asp:TextBox>--%>
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCheckIn" class="col-sm-2 col-form-label">入住日</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCheckIn" CssClass="form-control" placeholder="入住日" runat="server" AutoPostBack="True" OnTextChanged="txtCheckIn_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCheckOut" class="col-sm-2 col-form-label">退房日</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCheckOut" CssClass="form-control" placeholder="退房日" runat="server" AutoPostBack="True" OnTextChanged="txtCheckOut_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRoomType" class="col-sm-2 col-form-label">房型</label>
                                    <div class="col-sm-9 from-group">
                                        <asp:Label ID="LbRoomType" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:DropDownList ID="DrpRoomType" runat="server" CssClass="form-control js-example-basic-single w-100" DataSourceID="SqlDataSource1" DataTextField="RoomType" DataValueField="RoomType" AppendDataBoundItems="True">
                                            <asp:ListItem>----</asp:ListItem>
                                        </asp:DropDownList>
                                       
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT [RoomType] FROM [RoomOrderDetails]"></asp:SqlDataSource>
                                        --%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetName" class="col-sm-2 col-form-label">寵物名字</label>
                                    <div class="col-sm-9">
                                        <%--<asp:Label ID="LbPetName" runat="server" Text="Label"></asp:Label>--%>
                                        <asp:TextBox ID="txtPetName" CssClass="form-control" placeholder="PetName" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRequire" class="col-sm-2 col-form-label">特殊需求</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtRequire" CssClass="form-control" placeholder="特殊需求" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtTotal" class="col-sm-2 col-form-label">總金額</label>
                                    <div class="col-sm-9">
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:Label ID="LbTotal" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtTotal" CssClass="form-control" placeholder="總金額" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <%--<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <AlternatingItemTemplate>
                                        <li style="background-color: #FFFFFF;color: #284775;">RoomType:
                                            <asp:Label ID="RoomTypeLabel" runat="server" Text='<%# Eval("RoomType") %>' />
                                            <br />
                                            PetName:
                                            <asp:Label ID="PetNameLabel" runat="server" Text='<%# Eval("PetName") %>' />
                                            <br />
                                            Requirement:
                                            <asp:Label ID="RequirementLabel" runat="server" Text='<%# Eval("Requirement") %>' />
                                            <br />
                                        </li>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <li style="background-color: #999999;">RoomType:
                                            <asp:TextBox ID="RoomTypeTextBox" runat="server" Text='<%# Bind("RoomType") %>' />
                                            <br />
                                            PetName:
                                            <asp:TextBox ID="PetNameTextBox" runat="server" Text='<%# Bind("PetName") %>' />
                                            <br />
                                            Requirement:
                                            <asp:TextBox ID="RequirementTextBox" runat="server" Text='<%# Bind("Requirement") %>' />
                                            <br />
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        </li>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        No data was returned.
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <li style="">RoomType:
                                            <asp:TextBox ID="RoomTypeTextBox" runat="server" Text='<%# Bind("RoomType") %>' />
                                            <br />PetName:
                                            <asp:TextBox ID="PetNameTextBox" runat="server" Text='<%# Bind("PetName") %>' />
                                            <br />Requirement:
                                            <asp:TextBox ID="RequirementTextBox" runat="server" Text='<%# Bind("Requirement") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        </li>
                                    </InsertItemTemplate>
                                    <ItemSeparatorTemplate>
<br />
                                    </ItemSeparatorTemplate>
                                    <ItemTemplate>
                                        <li style="background-color: #E0FFFF;color: #333333;">RoomType:
                                            <asp:Label ID="RoomTypeLabel" runat="server" Text='<%# Eval("RoomType") %>' />
                                            <br />
                                            PetName:
                                            <asp:Label ID="PetNameLabel" runat="server" Text='<%# Eval("PetName") %>' />
                                            <br />
                                            Requirement:
                                            <asp:Label ID="RequirementLabel" runat="server" Text='<%# Eval("Requirement") %>' />
                                            <br />
                                        </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <li runat="server" id="itemPlaceholder" />
                                        </ul>
                                        <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                                        </div>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">RoomType:
                                            <asp:Label ID="RoomTypeLabel" runat="server" Text='<%# Eval("RoomType") %>' />
                                            <br />
                                            PetName:
                                            <asp:Label ID="PetNameLabel" runat="server" Text='<%# Eval("PetName") %>' />
                                            <br />
                                            Requirement:
                                            <asp:Label ID="RequirementLabel" runat="server" Text='<%# Eval("Requirement") %>' />
                                            <br />
                                        </li>
                                    </SelectedItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT [RoomType], [PetName], [Requirement] FROM [RoomOrderDetails] WHERE ([RoomOrderId] = @RoomOrderId)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="RoomOrderId" QueryStringField="id" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>

                                <%--<div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetName" class="col-sm-2 col-form-label">寵物名</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPetName" CssClass="form-control" placeholder="寵物名" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_DrpRoomType" class="col-sm-2 col-form-label">房型</label>
                                    <div class="col-sm-9 from-group">
                                        <asp:DropDownList ID="DrpRoomType" runat="server" CssClass="form-control js-example-basic-single w-100" DataSourceID="SqlDataSource1" DataTextField="RoomType" DataValueField="RoomType" AppendDataBoundItems="True" OnSelectedIndexChanged="DrpRoomType_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem>----</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [RoomType] FROM [Rooms]"></asp:SqlDataSource>
                                        <%--<asp:TextBox ID="txtRoomType" CssClass="form-control" placeholder="房型" runat="server"></asp:TextBox>--%>
                            </div>
                        </div>
                        <%--<div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtTotal" class="col-sm-2 col-form-label">總金額</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtTotal" CssClass="form-control" placeholder="總金額" runat="server"></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </div>
                                </div>--%>
                        <%--<div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRequire" class="col-sm-2 col-form-label">特殊需求</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtRequire" CssClass="form-control" placeholder="特殊需求" runat="server"></asp:TextBox>
                                    </div>
                                </div>--%>

                        <div class="form-group row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2">
                                <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                <%--<asp:Button ID="btnCancel" runat="server" Text="取消" class="btn btn-danger mr-2" />--%>
                                <button type="button" id="btnCancel" class="btn btn-danger mr-2">
                                    <a href="3_2_HotelOrder.aspx" style="color: white;">取消</a>
                                    <%--<i class="typcn typcn-edit btn-icon-append"></i>--%>
                                </button>
                                <%--<button type="button" class="btn btn-primary mr-2">編輯</button>
                                        <button type="submit" class="btn btn-primary mr-2">確認</button>
                                        <button class="btn btn-light">取消</button>--%>
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


    <!-- content-wrapper ends -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script>
        $(function () {
            $("#BodyHolder_txtCheckIn").datepicker({
                dateFormat: "yy/mm/dd",
                changeYear: true,
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
            });
            $("#BodyHolder_txtCheckOut").datepicker({
                dateFormat: "yy/mm/dd",
                changeYear: true,
                dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
            });
        })
    </script>
</asp:Content>
