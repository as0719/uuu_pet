<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">


    protected void btnOK_Click(object sender, EventArgs e)
    {
        RoomOrder roomOrder = new RoomOrder()
        {
            CustomerId = int.Parse(txtCustomerId.Text),
            CheckIn = DateTime.Parse(txtCheckIn.Text),
            CheckOut = DateTime.Parse(txtCheckOut.Text),
            Total = txtTotal.Text

        };

        RoomOrderDetail roomOrderDetail = new RoomOrderDetail()
        {
            RoomType = DrpRoomType.Text,
            PetName = txtPetName.Text,
            Requirement = txtRequire.Text
        };

        RoomOrderUtility orderUtility = new RoomOrderUtility();
        orderUtility.AddRoomOrder(roomOrder);
        orderUtility.AddRoomOrderDetails(roomOrderDetail);

        Response.Redirect("~/b_03Hotel/3_2_HotelOrder.aspx");

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            DrpRoomType.DataTextField = "RoomType";
            DrpRoomType.DataValueField = "RoomType";

        }



    }

    protected void DrpRoomType_SelectedIndexChanged(object sender, EventArgs e)
    {
        //計算天數
        DateTime SdateTime = DateTime.Parse(txtCheckIn.Text);
        DateTime EdateTime = DateTime.Parse(txtCheckOut.Text);
        TimeSpan time = SdateTime - EdateTime;
        double days = time.TotalDays;
        //switch (DrpRoomType.SelectedValue)
        //{
        //    case 
        //    default:
        //        break;
        //}
        txtTotal.Text = Convert.ToInt32(days).ToString();
    }

    protected void txtCustomerId_TextChanged(object sender, EventArgs e)
    {
        RoomOrderUtility orderUtility = new RoomOrderUtility();
        if (orderUtility.searchCus(int.Parse(txtCustomerId.Text)) == false)
        {
            Label1.Text = "客戶編號不存在";
        }
        else 
        {
            Label1.Text = "";
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
                <div class="col-md-1"></div>
                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">訂單新增</h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCustomerId" class="col-sm-2 col-form-label">客戶編號</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCustomerId" CssClass="form-control" placeholder="客戶編號" runat="server" OnTextChanged="txtCustomerId_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCheckIn" class="col-sm-2 col-form-label">入住日</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCheckIn" CssClass="form-control" placeholder="入住日" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCheckOut" class="col-sm-2 col-form-label">退房日</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCheckOut" CssClass="form-control" placeholder="退房日" runat="server"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="form-group row">
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
                                        <asp:DropDownList ID="DrpRoomType" runat="server" CssClass="form-control js-example-basic-single w-100" DataSourceID="SqlDataSource1" DataTextField="RoomType" DataValueField="RoomType" AppendDataBoundItems="True" OnSelectedIndexChanged="DrpRoomType_SelectedIndexChanged">
                                            <asp:ListItem>----</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [RoomType] FROM [Rooms]"></asp:SqlDataSource>
                                        <%--<asp:TextBox ID="txtRoomType" CssClass="form-control" placeholder="房型" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtTotal" class="col-sm-2 col-form-label">總金額</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtTotal" CssClass="form-control" placeholder="總金額" runat="server"></asp:TextBox>
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
