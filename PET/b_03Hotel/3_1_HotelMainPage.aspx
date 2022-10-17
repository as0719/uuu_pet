<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            RoomUtility Utility = new RoomUtility();

            //DrpStatus.SelectedValue = room.Status;
            DrpStatus.DataTextField = "Status";
            DrpStatus.DataValueField = "Status";
            List<Rooms> rooms1 = Utility.GetRoomByStatus("未清掃");
            Repeater1.DataSource = rooms1;
            Repeater1.DataBind();


            //Repeater2.DataSource = roomOrder.GetAllRoomOrders();
            //Repeater2.DataBind();
        }
    }

    protected void DrpStatus_SelectedIndexChanged(object sender, EventArgs e)
    {

        RoomUtility Utility = new RoomUtility();

        List<Rooms> rooms = Utility.GetRoomByStatus(DrpStatus.SelectedValue);

        Repeater1.DataSource = rooms;
        Repeater1.DataBind();

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
    住宿管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">

            <div class="row">
                <div class="col-xl-12 grid-margin stretch-card flex-column">
                    <h5 class="mb-2 text-titlecase mb-4">房間狀態</h5>
                    <div class="row">
                        <%-- <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <div class="col-md-2 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body d-flex flex-column justify-content-between">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <p class="mb-0 text-muted">房型訂單編號: <%#Eval("RoomOrderId")%></p>
                                            </div>
                                            <h4>Check In: <br /><%#Eval("CheckIn")%></h4><hr />
                                            <h4>Check Out: <br /><%#Eval("CheckOut")%></h4>
                                            <canvas id="transactions-chart" class="mt-auto" height="65"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>--%>
                        <%--<div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div>
                                            <p class="mb-2 text-muted">Sales</p>
                                            <h6 class="mb-0">563</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Orders</p>
                                            <h6 class="mb-0">720</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Revenue</p>
                                            <h6 class="mb-0">5900</h6>
                                        </div>
                                    </div>
                                    <canvas id="sales-chart-a" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <p class="mb-0 text-muted">Transactions</p>
                                        <p class="mb-0 text-muted">+1.37%</p>
                                    </div>
                                    <h4>1352</h4>
                                    <canvas id="transactions-chart" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div>
                                            <p class="mb-2 text-muted">Sales</p>
                                            <h6 class="mb-0">563</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Orders</p>
                                            <h6 class="mb-0">720</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Revenue</p>
                                            <h6 class="mb-0">5900</h6>
                                        </div>
                                    </div>
                                    <canvas id="sales-chart-a" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <p class="mb-0 text-muted">Transactions</p>
                                        <p class="mb-0 text-muted">+1.37%</p>
                                    </div>
                                    <h4>1352</h4>
                                    <canvas id="transactions-chart" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div>
                                            <p class="mb-2 text-muted">Sales</p>
                                            <h6 class="mb-0">563</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Orders</p>
                                            <h6 class="mb-0">720</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Revenue</p>
                                            <h6 class="mb-0">5900</h6>
                                        </div>
                                    </div>
                                    <canvas id="sales-chart-a" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <p class="mb-0 text-muted">Transactions</p>
                                        <p class="mb-0 text-muted">+1.37%</p>
                                    </div>
                                    <h4>1352</h4>
                                    <canvas id="transactions-chart" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div>
                                            <p class="mb-2 text-muted">Sales</p>
                                            <h6 class="mb-0">563</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Orders</p>
                                            <h6 class="mb-0">720</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Revenue</p>
                                            <h6 class="mb-0">5900</h6>
                                        </div>
                                    </div>
                                    <canvas id="sales-chart-a" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <p class="mb-0 text-muted">Transactions</p>
                                        <p class="mb-0 text-muted">+1.37%</p>
                                    </div>
                                    <h4>1352</h4>
                                    <canvas id="transactions-chart" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div>
                                            <p class="mb-2 text-muted">Sales</p>
                                            <h6 class="mb-0">563</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Orders</p>
                                            <h6 class="mb-0">720</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Revenue</p>
                                            <h6 class="mb-0">5900</h6>
                                        </div>
                                    </div>
                                    <canvas id="sales-chart-a" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <p class="mb-0 text-muted">Transactions</p>
                                        <p class="mb-0 text-muted">+1.37%</p>
                                    </div>
                                    <h4>1352</h4>
                                    <canvas id="transactions-chart" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div>
                                            <p class="mb-2 text-muted">Sales</p>
                                            <h6 class="mb-0">563</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Orders</p>
                                            <h6 class="mb-0">720</h6>
                                        </div>
                                        <div>
                                            <p class="mb-2 text-muted">Revenue</p>
                                            <h6 class="mb-0">5900</h6>
                                        </div>
                                    </div>
                                    <canvas id="sales-chart-a" class="mt-auto" height="65"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                        <%--                    <div class="row h-100">
                        <div class="col-md-6 stretch-card grid-margin grid-margin-md-0">
                            <div class="card">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <p class="text-muted">Sales Analytics</p>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <h3 class="mb-">27632</h3>
                                        <h3 class="mb-">78%</h3>
                                    </div>
                                    <canvas id="sales-chart-b" class="mt-auto" height="38"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row h-100">
                                        <div class="col-6 d-flex flex-column justify-content-between">
                                            <p class="text-muted">CPU</p>
                                            <h4>55%</h4>
                                            <canvas id="cpu-chart" class="mt-auto"></canvas>
                                        </div>
                                        <div class="col-6 d-flex flex-column justify-content-between">
                                            <p class="text-muted">Memory</p>
                                            <h4>123,65</h4>
                                            <canvas id="memory-chart" class="mt-auto"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    </div>
                    <%--                        <div class="col-xl-6 grid-margin stretch-card flex-column">
                            <h5 class="mb-2 text-titlecase mb-4">Income statistics</h5>
                            <div class="row h-100">
                                <div class="col-md-12 stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-start flex-wrap">
                                                <div>
                                                    <p class="mb-3">Monthly Increase</p>
                                                    <h3>67842</h3>
                                                </div>
                                                <div id="income-chart-legend" class="d-flex flex-wrap mt-1 mt-md-0"></div>
                                            </div>
                                            <canvas id="income-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                </div>

                <%--            <div class="row">
                <div class="col-xl-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body border-bottom">
                            <div class="d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-2 mb-md-0 text-uppercase font-weight-medium">Overall sales</h6>
                                <div class="dropdown">
                                    <button class="btn bg-white p-0 pb-1 text-muted btn-sm dropdown-toggle" type="button" id="dropdownMenuSizeButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Last 30 days
                                           
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3">
                                        <h6 class="dropdown-header">Settings</h6>
                                        <a class="dropdown-item" href="javascript:;">Action</a>
                                        <a class="dropdown-item" href="javascript:;">Another action</a>
                                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="javascript:;">Separated link</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="sales-chart-c" class="mt-2"></canvas>
                            <div class="d-flex align-items-center justify-content-between border-bottom pb-3 mb-3 mt-4">
                                <div class="d-flex flex-column justify-content-center align-items-center">
                                    <p class="text-muted">Gross Sales</p>
                                    <h5>492</h5>
                                    <div class="d-flex align-items-baseline">
                                        <p class="text-success mb-0">0.5%</p>
                                        <i class="typcn typcn-arrow-up-thick text-success"></i>
                                    </div>
                                </div>
                                <div class="d-flex flex-column justify-content-center align-items-center">
                                    <p class="text-muted">Purchases</p>
                                    <h5>87k</h5>
                                    <div class="d-flex align-items-baseline">
                                        <p class="text-success mb-0">0.8%</p>
                                        <i class="typcn typcn-arrow-up-thick text-success"></i>
                                    </div>
                                </div>
                                <div class="d-flex flex-column justify-content-center align-items-center">
                                    <p class="text-muted">Tax Return</p>
                                    <h5>882</h5>
                                    <div class="d-flex align-items-baseline">
                                        <p class="text-danger mb-0">-04%</p>
                                        <i class="typcn typcn-arrow-down-thick text-danger"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="dropdown">
                                    <button class="btn bg-white p-0 pb-1 pt-1 text-muted btn-sm dropdown-toggle" type="button" id="dropdownMenuSizeButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Last 7 days
                                           
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3">
                                        <h6 class="dropdown-header">Settings</h6>
                                        <a class="dropdown-item" href="javascript:;">Action</a>
                                        <a class="dropdown-item" href="javascript:;">Another action</a>
                                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="javascript:;">Separated link</a>
                                    </div>
                                </div>
                                <p class="mb-0">overview</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4 grid-margin stretch-card">
                    <div class="row">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card newsletter-card bg-gradient-warning">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center justify-content-center h-100">
                                        <h5 class="mb-3 text-white">Newsletter</h5>
                                        <form class="form d-flex flex-column align-items-center justify-content-between w-100">
                                            <div class="form-group mb-2 w-100">
                                                <input type="text" class="form-control" placeholder="email address">
                                            </div>
                                            <button class="btn btn-danger btn-rounded mt-1" type="submit">Subscribe</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 stretch-card">
                            <div class="card profile-card bg-gradient-primary">
                                <div class="card-body">
                                    <div class="row align-items-center h-100">
                                        <div class="col-md-4">
                                            <figure class="avatar mx-auto mb-4 mb-md-0">
                                                <img src="images/faces/face20.jpg" alt="avatar">
                                            </figure>
                                        </div>
                                        <div class="col-md-8">
                                            <h5 class="text-white text-center text-md-left">Phoebe Kennedy</h5>
                                            <p class="text-white text-center text-md-left">kennedy@gmail.com</p>
                                            <div class="d-flex align-items-center justify-content-between info pt-2">
                                                <div>
                                                    <p class="text-white font-weight-bold">Birth date</p>
                                                    <p class="text-white font-weight-bold">Birth city</p>
                                                </div>
                                                <div>
                                                    <p class="text-white">16 Sep 2019</p>
                                                    <p class="text-white">Netherlands</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body border-bottom">
                            <div class="d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-2 mb-md-0 text-uppercase font-weight-medium">Sales statistics</h6>
                                <div class="dropdown">
                                    <button class="btn bg-white p-0 pb-1 text-muted btn-sm dropdown-toggle" type="button" id="dropdownMenuSizeButton4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Last 7 days
                                           
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton4">
                                        <h6 class="dropdown-header">Settings</h6>
                                        <a class="dropdown-item" href="javascript:;">Action</a>
                                        <a class="dropdown-item" href="javascript:;">Another action</a>
                                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="javascript:;">Separated link</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="sales-chart-d" height="320"></canvas>
                        </div>
                    </div>
                </div>
            </div>--%>


                <asp:Label ID="LbStatus" runat="server" Text="目前房間狀態 : "></asp:Label>
                <br />
                <asp:DropDownList ID="DrpStatus" CssClass="col-sm-3 form-control" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Status" DataValueField="Status" OnSelectedIndexChanged="DrpStatus_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PetHotelConnectionString %>" SelectCommand="SELECT DISTINCT [Status] FROM [Rooms]"></asp:SqlDataSource>
                <br />
                <div class="row">
                    <br />
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                            <div>
                                                <p class="mb-2 text-md-center text-lg-left"><%#Eval("RoomType")%></p>
                                                <h2 class="mb-0"><%#Eval("Status")%></h2>
                                            </div>
                                            <i class="typcn typcn-briefcase icon-xl text-secondary"></i>
                                        </div>

                                        <%--<button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                        Edit               
                                        <i class="typcn typcn-edit btn-icon-append"></i>
                                    </button>--%>
                                        <canvas id="expense-chart" height="80"></canvas>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <%--<div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                <div>
                                    <p class="mb-2 text-md-center text-lg-left">Total Budget</p>
                                    <h1 class="mb-0">47,840</h1>
                                </div>
                                <i class="typcn typcn-chart-pie icon-xl text-secondary"></i>
                            </div>
                            <canvas id="budget-chart" height="80"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between justify-content-md-center justify-content-xl-between flex-wrap mb-4">
                                <div>
                                    <p class="mb-2 text-md-center text-lg-left">Total Balance</p>
                                    <h1 class="mb-0">$7,243</h1>
                                </div>
                                <i class="typcn typcn-clipboard icon-xl text-secondary"></i>
                            </div>
                            <canvas id="balance-chart" height="80"></canvas>
                        </div>
                    </div>
                </div>--%>
                <%--</div>--%>

                <%--                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="table-responsive pt-3">
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                            <tr>
                                                <th class="ml-5">ID</th>
                                                <th>Project name</th>
                                                <th>Customer</th>
                                                <th>Deadline</th>
                                                <th>Payouts	</th>
                                                <th>Traffic</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#D1</td>
                                                <td>Consectetur adipisicing elit </td>
                                                <td>Beulah Cummings</td>
                                                <td>03 Jan 2019</td>
                                                <td>$ 5235</td>
                                                <td>1.3K</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                            Edit
                                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                            Delete
                                                            <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#D2</td>
                                                <td>Correlation natural resources silo</td>
                                                <td>Mitchel Dunford</td>
                                                <td>09 Oct 2019</td>
                                                <td>$ 3233</td>
                                                <td>5.4K</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                            Edit
                                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                            Delete
                                                            <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#D3</td>
                                                <td>social capital compassion social</td>
                                                <td>Pei Canaday</td>
                                                <td>18 Jun 2019</td>
                                                <td>$ 4311</td>
                                                <td>2.1K</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                            Edit
                                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                            Delete
                                                            <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#D4</td>
                                                <td>empower communities thought</td>
                                                <td>Gaynell Sharpton</td>
                                                <td>23 Mar 2019</td>
                                                <td>$ 7743</td>
                                                <td>2.7K</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                            Edit
                                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                            Delete
                                                            <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#D5</td>
                                                <td> Targeted effective; mobilize </td>
                                                <td>Audrie Midyett</td>
                                                <td>22 Aug 2019</td>
                                                <td>$ 2455</td>
                                                <td>1.2K</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                            Edit
                                                            <i class="typcn typcn-edit btn-icon-append"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                            Delete
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
                <%--</div>--%>
                <!-- content-wrapper ends -->
            </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script>
        $(function () {
            GetAllComments();
            $("#button1").click(function () {
                var myData = {
                    commentString: $("#textbox1").val()
                };

                $.ajax({
                    type: "POST", //一定要用POST
                    url: "WebService.asmx/AddComment", //檔名/方法
                    data: JSON.stringify(myData), //js Object => Json
                    contentType: "application/json; charset=utf-8", //指定用JOSN
                    dataType: "json",
                    success: function (result) {
                        alert("新增完成");
                        GetAllComments();
                    }
                });
            });

        });

        function GetAllComments() {
            $("#Div1").empty(); //清空標籤

            $.ajax({
                type: "POST",
                url: "WebService.asmx/GetAllComments",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    $(result.d).each(function (index, item) {

                        $("#Div1").append(`
                             <div class="bg-white p-2">
                                <div class="d-flex flex-row user-info">
                                    <img class="rounded-circle" src="imgs/${item.UserName}.png" width="40" />
                                    <div class="d-flex flex-column justify-content-start ml-2">
                                    <span class="d-block font-weight-bold name">${item.UserName}</span>
                                    <span class="date text-black-50">Shared publicly - ${item.PostDateTime}</span></div>
                                </div>
                                <div class="mt-2">
                                    <p class="comment-text">${item.Comments}</p>
                                </div>
                            </div>
                        `);
                    });
                }
            });
        }
    </script>
</asp:Content>
