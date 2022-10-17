<%@ Page Title="PetLover" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">

    <!-- Carousel Start -->
    <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/f_img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h3 class="text-white mb-3 d-none d-sm-block">住宿環境</h3>
                            <h1 class="display-3 text-white mb-3">良好環境</h1>
                            <h5 class="text-white mb-3 d-none d-sm-block">每日清毒/提供視訊查看</h5>

                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/f_img/carousel-2.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h3 class="text-white mb-3 d-none d-sm-block">寵物訓練課程</h3>
                            <h1 class="display-3 text-white mb-3">跟寵物一起成長</h1>
                            <h5 class="text-white mb-3 d-none d-sm-block">富有經驗的訓練師與您一起了解您的寶貝</h5>

                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/f_img/carousel-4.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h3 class="text-white mb-3 d-none d-sm-block">購物商場</h3>
                            <h1 class="display-3 text-white mb-3">消費者安心購物</h1>
                            <h5 class="text-white mb-3 d-none d-sm-block">嚴格把關商品來源，杜絕來路不明的商品</h5>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-primary rounded" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-primary rounded" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- Services Start -->
    <div class="container-fluid bg-light pt-5">
        <div class="container py-5">
            <div class="d-flex flex-column text-center mb-5">
                <h4 class="text-secondary mb-3">服務項目</h4>
                <h1 class="display-4 m-0"><span class="text-primary">Premium</span> Pet Services</h1>
            </div>
            <div class="row pb-3">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5" style="height:500px">
                        <h3 class="flaticon-house display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">住宿服務</h3>
                        <p>Mini Boarding House住宿採用開方式活動空間,讓每個毛寶貝都有足夠的活動量，在活動時間保姆會帶寶貝們進行活動與遊戲，例如：嗅聞遊戲、海邊奔跑、農場探險等等活動，依寶貝社會化程度與喜好進行分區，保姆也會隨時注意寶貝們的狀況，透過網路通訊軟體與爸媽們建立良好的聯繫，讓爸媽們能更加安心。</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5" style="height:500px">
                        <h3 class="flaticon-food display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">食材管制</h3>
                        <p>每隻寵物都是飼主的寶貝，就如同家人一樣的重要。以關懷寵物的健康與提供高品質的寵物食品為宗旨，希望在安全與品質並重的理念下為寵物及飼主提供更多的優質產品，使寵物天天健康，</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5" style="height:500px">
                        <h3 class="flaticon-cat display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">寵物訓練</h3>
                        <p>由寵物訓練師、獸醫等專業人士授課，課程內容包含貓犬的行為分析、常見的疾病預防與照護、高齡犬照顧等。</p>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Services End -->


    <!-- Features Start -->
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-5">
                <img class="img-fluid w-100" src="/f_img/feature.jpg" alt="">
            </div>
            <div class="col-lg-7 py-5 py-lg-0 px-3 px-lg-5">
                <h4 class="text-secondary mb-3">我們的優勢</h4>
                <h1 class="display-4 mb-4"><span class="text-primary">貼心照護</span> 寵物</h1>
                <p class="mb-4">讓毛小孩不再只是寄宿，而是能夠擁有專屬於他們自己的假期！天下父母心，他們永遠都是我們最甜蜜的負擔、心裡最柔軟的一塊。不管是要出遊或是工作，都請放心將他們交付我們。</p>
                <div class="row py-2">
                    <div class="col-6">
                        <div class="d-flex align-items-center mb-4">
                            <h1 class="flaticon-cat font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">專業團隊</h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex align-items-center mb-4">
                            <h1 class="flaticon-doctor font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">信任服務</h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex align-items-center">
                            <h1 class="flaticon-care font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">貼心照護</h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex align-items-center">
                            <h1 class="flaticon-dog font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">緊急醫療</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features End -->



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_index.aspx']").addClass("active");

        })
    </script>
</asp:Content>

