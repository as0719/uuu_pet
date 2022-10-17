<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            PageUtility page = new PageUtility();
            page.BindRepeater($"select * from Rooms where PetType ='狗'", RprAll, RprPage, 0, 3);
        }

    }


    protected void DrpStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DrpStatus.SelectedItem.Text == "請選擇")
        {
            PageUtility page = new PageUtility();

            page.BindRepeater($"select * from Rooms where PetType ='狗'", RprAll, RprPage, 0, 3);
        }
        else
        {
            PageUtility page = new PageUtility();
            page.BindRepeater($"select * from Rooms where RoomType like '%{DrpStatus.SelectedItem.Text}%'", RprAll, RprPage, 0, 3);
        }
    }

    protected void RprPage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int pageNum = Convert.ToInt32(e.CommandArgument) - 1;

        if (DrpStatus.SelectedItem.Text == "請選擇")
        {
            PageUtility pageUtility = new PageUtility();

            pageUtility.BindRepeater($"select * from Rooms where PetType ='狗'", RprAll, RprPage, pageNum, 3);
        }
        else
        {
            PageUtility pageUtility = new PageUtility();

            pageUtility.BindRepeater($"select * from Rooms where RoomType like '%{DrpStatus.SelectedItem.Text}%' and PetType = '狗'",
                RprAll, RprPage, pageNum, 3);

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">

    <style>
        .card {
            background: #fae5cd;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            img

        {
            max-width: 800px;
        }

        }

        [class*="row"] {
            margin-bottom: 1em;
            /*justify-content: center;*/
        }


        .jumbotron {
            background: url('../f_img/DogRoom3.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            height: 40vh;
            width: 100vw;
            margin-left: -15px;
            position: relative;
            text-align: center;
        }

        .content {
            margin-top: 150px;
        }

        header h1 {
            font-size: 70px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-13.jpg);
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



        .five h1 {
            text-align: left;
            font-size: 30px;
            font-weight: 700;
            color: #202020;
            text-transform: uppercase;
            word-spacing: 1px;
            letter-spacing: 2px;
        }

            .five h1 span {
                margin-top: 40px;
                text-transform: none;
                font-size: .75em;
                font-weight: normal;
                font-style: italic;
                font-family: "Playfair Display","Bookman",serif;
                color: #a58383;
                letter-spacing: -0.005em;
                word-spacing: 1px;
                letter-spacing: none;
            }

            .five h1:before {
                position: absolute;
                left: 0;
                bottom: 38px;
                width: 60px;
                height: 4px;
                content: "";
                left: 50%;
                margin-left: -30px;
                background-color: #dfdfdf;
            }

        .three h1 {
            font-size: 24px;
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
    <%--<div style="background-image: linear-gradient(to right, #fac282, #fae5cd);">--%>
    <%--<div class="container-fluid py-2 mt-3 pt-4 pb-4">--%>
    <div class="container-fluid">
        <div class="jumbotron">
            <div class="content">
                <h1 class="text-light">Dog's Room 犬房</h1>
                <br />
                <h5 class="text-light">房間依體型、體重量身打造，選擇適合寶貝的房間，讓寶貝在住宿期間也有足夠的休息空間。</h5>
                <br />
            </div>
            <div class="text-center btnDiv">
                <%--<a href="#moreContent" class="scroll-down btn btn-primary btn-xl">Find Out More</a>--%>
            </div>
        </div>
    </div>


    <div id="moreContent" class="moreContent container-fluid">
        <div class="overviewTitle row">
            <div class="col-md-12">
                <header>
                    <h2>Room Introduction 房型介紹</h2>
                </header>
                <div class="container py-2 mt-3 pt-4 pb-4">
                    <div class="form-group">
                        <div class="input-group justify-content-center">
                            <label class="col-form-label">選擇寵物尺寸: </label>
                            &nbsp&nbsp&nbsp
                                <asp:DropDownList ID="DrpStatus" runat="server" CssClass="form-control col-3" AutoPostBack="true" OnSelectedIndexChanged="DrpStatus_SelectedIndexChanged">
                                    <asp:ListItem>請選擇</asp:ListItem>
                                    <asp:ListItem>大型</asp:ListItem>
                                    <asp:ListItem>中型</asp:ListItem>
                                    <asp:ListItem>小型</asp:ListItem>
                                </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row equal">
                        <asp:Repeater ID="RprAll" runat="server">
                            <ItemTemplate>
                                <%--<div class="rooms-wrapper">--%>
                                <%-- <div class="d-flex flex-row flex-nowrap">
                            <div class="card-group">--%>


                                <%--<div class="col-sm-4 d-flex pb-3">--%>
                                <%--<div class="col-12 col-sm-6 col-lg-6 col-md-4 pb-3">
                                    <div class="card card-inverse card-primary">
                                        <div class="card-block">--%>
                                <div class="col-lg-4 col-md-6">
                                    <div class="team card position-relative overflow-hidden border-0 mb-3">
                                        <img class="card-img-top" src="/f_img/<%#Eval("RoomImageUrl")%>" />
                                        <h3 class="card-title text-secondary"><strong><%#Eval("RoomType")%></strong></h3>
                                        <h5 class="card-text"><%#Eval("PetType")%>狗房型</h5>
                                        <h6 class="card-text">高度| <%#Eval("RoomHeight")%></h6>
                                        <h6 class="card-text">寬度| <%#Eval("RoomWidth")%></h6>
                                        <h6 class="card-text">深度| <%#Eval("RoomDepth")%></h6>
                                        <div>
                                            <h3 class="text-info">
                                                <br />
                                                NT$<%#Eval("Price")%>/天</h3>
                                        </div>
                                        <a class="btn btn-primary" href="dog-room-booking.aspx?RoomType=<%#Eval("RoomType") %>">點我預約</a>
                                        <%--<a href="#" class="btn btn-outline-secondary">Outline</a>--%>
                                    </div>
                                </div>
                                <%--</div>
                            </div>--%>
                            </ItemTemplate>
                        </asp:Repeater>

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

                        <%--</section>--%>
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <div class="three">
                                <h1 class="text-info">設備: </h1>

                            </div>

                            <h5 class="text-dark font-weight-bold">
                                <br />
                                <br />
                                <br />
                                24小時監視器<br />
                                24小時除濕機<br />
                                24小時空氣清淨機<br />
                                軟床墊<br />
                                獨立隔間<br />
                                獨立空調
                            </h5>
                        </div>
                        <br />
                        <div class="row">
                            <div class="three">
                                <h1 class="text-info">入住須知: </h1>
                            </div>
                            <p class="text-dark">
                                <br />
                                １. 為保障毛孩皆能享受到充分的照顧，本店一律採預約制，恕無法提供現場臨時預約。<br />
                                住宿前需經過本館6小時的安親評估，確定寶貝沒有攻擊性或者嚴重分離焦慮方可接受入住。<br />
                                服務時間為10：30~19：30。<br />
                                敬請事先預約參觀或預約住宿，以便安排房型及做入住前準備作業。<br />

                                <br />
                                ２. 住宿收費方式以過夜計算，辦理入住/退房時間為10：30~18：00。<br />
                                如因家長行程安排須在營業時間外辦理入住或退房，請提前來電告知，若超過晚上8點即視為過夜，請於隔日再行辦理退房並加收一日房型費用。<br />
                                超過48小時未主動帶回，且無法聯繫飼主，本館將視為惡意棄養，得以依動物保護法處置或送養他人，飼主不得有異。<br />

                                <br />
                                ３. 寵物已滿六個月以上，且完成疫苗接種。<br />
                                8歲以上、手術60天內、懷孕等高風險犬隻，需額外簽立切結書。<br />

                                <br />
                                ４. 入住時請攜帶家長之國民身分證正本及影本做登記。<br />
                                本店將留存影本，退房時影本一併退回，以及提供兩位在台灣的緊急連絡人，並結清住房費用。<br />

                                <br />
                                ５. 住宿以健康狗狗為限，住宿狗狗需檢附寵物保健預防手冊－有效日期內之疫苗施打證明的正本。<br />
                                疫苗注射後7天左右，寵物免疫力會下降，請在入住前7天施打完成。<br />

                                <br />
                                ６. 寵物於美容服務前，本館人員將評估狗狗狀況，若有焦慮、不適或明顯健康異常、手術傷口尚未痊癒、未完成疫苗接種或施打疫苗未滿一個禮拜、需特殊照護的寵物，本館將予以拒收，敬請見諒。<br />

                                <br />
                                ７. 為維護其他寵物的權益，患有傳染疾病的狗狗，恕無法提供服務。<br />

                                <br />
                                ８. 入住前請告知狗狗身體及皮膚健康狀況。若隱瞞狗狗患有疾病，如：傳染性疾病、先天性疾病、慢性疾病，或未注射預防疫苗……等任何狀況未告知，並影響其他狗狗權益或因而引發任何之傷亡，本店恕無法負責；若因此危害其他住宿狗狗健康，需請家長負起全部責任。<br />
                                ＊＊＊在不主動通報的情況下，若作業期間在寵物身上或排泄物中發現任何蟲體，將立即通知飼主，並酌收館內消毒費用1500元以上。＊＊＊<br />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_booking/dog.aspx']").addClass("active");
            $("a[href='/f_booking/dog.aspx']").parent().prev().addClass("active");

            $('.scroll-down').click(function (e) {
                var linkHref = $(this).attr('href');
                $('html,body').animate({
                    scrollTop: $(linkHref).offset().top
                });
                e.preventDefault();
            });
        })

    </script>


</asp:Content>

