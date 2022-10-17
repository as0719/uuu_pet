<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <style>
        header.masthead {
            padding-top: 10rem;
            padding-bottom: calc(10rem - 4.5rem);
            background: linear-gradient(to bottom, rgba(92, 77, 66, 0.5) 0%, rgba(92, 77, 66, 0.8) 100%), url("/f_img/DogRoom2.png");
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


        header h1 {
            font-size: 75px;
            font-weight: 500;
            background-image: url(/f_img/PET/cat-7.jpg);
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <header class="masthead">
        <div class="container px-4 px-lg-5 h-100">
            <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                <div class="col-lg-8 align-self-end">
                    <h1 class="text-white font-weight-bold">Dog's Room 狗狗房</h1>
                    <hr class="divider" />
                </div>
                <div class="col-lg-8 align-self-baseline">
                    <p class="text-white mb-5">每間房間皆為獨立式空調，隔絕狗狗們在氣味上相互影響。</p>
                    <br />
                    <a class="scroll-down btn btn-primary btn-xl" href="dogroom-overview.aspx">Get Started!</a>
                </div>
            </div>
        </div>
    </header>

<%--    <!-- About-->
    <section class="page-section bg-primary" id="about">
        <div class="container px-4 px-lg-5 h-100">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="text-white mt-0">Welcome to our Dog's Room!</h2>
                    <hr class="divider divider-light" />
                    <p class="text-white mb-5">玻璃建材的使用，讓房間容易好沖洗，常保潔淨!</p>
                    <a class="btn btn-light btn-xl font-weight-bold" href="dogroom-overview.aspx">Get Started!</a>
                </div>
            </div>
        </div>
    </section>--%>



    <%--<div style="background-image: linear-gradient(to right, #fac282, #fae5cd);">
        <div class="container mt-3 pt-4 pb-4 ">
            <div class="display-1 text-primary"></div>
            <br />
            
            <header>
                <h1>Dog's Room 狗狗房</h1>
            </header>
            <br />
            <header>
                <h3>每間房間皆為獨立式空調，隔絕狗狗們在氣味上相互影響。<br />
                玻璃建材的使用，讓房間容易好沖洗，常保潔淨。</h3>
            </header>

            <br />
            
            <a href="dogroom-overview.aspx" class="btn btn-info" role="button">LEARN MORE</a>

            <a href="dogroom-overview.aspx">
                <img alt="" class="swiper-lazy mbl swiper-lazy-loaded" src="/f_img/DogRoom2.png"></a>


        </div>
    </div>--%>
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

