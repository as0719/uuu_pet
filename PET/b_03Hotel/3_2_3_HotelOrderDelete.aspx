<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = int.Parse(Request.QueryString["id"]);
            RoomOrderUtility Utility = new RoomOrderUtility();
            RoomOrder room = Utility.GetRoomOrder(id);
            LbRoomOrderId.Text = room.RoomOrderId.ToString();
            LbCustomerId.Text = room.CustomerId.ToString();
            LbRoomType.Text = room.RoomType;
            LbCheckIn.Text = Convert.ToDateTime(room.CheckIn).ToShortDateString();
            LbCheckOut.Text = Convert.ToDateTime(room.CheckOut).ToShortDateString();
            LbTotal.Text = room.Total;

            RoomOrderDetail roomOrderDetails = Utility.GetRoomOrderDetail(id);

            //RoomOrderDetail orderDetail = orderUtility.GetRoomOrderDetail(types);
            //LbRoomType.Text = roomOrderDetails[0].RoomType;
            LbPetName.Text = roomOrderDetails.PetName;
            LbRequire.Text = roomOrderDetails.Requirement;
        }

    }

    protected void btnOK_Click(object sender, EventArgs e)
    {

        int id = int.Parse(Request.QueryString["id"]);
        RoomOrderUtility Utility = new RoomOrderUtility();
        RoomOrder room = Utility.GetRoomOrder(id);
        RoomOrderDetail roomOrderDetails = Utility.GetRoomOrderDetail(id);

        Utility.DeleteRoomOrderDetail(int.Parse(LbRoomOrderId.Text));
        Utility.DeleteRoomOrder(int.Parse(LbRoomOrderId.Text));
        

        Response.Redirect("~/b_03Hotel/3_2_HotelOrder.aspx");

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">

    <style>
        #hotel i.menu-arrow:before {
            content: "\e0bd";
        }

        body {
            font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
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
                            <h4 class="card-title">訂單刪除</h4>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRoomOrderId" class="col-sm-2 col-form-label">訂單號碼</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbRoomOrderId" CssClass="form-control" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCustomerId" class="col-sm-2 col-form-label">客戶編號</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbCustomerId" CssClass="form-control" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRoomType" class="col-sm-2 col-form-label">房型</label>
                                    <div class="col-sm-9 from-group">
                                        <asp:Label ID="LbRoomType" CssClass="form-control" runat="server" Text=""></asp:Label>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCheckIn" class="col-sm-2 col-form-label">入住日</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbCheckIn" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtCheckIn" CssClass="form-control" placeholder="入住日" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCheckOut" class="col-sm-2 col-form-label">退房日</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbCheckOut" runat="server" CssClass="form-control" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtCheckOut" CssClass="form-control" placeholder="退房日" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPetName" class="col-sm-2 col-form-label">寵物名字</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbPetName" CssClass="form-control" runat="server" Text=""></asp:Label>
                                        <%--<asp:TextBox ID="txtPetName" CssClass="form-control" placeholder="PetName" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRequire" class="col-sm-2 col-form-label">特殊需求</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbRequire" CssClass="form-control" runat="server" Text=""></asp:Label>
                                        <%--<asp:TextBox ID="txtRequire" CssClass="form-control" placeholder="特殊需求" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtTotal" class="col-sm-2 col-form-label">總金額</label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="LbTotal" runat="server" CssClass="form-control" Text=""></asp:Label>
                                        <%--<asp:TextBox ID="txtTotal" CssClass="form-control" placeholder="總金額" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10"></div>
                                    <div class="col-md-2">
                                        <%--<asp:Button ID="btnDelete" runat="server" Text="刪除" class="btn btn-primary mr-2" />--%>
                                        <asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-primary mr-2" OnClick="btnOK_Click" />
                                        <button type="button" class="btn btn-danger mr-2">
                                            <a href="3_2_HotelOrder.aspx" style="color: white;">取消</a>
                                            <%--<i class="typcn typcn-delete-outline btn-icon-append"></i>--%>
                                        </button>

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


    <%--            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table">
                                <thead>
                                    <tr>
                                        <th class="ml-5">訂單號碼</th>
                                        <th>訂購人ID</th>
                                        <th>房型名稱</th>
                                        <th>入住日</th>
                                        <th>退房日</th>
                                        <th>總金額</th>
                                        <th>編輯</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#P1</td>
                                        <td>NameP1</td>
                                        <td>SM_D1</td>
                                        <td>2022年08月19日</td>
                                        <td>2022年08月23日</td>
                                        <td>$1000</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                    檢視
                                                           
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                    刪除
                                                           
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#P2</td>
                                        <td>NameP2</td>
                                        <td>2022年08月20日</td>
                                        <td>2022年08月25日</td>
                                        <td>$1000</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                    檢視
                                                           
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                    刪除
                                                           
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>--%>
    <!-- content-wrapper ends -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script>

        //$(function () {

        //    $("#btnOK").click(function () {
        //        swal({
        //            title: '確認?',
        //            text: "檔案即將被刪除!",
        //            type: 'question',
        //            showCancelButton: true,
        //            confirmButtonColor: '#3085d6',
        //            cancelButtonColor: '#d33',
        //            confirmButtonText: '刪除',
        //            cancelButtonText: '取消'
        //        });


        //    });

        //})
    </script>

</asp:Content>
