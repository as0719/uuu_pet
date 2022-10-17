<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        RoomUtility roomUtility = new RoomUtility();

        Room room = new Room();

        RprAll.DataSource = roomUtility.GetAllRooms().Where(c => c.PetType == "貓");
        RprAll.DataBind();

        //PageUtility page = new PageUtility();
        //page.BindRepeater($"select * from Rooms where PetType ='貓'", RprAll, RprPage, 0, 3);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["loginUser"] == null)
        {
            Response.Redirect("../f_login.html");
        }
        else
        {
            string roomType = (sender as LinkButton).CommandArgument;

            Response.Redirect("room-booking.aspx?RoomType=" + roomType);
        }
    }

    protected void RprPage_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //PageUtility pageUtility = new PageUtility();
        //int pageNum = Convert.ToInt32(e.CommandArgument) - 1;
        //pageUtility.BindRepeater("select * from Rooms where PetType ='貓'", RprAll, RprPage, pageNum, 3);

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
            background: url('../f_img/CatRoom3.jpg') no-repeat center center fixed;
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
    <%--<div style="background: url(../f_img/pngtree-cute-blue-cat-picture-image_1362790.jpg) no-repeat; background-size: cover;">--%>
    <%--<div style="background-image: linear-gradient(to right, #fae5cd, #fac282);">
        <div class="container-fluid py-2 mt-3 pt-4 pb-4 ">--%>
    <%--<div class="container-fluid">--%>

    <div class="container-fluid">
        <div class="jumbotron">
            <div class="content">
                <h1 class="text-light">Cat's Room 貓房</h1>
                <br />
                <h5 class="text-light">垂直空間符合貓咪天性，躲藏區域設計讓寶貝在住宿期間也有足夠的休息空間。</h5>
                <br />
            </div>
            <div class="text-center btnDiv">
                <%--<a href="#moreContent" class="scroll-down btn btn-primary btn-xl font-weight-bold">Find Out More</a>--%>
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
                    <div class="row equal">
                        <asp:Repeater ID="RprAll" runat="server">
                            <ItemTemplate>


                                <%--<div class="col-12 col-sm-6 col-lg-6 col-md-4 pb-3">
                                    <div class="card card-inverse card-primary">
                                        <div class="card-block">--%>
                                <div class="col-lg-4 col-md-6">
                                    <div class="team card position-relative overflow-hidden border-0 mb-3">
                                        <img class="card-img-top" src="/f_img/<%#Eval("RoomImageUrl")%>" />
                                        <h3 class="card-title text-secondary"><strong><%#Eval("RoomType")%></strong></h3>
                                        <h5 class="card-text"><%#Eval("PetType")%>咪房型</h5>
                                        <h6 class="card-text">高度| <%#Eval("RoomHeight")%></h6>
                                        <h6 class="card-text">寬度| <%#Eval("RoomWidth")%></h6>
                                        <h6 class="card-text">深度| <%#Eval("RoomDepth")%></h6>
                                        <div>
                                            <h3 class="text-info">
                                                <br />
                                                NT$<%#Eval("Price")%>/天</h3>
                                        </div>
                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary" CommandArgument='<%#Eval("RoomType")%>' OnClick="LinkButton1_Click">點我預約</asp:LinkButton>
                                        <%--<a href="#" class="btn btn-outline-secondary">Outline</a>--%>
                                    </div>
                                </div>
                                <%-- </div>--%>
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

                        <br />
                        <br />
                        <div class="row equal">
                            <div class="three">
                                <h1 class="text-info">設備: </h1>
                            </div>
                            <h5 class="text-dark font-weight-bold">
                                <br />
                                <br />
                                <br />
                                主題跳台<br />
                                抽屜式貓砂<br />
                                貓抓板<br />
                                獨立空調（與犬房分開）<br />
                                獨立空氣清淨機
                            </h5>
                        </div>
                        <br />

                        <div class="row equal">
                            <div class="three">
                                <h1 class="text-info">入住須知: </h1>
                            </div>
                            <p class="text-dark">
                                1. 為了保障各位毛孩能享受到充分的照顧，本店一律採預約制。恕無法提供現場臨時預約。<br />

                                2.為了貓咪住宿的品質，本店皆採預約參觀及入住退房。服務時間為10：30~19：30。敬請事先預約參觀或預約住宿，以便安排房型及做入住前準備作業。<br />

                                3.住宿收費方式以過夜計算，辦理入住/退房時間為10：30~18：00。如因家長行程安排須在營業時間外辦理入住或退房，請提前來電告知。若超過晚上8點即視為過夜，請於隔日再行辦理退房並加收一日房型費用。<br />

                                4.入住時請攜帶家長之國民身分證正本及影本做登記，本店將留存影本，退房時影本一併退回，以及提供兩位在台灣的緊急連絡人，並結清住房費用。<br />

                                5.住宿以健康貓咪為限，貓咪需檢附寵物保健預防手冊－有效日期內之疫苗施打證明的正本。疫苗注射後7天左右，寵物免疫力會下降，請在入住前7天施打完成。<br />

                                6. 入住前請將貓咪的指甲剪短，請確定貓咪已完成體內、體外驅蟲及除蚤，且有效期限未超過一個月。<br />

                                7.入住前請告知貓咪身體及皮膚健康狀況。若隱瞞貓咪患有疾病如：傳染性疾病、先天性疾病、慢性疾病，或未注射預防疫苗……等任何狀況未告知，並影響其他貓咪權益或因而引發任何之傷亡，本店恕無法負責；若因此危害其他住宿貓咪健康，需請家長負起全部責任。<br />
                                ＊＊＊在不主動通報的情況下，若作業期間在寵物身上或排泄物中發現任何蟲體，將立即通知飼主，並酌收館內消毒費用1500元以上。＊＊＊<br />

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<section class="section2 swiper-container-initialized swiper-container-horizontal">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="rooms-wrapper">
                    <div class="card-deck">
                        
                        <div class="card bg-light text-dark " style="max-width: 28%;">
                            <img class="card-img-top float-left" src="/f_img/<%#Eval("RoomImageUrl")%>" style="height: 650px;" />
                            <div class="card-body" style="background-color: papayawhip">
                                <h4 class="card-title text-secondary font-weight-bold"><%#Eval("RoomType")%></h4>
                                <h5 class="card-text text-left font-weight-bold"><%#Eval("PetType")%>咪房型</h5>
                                <h6 class="card-text text-left text-info">高度| <%#Eval("RoomHeight")%></h6>
                                <h6 class="card-text text-left text-info">寬度| <%#Eval("RoomWidth")%></h6>
                                <h6 class="card-text text-left text-info">深度| <%#Eval("RoomDepth")%></h6>
                                <div>
                                    <h3 class="text-warning">
                                        <br />
                                        NT$<%#Eval("Price")%>/天</h3>
                                </div>
                                <br />
                                
                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary" CommandArgument='<%#Eval("RoomType")%>' OnClick="LinkButton1_Click">點我預約</asp:LinkButton>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_booking/cat.aspx']").addClass("active");
            $("a[href='/f_booking/cat.aspx']").parent().prev().addClass("active");

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

