<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (Page.IsPostBack == false)
        {
            //querystring 讀房間資料
            string roomType = Request.QueryString["RoomType"];
            //int id = int.Parse(Request.QueryString["id"]);
            RoomUtility Utility = new RoomUtility();

            Room room = Utility.GetRooms(roomType);



            LbRoomType.Text = roomType;
            //LbTotal.Text = room.Price.ToString();

        }

    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        //Session拿客戶資料CustomerID
        if (Session["loginUser"] == null)
        {
            Response.Redirect("../f_login.html");
        }
        else
        {
            Member member = Session["loginUser"] as Member;
            int customerID = member.CustomerId;

            if (chkIsActive.Checked)
            {
                //LbRoomType拿房型資料
                string roomType = Request.QueryString["RoomType"];

                RoomUtility Utility = new RoomUtility();

                Room room = Utility.GetRooms(roomType);

                //txtDateStart txtDateEnd 拿天數
                DateTime SdateTime = DateTime.Parse(txtDateStart.Text);
                DateTime EdateTime = DateTime.Parse(txtDateEnd.Text);
                int time = (EdateTime - SdateTime).Days;

                //querystring 讀房間資料 拿房間價錢
                RoomOrder order = new RoomOrder()
                {
                    CustomerId = customerID,
                    RoomType = Request.QueryString["RoomType"],
                    CheckIn = DateTime.Parse(txtDateStart.Text),
                    CheckOut = DateTime.Parse(txtDateEnd.Text),
                    Total = (time * room.Price.GetValueOrDefault(0)).ToString()
                };

                RoomOrderUtility orderUtility = new RoomOrderUtility();
                orderUtility.AddRoomOrder(order);

                RoomOrderDetail orderDetail = new RoomOrderDetail()
                {
                    RoomOrderId = order.RoomOrderId,
                    RoomType = Request.QueryString["RoomType"],
                    PetName = txtPetName.Text,
                    Requirement = txtRequire.Text
                };

                orderUtility.AddRoomOrderDetails(orderDetail);

                //int total = int.Parse(LbTotal.Text);
                //int day = int.Parse(HiddenField1.Value);
                //int roomprice = int.Parse(HiddenField2.Value);
                //total = day * roomprice;
                //LbTotal.Text = total.ToString();

                Session["RoomOrder"] = order;
                Session["OrderDetail"] = orderDetail;

                Response.Redirect("~/f_booking/ReservationRecord.aspx");
            }
            else
            {
                Label1.Text = "如已確認填寫資料請勾選";

            }
        }
    }

    protected void txtDateStart_TextChanged(object sender, EventArgs e)
    {


        //string type = Request.QueryString["RoomType"];

        //RoomOrderUtility roomOrderUtility = new RoomOrderUtility();

        //string sd = txtDateStart.Text;
        //string ed = txtDateEnd.Text;

        //bool result = roomOrderUtility.IfDateHasSelected(type, sd, ed);
        //if (result == false)
        //{
        //    LbStartError.Text = "start date error";
        //}


        //計算總金額
        string roomType = Request.QueryString["RoomType"];
        RoomUtility Utility = new RoomUtility();
        Room room = Utility.GetRooms(roomType);

        DateTime SdateTime = DateTime.Parse(txtDateStart.Text);
        DateTime EdateTime = DateTime.Parse(txtDateEnd.Text);
        int time = (EdateTime - SdateTime).Days;
        LbTotal.Text = (time * room.Price.GetValueOrDefault(0)).ToString();

    }

    protected void txtDateEnd_TextChanged(object sender, EventArgs e)
    {
        //計算總金額
        string roomType = Request.QueryString["RoomType"];
        RoomUtility Utility = new RoomUtility();
        Room room = Utility.GetRooms(roomType);

        DateTime SdateTime = DateTime.Parse(txtDateStart.Text);
        DateTime EdateTime = DateTime.Parse(txtDateEnd.Text);
        int time = (EdateTime - SdateTime).Days;
        LbTotal.Text = (time * room.Price.GetValueOrDefault(0)).ToString();
    }



    protected void btnDemo_Click(object sender, EventArgs e)
    {
        string roomType = Request.QueryString["RoomType"];
        RoomUtility Utility = new RoomUtility();
        Room room = Utility.GetRooms(roomType);
        //txtDateStart.Text = "2022/10/18";
        //txtDateEnd.Text = "2022/10/20";
        txtPetName.Text = "咖咖";
        txtRequire.Text = "很愛睡覺";
        //DateTime SdateTime = DateTime.Parse(txtDateStart.Text);
        //DateTime EdateTime = DateTime.Parse(txtDateEnd.Text);
        //int time = (EdateTime - SdateTime).Days;
        //LbTotal.Text = (time * room.Price.GetValueOrDefault(0)).ToString();

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css" />
    <%--<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" />
    <%--<link rel="stylesheet" href="sweetalert2/dist/sweetalert2.min.css">--%>
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />

    <script src="b_forBackend/jquery.js"></script>
    <style>
        body {
            background: url("/f_img/erik-jan-leusink-QTe-MHNUrz4-unsplash.jpg") center bottom;
            background-size: cover;
            /*background: url('/f_img/freestocks-t8SxccV0Agw-unsplash.jpg') ;*/
        }

        header h1 {
            font-size: 70px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-11.jpg);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }

        header h2 {
            font-size: 30px;
            font-weight: 500;
            background-image: url(/f_img/PET/PET4.png);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }

        header h3 {
            font-size: 25px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-14.jpg);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }
        /*header h1 {
            font-size: 30px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-3.jpg);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }*/

        .three h1 {
            font-size: 28px;
            font-weight: 500;
            letter-spacing: 0;
            line-height: 1.5em;
            padding-bottom: 15px;
            position: relative;
        }

            .three h1:before {
                content: "";
                position: absolute;
                left: 0;
                bottom: 0;
                height: 5px;
                width: 55px;
                background-color: #111;
            }

            .three h1:after {
                content: "";
                position: absolute;
                left: 0;
                bottom: 2px;
                height: 1px;
                width: 95%;
                max-width: 255px;
                background-color: #333;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <%--<div style="background: url(../f_img/erik-jan-leusink-QTe-MHNUrz4-unsplash.jpg) repeat-y; background-size: cover;">--%>
    <div class="container mt-3 pt-4 pb-4">
        <%--<nav class="breadcrumb">
                <a href="cat.aspx" class="breadcrumb-item">Pet</a>
                <a href="catroom-overview.aspx" class="breadcrumb-item">Overview</a>
                <a href="room-inner.aspx" class="breadcrumb-item">Room Intro</a>
                <span class="breadcrumb-item">Room Booking</span>
                <span class="breadcrumb-item">Booking Finish</span>
            </nav>--%>


        <%--<div class="container-fluid">--%>

        <br />
        <header>
            <h1>Room Booking 房間預約</h1>
        </header>
        <%--<div class="display-1 text-primary">Room Booking</div>
            
            
            <div class="three">
                <h1 class="text-danger">房間預約</h1>
            </div>--%>
        <br />
        <br />
        <br />
        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="from" class="text-dark font-weight-bold">選擇日期 :</label>
            <div class="col-sm-9">
                <input id="txtDateRange" type="button" value="點此按鈕以選擇日期" class="dateRange form-control col-6 bg-warning font-weight-bold" />
            </div>
        </div>
        <br />
        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="from" class="text-dark font-weight-bold">入住日期 :</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtDateStart" runat="server" CssClass="form-control col-6" AutoPostBack="True" OnTextChanged="txtDateStart_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDateStart" ErrorMessage="入住日期不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                <asp:Label ID="LbStartError" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <br />
        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="to" class="text-dark font-weight-bold">退房日期 :</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtDateEnd" runat="server" CssClass="form-control col-6" AutoPostBack="True" OnTextChanged="txtDateEnd_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDateEnd" ErrorMessage="退房日期不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
                <asp:Label ID="LbCheckOut" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <br />
        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="RoomType" class="text-dark font-weight-bold">房型種類 :</label>
            <div class="col-sm-9">
                <asp:Label ID="LbRoomType" runat="server" Text="Label" class="text-dark font-weight-bold"></asp:Label>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="petName" class="text-dark font-weight-bold">寵物名字 :</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtPetName" runat="server" CssClass="form-control col-6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPetName" ErrorMessage="寵物名字不可為空白" ForeColor="#ff3300"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="Require" class="text-dark font-weight-bold">特殊需求 :</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtRequire" runat="server" CssClass="form-control col-6"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="form-group row">
            <div class="col-sm-1"></div>
            <label for="Total" class="text-dark font-weight-bold">總金額 :</label>
            <div class="col-sm-9">
                <asp:Label ID="LbTotal" runat="server" Text="" class="text-dark font-weight-bold"></asp:Label>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
            </div>
        </div>
        <br />

        <div class="form-group row">
            <div class="col-sm-3"></div>
            <div class="col-sm-9 form-check pt-2">
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <asp:CheckBox ID="chkIsActive" class="form-check-input" name="chkIsActive" runat="server" />
                <label class="form-check-label font-weight-bold text-dark" for="BodyHolder_chkIsActive">已確認資料正確</label>
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="#009999" Font-Bold="true"></asp:Label>
            </div>

        </div>

        <div class="col-6 text-dark form-group row justify-content-end">
            <div class="col-sm-6 ">
                <asp:Button ID="btnNext" runat="server" Text="完成" CssClass="btn btn-success form-control col-7" OnClick="btnNext_Click" />
                <div class="pb-2">
                    <%--  <asp:LinkButton ID="btnNext" runat="server" CssClass="btn btn-success form-control col-6" Text="下一步" OnClick="btnNext_Click"></asp:LinkButton>--%>
                    <%--<asp:LinkButton ID="btnNext" runat="server" CssClass="btn btn-success" Text="下一步" href="ReservationRecord.aspx"></asp:LinkButton>--%>
                    <%--<asp:Label ID="Label1" runat="server" Text=""></asp:Label>--%>
                    <br />
                    <asp:Button ID="btnDemo" runat="server" Text="Demo" CssClass="btn btn-info form-control col-7" CausesValidation="False" OnClick="btnDemo_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--</div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@latest"></script>
    <%--<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>--%>
    <%--<script src="/b_forBackend/js/sweetalert2.js"></script>--%>
    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_booking/cat.aspx']").addClass("active");
            $("a[href='/f_booking/cat.aspx']").parent().prev().addClass("active");


            $("input.dateRange").daterangepicker({
                alwaysShowCalendars: true,
                showDropdowns: true,
                autoUpdateInput: false,
                opens: "right",

                ranges: {
                    "今天": [moment(), moment()]
                    //"過去 7 天": [moment().subtract(6, "days"), moment()],
                    //"本月": [moment().startOf("month"), moment().endOf("month")],
                    //"上個月": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
                },
                locale: {
                    format: "YYYY/MM/DD",
                    separator: " ~ ",
                    applyLabel: "確定",
                    cancelLabel: "清除",
                    fromLabel: "開始日期",
                    toLabel: "結束日期",
                    customRangeLabel: "選擇日期",
                    daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
                    monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
                        "7月", "8月", "9月", "10月", "11月", "12月"],
                    firstDay: 1
                }
            });
            $("input.dateRange").on("cancel.daterangepicker", function (ev, picker) {
                $(this).val("");
            });
            $("input.dateRange").on("apply.daterangepicker", function (ev, picker) {
                //$(this).val(picker.startDate.format("YYYY/MM/DD") + " - " + picker.endDate.format("YYYY/MM/DD"));
                $("#BodyHolder_txtDateStart").val(picker.startDate.format("YYYY/MM/DD"));
                $("#BodyHolder_txtDateEnd").val(picker.endDate.format("YYYY/MM/DD"));
                setTimeout(' __doPostBack(\' ctl00$BodyHolder$txtDateStart\', \' \') ', 0)
            });
            $("input.dateRange").trigger("change");


            //$("#btnNext").click(function () {
            //    swal({
            //        title: "確認資料內容?",
            //        text: "請確認填寫的資料是否都正確",
            //        type: "warning",
            //        showCancelButton: true,
            //        confirmButtonClass: "btn-danger",
            //        confirmButtonText: "確認都正確",
            //        closeOnConfirm: false
            //    },
            //        function () {
            //            swal("預約成功", "恭喜您已預約成功", "success");
            //        });
            //});


        })
    </script>
</asp:Content>

