<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">

    <style>
        header.masthead {
            padding-top: 10rem;
            padding-bottom: calc(10rem - 4.5rem);
            background: linear-gradient(to bottom, rgba(92, 77, 66, 0.5) 0%, rgba(92, 77, 66, 0.8) 90%), url("/f_img/CatRoom.png");
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: scroll;
            background-size: cover;
        }

            header.masthead h1, header.masthead .h1 {
                font-size: 2.25rem;
            }

        @media (min-width: 992px) {
            header.masthead {
                height: 100vh;
                min-height: 40rem;
                padding-top: 4.5rem;
                padding-bottom: 0;
            }

                header.masthead p {
                    font-size: 1.15rem;
                }

                header.masthead h1, header.masthead .h1 {
                    font-size: 3rem;
                }
        }

        @media (min-width: 1200px) {
            header.masthead h1, header.masthead .h1 {
                font-size: 3.5rem;
            }
        }

        .page-section {
            padding: 25rem;
        }

        hr.divider-light {
            background-color: #fff;
        }



        /*header h1 {
            font-size: 75px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-13.jpg);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }

        header h3 {
            font-size: 20px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-11.jpg);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">

    <header class="masthead">
        <div class="container px-4 px-lg-5 h-100">
            <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                <div class="col-lg-8 align-self-end">
                    <h1 class="text-white font-weight-bold">Cat's Room 貓咪房</h1>
                    <hr class="divider" />
                </div>
                <div class="col-lg-8 align-self-baseline">
                    <p class="text-white mb-5">貓咪住宿跟狗狗住宿是分開的獨立區域並獨立帶位，盡可能降低彼此的干擾。</p>
                    <br />
                    <a class="scroll-down btn btn-primary btn-xl" href="catroom-overview.aspx">Get Started!</a>
                </div>
            </div>
        </div>
    </header>

    <!-- About-->
   <%-- <section class="page-section bg-primary" id="about">
        <div class="container px-4 px-lg-5 h-100">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="text-white mt-0">Welcome to our Cat's room!</h2>
                    <hr class="divider divider-light" />
                    <p class="text-white mb-5">貓咪房間總共有四間，每一間都有不同的主題跟跳台玩具，且皆有架設攝影機，掌握毛孩的一舉一動!</p>
                    <a class="btn btn-light btn-xl font-weight-bold" href="catroom-overview.aspx">Get Started!</a>
                </div>
            </div>
        </div>
    </section>--%>

    <%-- <div style="background-image: linear-gradient(to right, #fae5cd, #fac282);">
        <div class="container mt-3 pt-4 pb-4 ">
            <div class="display-1 text-primary"></div>
            <br />

            <header>
                <h1>Cat's Room 貓咪房</h1>
            </header>
            <br />
            <header>
                <h3>貓咪住宿跟狗狗住宿是分開的獨立區域並獨立帶位，盡可能降低彼此的干擾。<br />
                    貓咪房間總共有四間，每一間都有不同的主題跟跳台玩具，且皆有架設攝影機，掌握毛孩的一舉一動。</h3>
            </header>
            <br />
            <br />
            <%--<h2 class="text-danger">貓咪房</h2>
                <br />
                <p class="text-warning">
                    貓咪住宿跟狗狗住宿是分開的獨立區域並獨立帶位，盡可能降低彼此的干擾。<br />
                    貓咪房間總共有四間，每一間都有不同的主題跟跳台玩具，且皆有架設攝影機，掌握毛孩的一舉一動。
                </p>

            
            <a href="catroom-overview.aspx" class="btn btn-info" role="button">LEARN MORE</a>

            <a href="catroom-overview.aspx">
                <img alt="" class="swiper-lazy mbl swiper-lazy-loaded" src="/f_img/CatRoom.png"></a>
        </div>
    </div>--%>
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

