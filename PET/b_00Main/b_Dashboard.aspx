<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        ProductUtility productUtility = new ProductUtility();
        List<MallProduct> mallProducts = productUtility.GetAllProducts().Where(p => p.Stock < 10).ToList();


        if (mallProducts.Count != 0)
        {
            Repeater1.DataSource = mallProducts;
            Repeater1.DataBind();

        }
        else
        {
            Label2.Text = "目前庫存充足!";
        }

        //貓---------------------------------------------------------------------------------------------------------------------------------------
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["PetHotelConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;


        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cmd.CommandText = "select a.ProductName , Sum(a.Number) as ProductCount from MallOrdersDetails as a " +
                "left join MallProducts as b " +
                "on a.ProductID = b.ProductID " +
                "where SUBSTRING(a.OrderDate,0, 8) = SUBSTRING( convert(varchar(25), getdate(), 111),0,8) " +
                "and b.Category = '貓咪' " +
                "group by a.ProductName";

        DataTable dt = new DataTable();
        da.Fill(dt);

        //要用AsEnumerable()才可以用LINQ
        var CatProdAry = dt.AsEnumerable().Select(r => r["ProductName"].ToString()).ToArray();
        var CatCountAry = dt.AsEnumerable().Select(r => r["ProductCount"].ToString()).ToArray();

        //把隱藏欄位中的值存進陣列
        HiddenField1.Value = string.Join(",", CatProdAry);
        HiddenField2.Value = string.Join(",", CatCountAry);

        //狗---------------------------------------------------------------------------------------------------------------------------------------

        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = cn;


        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        cmd2.CommandText = "select a.ProductName , Sum(a.Number) as ProductCount from MallOrdersDetails as a " +
                "left join MallProducts as b " +
                "on a.ProductID = b.ProductID " +
                "where SUBSTRING(a.OrderDate,0, 8) = SUBSTRING( convert(varchar(25), getdate(), 111),0,8) " +
                "and b.Category = '狗狗' " +
                "group by a.ProductName";

        DataTable dt2 = new DataTable();
        da2.Fill(dt2);

        //要用AsEnumerable()才可以用LINQ
        var DogProdAry = dt2.AsEnumerable().Select(r => r["ProductName"].ToString()).ToArray();
        var DogCountAry = dt2.AsEnumerable().Select(r => r["ProductCount"].ToString()).ToArray();

        //把隱藏欄位中的值存進陣列
        HiddenField3.Value = string.Join(",", DogProdAry);
        HiddenField4.Value = string.Join(",", DogCountAry);

        //---------------------------------------------------------------------------------------------------------------------------------------

        //RoomUtility Utility = new RoomUtility();

        //Repeater2.DataSource = Utility.GetAllRooms();
        //Repeater2.DataBind();



        //房間狀態
        SqlDataAdapter daRoom = new SqlDataAdapter(cmd);
        cmd.CommandText = "select roomtype,status,color =" +
                "case status" +
                " when '未清掃' then 'bg-gradient-danger'" +
                " when '使用中' then 'bg-gradient-info'" +
                " when '空房' then 'bg-gradient-success'" +
                " when '清掃中' then 'bg-gradient-warning'" +
                " end" +
                " from rooms";
        cmd.CommandText = "select roomtype,status,color =" +
        "case status" +
        " when '未清掃' then 'bg-danger'" +
        " when '使用中' then 'bg-info'" +
        " when '空房' then 'bg-success'" +
        " when '清掃中' then 'bg-warning'" +
        " end" +
        " from rooms";


        //DataTable dtRoom = new DataTable();
        //daRoom.Fill(dtRoom);
        //Repeater2.DataSource = dtRoom;
        //Repeater2.DataBind();

        SqlDataAdapter daRoom1 = new SqlDataAdapter(cmd);
        cmd.CommandText = "select roomtype,status,color =" +
                "case status" +
                " when '未清掃' then 'carddanger'" +
                " when '使用中' then 'cardinfo'" +
                " when '空房' then 'cardsuccess'" +
                " when '清掃中' then 'cardwarning'" +
                " end" +
                " from rooms";


        DataTable dtRoom1 = new DataTable();
        daRoom1.Fill(dtRoom1);
        Repeater3.DataSource = dtRoom1;
        Repeater3.DataBind();
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        .roomStatus {
            background-color: rgba(255, 206, 86, 0.2);
            border-color: rgba(255, 206, 86, 1);
        }


        .card1 h3 {
            color: #262626;
            font-size: 17px;
            line-height: 24px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .card1 p {
            font-size: 17px;
            font-weight: 400;
            line-height: 20px;
            color: #666666;
        }

            .card1 p .small {
                font-size: 14px;
            }


        .go-corner {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            width: 32px;
            height: 32px;
            overflow: hidden;
            top: 0;
            right: 0;
            background-color: #00838d;
            border-radius: 0 4px 0 32px;
        }

        .go-arrow {
            margin-top: -4px;
            margin-right: -4px;
            color: white;
            font-family: courier, sans;
        }

        .card1 {
            display: block;
            position: relative;
            max-width: 262px;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 32px 24px;
            margin: 12px;
            text-decoration: none;
            z-index: 0;
            overflow: hidden;
        }

            .card1:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: -16px;
                right: -16px;
                background: #00838d;
                height: 32px;
                width: 32px;
                border-radius: 32px;
                transform: scale(1);
                transform-origin: 50% 50%;
                transition: transform 0.25s ease-out;
            }

            .card1:hover:before {
                transform: scale(21);
            }

            .card1:hover p {
                transition: all 0.3s ease-out;
                color: rgba(255, 255, 255, 0.8);
            }

            .card1:hover h3 {
                transition: all 0.3s ease-out;
                color: #ffffff;
            }
        /*---------------------------------------------*/
        .carddanger h3 {
            color: #262626;
            font-size: 17px;
            line-height: 24px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .carddanger p {
            font-size: 17px;
            font-weight: 400;
            line-height: 20px;
            color: #666666;
        }

            .carddanger p .small {
                font-size: 14px;
            }


        .carddanger .go-corner {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            width: 32px;
            height: 32px;
            overflow: hidden;
            top: 0;
            right: 0;
            background-color: #DC3545;
            border-radius: 0 4px 0 32px;
        }

        .carddanger .go-arrow {
            margin-top: -4px;
            margin-right: -4px;
            color: white;
            font-family: courier, sans;
        }

        .carddanger {
            display: block;
            position: relative;
            max-width: 262px;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 32px 24px;
            margin: 12px;
            text-decoration: none;
            z-index: 0;
            overflow: hidden;
        }

            .carddanger:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: -16px;
                right: -16px;
                background: #DC3545;
                height: 32px;
                width: 32px;
                border-radius: 32px;
                transform: scale(1);
                transform-origin: 50% 50%;
                transition: transform 0.25s ease-out;
            }

            .carddanger:hover:before {
                transform: scale(21);
            }

            .carddanger:hover p {
                transition: all 0.3s ease-out;
                color: rgba(255, 255, 255, 0.8);
            }

            .carddanger:hover h3 {
                transition: all 0.3s ease-out;
                color: #ffffff;
            }
        /*---------------------------------------------*/
        .cardinfo h3 {
            color: #262626;
            font-size: 17px;
            line-height: 24px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .cardinfo p {
            font-size: 17px;
            font-weight: 400;
            line-height: 20px;
            color: #666666;
        }

            .cardinfo p .small {
                font-size: 14px;
            }


        .cardinfo .go-corner {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            width: 32px;
            height: 32px;
            overflow: hidden;
            top: 0;
            right: 0;
            background-color: #3B86D1;
            border-radius: 0 4px 0 32px;
        }

        .cardinfo .go-arrow {
            margin-top: -4px;
            margin-right: -4px;
            color: white;
            font-family: courier, sans;
        }

        .cardinfo {
            display: block;
            position: relative;
            max-width: 262px;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 32px 24px;
            margin: 12px;
            text-decoration: none;
            z-index: 0;
            overflow: hidden;
        }

            .cardinfo:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: -16px;
                right: -16px;
                background: #3B86D1;
                height: 32px;
                width: 32px;
                border-radius: 32px;
                transform: scale(1);
                transform-origin: 50% 50%;
                transition: transform 0.25s ease-out;
            }

            .cardinfo:hover:before {
                transform: scale(21);
            }

            .cardinfo:hover p {
                transition: all 0.3s ease-out;
                color: rgba(255, 255, 255, 0.8);
            }

            .cardinfo:hover h3 {
                transition: all 0.3s ease-out;
                color: #ffffff;
            }
        /*---------------------------------------------*/
        .cardsuccess h3 {
            color: #262626;
            font-size: 17px;
            line-height: 24px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .cardsuccess p {
            font-size: 17px;
            font-weight: 400;
            line-height: 20px;
            color: #666666;
        }

            .cardsuccess p .small {
                font-size: 14px;
            }


        .cardsuccess .go-corner {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            width: 32px;
            height: 32px;
            overflow: hidden;
            top: 0;
            right: 0;
            background-color: #21BF06;
            border-radius: 0 4px 0 32px;
        }

        .cardsuccess .go-arrow {
            margin-top: -4px;
            margin-right: -4px;
            color: white;
            font-family: courier, sans;
        }

        .cardsuccess {
            display: block;
            position: relative;
            max-width: 262px;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 32px 24px;
            margin: 12px;
            text-decoration: none;
            z-index: 0;
            overflow: hidden;
        }

            .cardsuccess:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: -16px;
                right: -16px;
                background: #21BF06;
                height: 32px;
                width: 32px;
                border-radius: 32px;
                transform: scale(1);
                transform-origin: 50% 50%;
                transition: transform 0.25s ease-out;
            }

            .cardsuccess:hover:before {
                transform: scale(21);
            }

            .cardsuccess:hover p {
                transition: all 0.3s ease-out;
                color: rgba(255, 255, 255, 0.8);
            }

            .cardsuccess:hover h3 {
                transition: all 0.3s ease-out;
                color: #ffffff;
            }
        /*---------------------------------------------*/
        .cardwarning h3 {
            color: #262626;
            font-size: 17px;
            line-height: 24px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .cardwarning p {
            font-size: 17px;
            font-weight: 400;
            line-height: 20px;
            color: #666666;
        }

            .cardwarning p .small {
                font-size: 14px;
            }


        .cardwarning .go-corner {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            width: 32px;
            height: 32px;
            overflow: hidden;
            top: 0;
            right: 0;
            background-color: #F39915;
            border-radius: 0 4px 0 32px;
        }

        .cardwarning .go-arrow {
            margin-top: -4px;
            margin-right: -4px;
            color: white;
            font-family: courier, sans;
        }

        .cardwarning {
            display: block;
            position: relative;
            max-width: 262px;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 32px 24px;
            margin: 12px;
            text-decoration: none;
            z-index: 0;
            overflow: hidden;
        }

            .cardwarning:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: -16px;
                right: -16px;
                background: #F39915;
                height: 32px;
                width: 32px;
                border-radius: 32px;
                transform: scale(1);
                transform-origin: 50% 50%;
                transition: transform 0.25s ease-out;
            }

            .cardwarning:hover:before {
                transform: scale(21);
            }

            .cardwarning:hover p {
                transition: all 0.3s ease-out;
                color: rgba(255, 255, 255, 0.8);
            }

            .cardwarning:hover h3 {
                transition: all 0.3s ease-out;
                color: #ffffff;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">



            <div class="row">
                <div class="col-xl-12 grid-margin stretch-card flex-column">
                    <h5 class="mb-2 text-titlecase mb-4">庫存最新消息</h5>
                    <div class="row">
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server">
                                                <li> 【<a href="../b_01Shop/1_1_2_ProductEditAddDetail.aspx?ProductID=<%#Eval("ProductID") %>"><%#Eval("ProductName") %></a>】
                                                     只剩 
                                                    <span class="test"><%#Eval("Stock") %></span> 個，請儘速補貨</li>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <%--Chart--%>

            <div class="row">
                <div class="col-xl-12 grid-margin stretch-card flex-column">
                    <h5 class="mb-2 text-titlecase mb-4">當月銷售量</h5>
                    <div class="row">

                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <h4 class="card-title">貓類</h4>
                                    <canvas id="pieChart1"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <asp:HiddenField ID="HiddenField3" runat="server" />
                                    <asp:HiddenField ID="HiddenField4" runat="server" />
                                    <h4 class="card-title">狗類</h4>
                                    <canvas id="pieChart2"></canvas>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>


            <%--房間狀態--%>
            <div class="row">
                <div class="col-xl-12 grid-margin stretch-card flex-column">
                    <h5 class="mb-2 text-titlecase mb-4">房間狀態</h5>
                    <div class="row">

                        <asp:Repeater ID="Repeater3" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 col-md-3 col-lg-2 grid-margin stretch-card">
                                    <div class="card <%#Eval("color") %>" title="<%#Eval("status") %>">
                                        <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap">
                                            <h3><%#Eval("roomtype") %></h3>
                                            <p><a class="text-secondary" href="../b_03Hotel/3_3_4_RoomOrder.aspx?types=<%#Eval("RoomType")%>"><%#Eval("status") %></a></p>
                                            <i class="typcn typcn-briefcase icon-xl text-secondary"></i>
                                            <div class="go-corner">
                                                <div class="go-arrow"> 
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>


        </div>
        <!-- content-wrapper ends -->
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script src="../b_forBackend/js/chart.js"></script>
    <script src="../b_forBackend/utils.js"></script>
    <script>
        $(".test").css('color', 'red');
    </script>
    <script>

        function getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        function getRandomColors(num) {
            var ary = [];
            for (var i = 0; i < num; i++) {

                ary.push(getRandomColor())
            }
            return ary;
        }

        //圓餅圖
        var ctx1 = document.getElementById("pieChart1");
        var pieChart = new Chart(ctx1, {
            type: 'pie',
            data: {
                labels: document.getElementById("BodyHolder_HiddenField1").value.split(","),
                datasets: [{
                    label: '售出數量',
                    data: document.getElementById("BodyHolder_HiddenField2").value.split(","),
                    backgroundColor: getRandomColors(document.getElementById("BodyHolder_HiddenField2").value.split(",").length),
                    //borderColor: getRandomColors(document.getElementById("BodyHolder_HiddenField2").value.split(",").length),
                    fill: true,
                    borderWidth: 2
                }]
            }
        });


        var ctx1 = document.getElementById("pieChart2");
        var pieChart = new Chart(ctx1, {
            type: 'pie',
            data: {
                labels: document.getElementById("BodyHolder_HiddenField3").value.split(","),
                datasets: [{
                    label: '售出數量',
                    data: document.getElementById("BodyHolder_HiddenField4").value.split(","),
                    backgroundColor: getRandomColors(document.getElementById("BodyHolder_HiddenField4").value.split(",").length),
                    //borderColor: getRandomColors(document.getElementById("BodyHolder_HiddenField2").value.split(",").length),
                    fill: true,
                    borderWidth: 2
                }]
            }
        });

    </script>

</asp:Content>
