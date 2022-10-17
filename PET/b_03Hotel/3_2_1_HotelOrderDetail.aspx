<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">


    protected void btnOK_Click(object sender, EventArgs e)
    {



    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {
            int id = int.Parse(Request.QueryString["id"]);
            RoomOrderUtility Utility = new RoomOrderUtility();
            RoomOrder room = Utility.GetRoomOrder(id);

            //LbID.Text = room.RoomOrderId.ToString();
            LbCheckIn.Text = Convert.ToDateTime(room.CheckIn).ToShortDateString();
            LbCheckOut.Text = Convert.ToDateTime(room.CheckOut).ToShortDateString();
            LbRoomType.Text = room.RoomType;
            LbTotal.Text = room.Total;


            RoomOrderDetail roomOrderDetails = Utility.GetRoomOrderDetail(id);

            //RoomOrderDetail orderDetail = orderUtility.GetRoomOrderDetail(types);
            //LbRoomType.Text = roomOrderDetails.RoomType;
            LbPetName.Text = roomOrderDetails.PetName;
            LbRequire.Text = roomOrderDetails.Requirement;

            //int detail = int.Parse(Request.QueryString["details"]);
            //List<RoomOrderDetail> rooms = Utility.GetRoomOrderDetail(id);


            //Repeater2.DataSource = roomOrderDetails;
            //Repeater2.DataBind();



        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #hotel i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    住宿訂單管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">

        <div class="content-wrapper">
            <%--<asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>--%>
            <%--<div id="accordion1">--%>
            <div class="row">

                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">訂單內容</h4>
                            <div class="forms-sample">
                                <%--<div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbID" class="col-sm-3 col-form-label">客戶編號</label>
                                    <asp:Label ID="LbID" runat="server" Text="Label"></asp:Label>
                                    <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("CustomerId")%></label>--%>
                                    <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>
                                </div>--%>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCheckIn" class="col-sm-3 col-form-label">入住日</label>
                                    <asp:Label ID="LbCheckIn" runat="server" Text="Label"></asp:Label>
                                    <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("CheckIn")%></label>--%>
                                    <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbCheckOut" class="col-sm-3 col-form-label">退房日</label>
                                    <asp:Label ID="LbCheckOut" runat="server" Text="Label"></asp:Label>
                                    <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label"><%#Eval("CheckOut")%></label>--%>
                                    <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRoomType" class="col-sm-3 col-form-label">房型</label>
                                    <%--<div class="col-sm-9 from-group">--%>
                                        <asp:Label ID="LbRoomType" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:DropDownList ID="DrpRoomType" runat="server" CssClass="form-control js-example-basic-single w-100" DataSourceID="SqlDataSource1" DataTextField="RoomType" DataValueField="RoomType" AppendDataBoundItems="True">
                                            <asp:ListItem>----</asp:ListItem>
                                        </asp:DropDownList>
                                       
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT [RoomType] FROM [RoomOrderDetails]"></asp:SqlDataSource>
                                        --%>
                                    <%--</div>--%>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbPetName" class="col-sm-3 col-form-label">寵物名字</label>
                                    <%--<div class="col-sm-9">--%>
                                        <asp:Label ID="LbPetName" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtPetName" CssClass="form-control" placeholder="PetName" runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbRequire" class="col-sm-3 col-form-label">特殊需求</label>
                                    <%--<div class="col-sm-9">--%>
                                        <asp:Label ID="LbRequire" runat="server" Text="Label"></asp:Label>
                                        <%--<asp:TextBox ID="txtRequire" CssClass="form-control" placeholder="特殊需求" runat="server"></asp:TextBox>--%>
                                    <%--</div>--%>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_LbTotal" class="col-sm-3 col-form-label">總金額</label>
                                    <asp:Label ID="LbTotal" runat="server" Text="Label"></asp:Label>
                                    <%--<label for="exampleInputUsername2" class="col-sm-5 col-form-label">$<%#Eval("Total")%></label>--%>
                                    <%--                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                                    </div>--%>
                                </div>
                            </div>
                        
                        <div class="form-group row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2">
                                <%--<button type="button" id="btnDelete" class="btn btn-primary mr-2">
                                                <a href="3_2_3_HotelOrderDelete.aspx" style="color: white;">刪除</a>
                                                <i class="typcn typcn-edit btn-icon-append"></i>
                                            </button>--%>
                                <%--<asp:Button ID="btnOK" runat="server" Text="確認" class="btn btn-success mr-2" OnClick="btnOK_Click" />--%>
                                <%--<asp:Button ID="btnPrevious" runat="server" Text="回上一頁" class="btn btn-danger mr-2" />--%>
                                <button type="button" id="btnPrevious" class="btn btn-danger mr-2">
                                    <a href="3_2_HotelOrder.aspx" style="color: white;">回上一頁</a>
                                    <%--<i class="typcn typcn-edit btn-icon-append"></i>--%>
                                </button>
                                <%--<button type="button" class="btn btn-primary mr-2">編輯</button>
                                        <button type="submit" class="btn btn-primary mr-2">確認</button>
                                        <button class="btn btn-light">取消</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--<div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div id="accordion1" class="col-12">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-header" data-toggle="collapse" data-target="#content1">
                                        訂單細項-Details
                                    </div>
                                    <div class="collapse show" id="content1" data-parent="#accordion1">
                                        <div class="card-body">
                                            <p class="card-text text-Left">房型 : <%#Eval("RoomType")%></p>
                                            <p class="card-text text-Left">寵物名稱 : <%#Eval("PetName")%></p>
                                            <p class="card-text text-Left">特殊需求 : <%#Eval("Requirement")%></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>--%>
            <%-- </ItemTemplate>
            </asp:Repeater>--%>
            <hr />

        

    </div>
    <div class="col-md-1"></div>



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
</asp:Content>
