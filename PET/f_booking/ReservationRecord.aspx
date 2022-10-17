<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">



    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {


            if (Session["RoomOrder"] != null && Session["OrderDetail"] != null)
            {
                RoomOrder roomOrder = Session["RoomOrder"] as RoomOrder;
                RoomOrderDetail orderDetail = Session["OrderDetail"] as RoomOrderDetail;

                LbCheckIn.Text = Convert.ToDateTime(roomOrder.CheckIn).ToShortDateString();
                LbCheckOut.Text = Convert.ToDateTime(roomOrder.CheckOut).ToShortDateString();
                LbRoomType.Text = roomOrder.RoomType;
                LbPetName.Text = orderDetail.PetName;
                LbRequire.Text = orderDetail.Requirement;
                LbTotal.Text = roomOrder.Total;
            }


            //RoomOrderUtility Utility = new RoomOrderUtility();
            //RoomOrder room = Utility.GetRoomOrder(id);

            //LbID.Text = room.RoomOrderId.ToString();
            //LbCheckIn.Text = room.CheckIn.ToString();
            //LbCheckOut.Text = room.CheckOut.ToString();
            //LbTotal.Text = room.Total;

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <style>

/*        @font-face {
  font-family: "Poppins-Regular";
  src: url("../fonts/poppins/Poppins-Regular.ttf"); }
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box; }
*/
        body {
  font-family: "Poppins-Regular";
  font-size: 15px;
  margin: 5;
  background: url("/f_img/catdog3.jpg") center bottom;
  background-size: cover; }


/*        .masthead {
            position: relative;
            overflow: hidden;
            z-index: 2;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .masthead:before {
                content: "";
                position: absolute;
                top: 0;
                bottom: 0;
                right: 0;
                left: 0;
                height: 100%;
                width: 100%;
                background-color: rgba(0, 0, 0, 0.85);
            }

            .masthead .masthead-content {
                position: relative;
                max-width: 40rem;
                padding-top: 5rem;
                padding-bottom: 5rem;
            }

                .masthead .masthead-content h1, .masthead .masthead-content .h1 {
                    font-size: 2.5rem;
                }

                .masthead .masthead-content p {
                    font-size: 1.2rem;
                }

                    .masthead .masthead-content p strong {
                        font-weight: 700;
                    }

                .masthead .masthead-content .input-group-newsletter input {
                    height: auto;
                    width: 100%;
                    font-size: 1rem;
                    padding: 1rem;
                }

                .masthead .masthead-content .input-group-newsletter button {
                    font-size: 0.85rem;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    padding: calc(1rem + 2px);
                }

        @media (min-width: 992px) {
            .masthead {
                height: 100%;
                width: 75vw;
                min-height: 0;
                padding-bottom: 0;
            }

                .masthead:before {
                    transform: skewX(-9deg);
                    transform-origin: top right;
                }

                .masthead .masthead-content {
                    padding-top: 0;
                    padding-bottom: 0;
                    padding-left: 2rem;
                    padding-right: 9rem;
                }

                    .masthead .masthead-content h1, .masthead .masthead-content .h1 {
                        font-size: 3.5rem;
                    }

                    .masthead .masthead-content p {
                        font-size: 1.3rem;
                    }
        }

        @media (min-width: 1200px) {
            .masthead {
                width: 65vw;
            }
        }

        img.bg-video {
  position:fixed;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  transform: translateX(-50%) translateY(-50%);
  z-index: 0;
  display:inline;
}*/

       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <%--<img class="bg-video" alt="" src="/f_img/dog-cat.jpg" />--%>

    <%--<div class="wrapper">--%>
            <%--<div action="" id="wizard">--%>
         <%--  <div class="masthead">
        <div class="masthead-content text-white">--%> 
            <div class="container-fluid mt-4 px-5 px-lg-4">
                <h1 class="lh-3 mb-6 mt-5 text-danger">訂購完成! Order Completed</h1>
                <h5 class="mt-4 mb-5">此次訂單: </h5>

                <%--<div style="background-image: linear-gradient(to right, #fcdfbd, #fcd2a4);">
        <div class="container mt-3 pt-4 pb-4">
            
            <br />
            <br />
            <header>
                <h1>訂購完成! Order Completed</h1>
            </header>
            <div class="col-6 text-success">

            <br />
            <br />
            <div class="three">
                <h2 class="text-info">此次訂單: </h2>
            </div>--%>

                <div id="contactForm" data-sb-form-api-token="API_TOKEN">
                    <%--<div class="row input-group-newsletter">--%>
                    <div class="forms-sample text-dark">
                        <div class="form-group row">
                            <label for="BodyHolder_txtCheckIn" class="col-sm-3 col-form-label font-weight-bold">入住日</label>
                            <asp:Label ID="LbCheckIn" CssClass="col-sm-6 col-form-label" runat="server" Text="Label"></asp:Label>
                            <div class="col-sm-3"></div>
                        </div>
                        <div class="form-group row">
                            <label for="BodyHolder_txtCheckOut" class="col-sm-3 col-form-label font-weight-bold">退房日</label>
                            <asp:Label ID="LbCheckOut" CssClass="col-sm-6 col-form-label" runat="server" Text="Label"></asp:Label>
                            <div class="col-sm-3"></div>
                        </div>
                        <div class="form-group row">
                            <label for="BodyHolder_LbRoomType" class="col-sm-3 col-form-label font-weight-bold">房型</label>
                            <asp:Label ID="LbRoomType" runat="server" CssClass="col-sm-6 col-form-label" Text="Label"></asp:Label>
                            <div class="col-sm-3"></div>
                        </div>
                        <div class="form-group row">
                            <label for="BodyHolder_txtPetName" class="col-sm-3 col-form-label font-weight-bold">寵物名字</label>
                            <asp:Label ID="LbPetName" runat="server" CssClass="col-sm-6 col-form-label" Text="Label"></asp:Label>
                            <div class="col-sm-3"></div>
                        </div>
                        <div class="form-group row">
                            <label for="BodyHolder_txtRequire" class="col-sm-3 col-form-label font-weight-bold">特殊需求</label>
                            <asp:Label ID="LbRequire" runat="server" CssClass="col-sm-6 col-form-label" Text="Label"></asp:Label>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                            <label for="BodyHolder_txtTotal" class="col-sm-3 col-form-label font-weight-bold">總金額</label>
                            <asp:Label ID="LbTotal" runat="server" CssClass="col-sm-6 col-form-label" Text="Label"></asp:Label>
                            <div class="col-sm-3"></div>
                        </div>
                        <%--</div>--%>
                    </div>
                    <br />
                    <div class="col-5 text-dark form-group">

                        <%--<asp:Button ID="btnHome" runat="server" class="btn btn-success" OnClick="btnHome_Click" Text="回首頁" />--%>
                        <a href="../f_index.aspx" class="btn btn-info col-sm-7 col-form-label" role="button">回首頁</a>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />

                    </div>
                </div>
            </div>
        <%--</div>--%>
    <%--</div>--%>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_booking/cat.aspx']").addClass("active");
            $("a[href='/f_booking/cat.aspx']").parent().prev().addClass("active");

        })
    </script>
</asp:Content>

