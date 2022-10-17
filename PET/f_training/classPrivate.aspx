<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void btnReserve_Click(object sender, EventArgs e)
    {
        Response.Redirect("/f_training/classPrivateStep.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">

    <style>
        .card-header {
            border-radius: 20px;
        }
        progress-bar {
            background-color:orange; !important
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">

    <div class="container mt-3 pt-4 pb-4">

        <div class="col-12 text-dark">
            <h5 class="text-danger">「一對一教學」，最能貼近毛孩爸媽的需求，和貓、狗的狀況。老師會尋找最適合你和貓、狗的教學方式，也會持續調整學習進度，從課前評估問題到課後，終身服務！</h5>
        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header text-center bg-secondary text-dark">行為問題調整</div>
                    <div class="card-body">
                        <p class="card-text text-center">
                            改善貓、狗為問題<br />
                            嚴重吠叫、爆衝、亂大小便、破壞家具、緊張、攻擊⋯⋯等等<br />
                            戶外散步課程<br />
                            社會化訓練，鬆繩散步、幫助貓、狗情緒穩定<br />
                            基本指令<br />
                            響片訓練<br />
                            才藝訓練
                        </p>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="btnReserve" runat="server" CssClass="btn btn-primary" Text="預約免費咨詢" OnClick="btnReserve_Click" />                        
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header text-center bg-info text-light">幼犬訓練課</div>
                    <div class="card-body">
                        <p class="card-text text-center">
                            社會化訓練<br />
                            散步、跟隨<br />
                            觸摸練習<br />
                            改善幼犬行為問題<br />
                            基本指令：坐、趴、等待⋯<br />
                            響片訓練<br />
                            玩玩具
                        </p>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="預約免費咨詢" OnClick="btnReserve_Click"/> 
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
            $("a[href='/f_training/classprivate.aspx']").addClass("active");
            $("a[href='/f_training/classprivate.aspx']").parent().prev().addClass("active");



        })

    </script>
</asp:Content>

