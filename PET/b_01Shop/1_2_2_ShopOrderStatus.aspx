<%@ Page Title="商城訂單編輯" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = int.Parse(Request.QueryString["OrderNumber"]);

            OrderUtility orderUtility = new OrderUtility();
            MallOrder mallOrder = orderUtility.GetOrder(id);

            lbl_Mem.Text = "1";
            lbl_email.Text = "Beulah Cumming@gmail.com";
            lbl_date.Text = mallOrder.OrderDate;
            lbl_amount.Text = mallOrder.Total.ToString();
            Label4.Text = id.ToString();
            DropDownList1.SelectedItem.Text = mallOrder.OrderStatus;
        }
    }

    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["OrderNumber"]);
        OrderUtility orderUtility = new OrderUtility();

        MallOrder mallOrder = orderUtility.GetOrder(id);
        mallOrder.OrderStatus = DropDownList1.SelectedItem.Text;

        orderUtility.OrderEdit(mallOrder);

        List<MallOrdersDetail> mallOrdersDetail = orderUtility.GetOrderDetail(id);


        foreach (var item in mallOrdersDetail)
        {
            item.OrderStatus = DropDownList1.SelectedItem.Text;
        }
        orderUtility.OrderDetailEdit(mallOrdersDetail);

        Response.Redirect("1_2_ShopOrder.aspx");
    }


    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("1_2_ShopOrder.aspx");

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #shop i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    商城訂單編輯
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 grid-margin stretch-card">
                    <div class="col-md-12  grid-margin">

                        <br />

                        <h5>訂單號碼: #<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h5>
                        <br />
                        <div class="card">
                            <div class="card-body" style="margin-top: 30px;">
                                <div class="forms-sample">

                                    <div class="form-group row">
                                        <div class="col-sm-1 col-form-label"></div>
                                        <label for="exampleInputUsername2" class="col-sm-2 ">訂購人</label>
                                        <div class="col-sm-8 form-group">
                                            <asp:Label ID="lbl_Mem" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-1 col-form-label"></div>
                                        <label for="exampleInputMobile" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-5 form-group">
                                            <asp:Label ID="lbl_email" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-1 col-form-label"></div>
                                        <label for="exampleInputMobile" class="col-sm-2">總金額</label>
                                        <div class="col-sm-8 form-group">
                                            <asp:Label ID="lbl_amount" runat="server" Text="Label"></asp:Label>

                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-1 col-form-label"></div>
                                        <label for="exampleInputMobile" class="col-sm-2">訂購日期</label>
                                        <div class="col-sm-8 form-group">
                                            <asp:Label ID="lbl_date" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>



                                    <div class="form-group row">
                                        <div class="col-sm-1 col-form-label"></div>
                                        <label for="exampleInputMobile" class="col-sm-2">訂單狀態</label>
                                        <div class="col-sm-8 form-group ">
                                            <asp:DropDownList ID="DropDownList1" runat="server" >
                                                <asp:ListItem Value="Build">已建立</asp:ListItem>
                                                <asp:ListItem Value="Prepare">備貨中</asp:ListItem>
                                                <asp:ListItem Value="Shipping">配送中</asp:ListItem>
                                                <asp:ListItem Value="Done">已完成</asp:ListItem>
                                                <asp:ListItem Value="Cancel">已取消</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>



                                    <div class="form-group row">
                                        <div class="col-sm-10"></div>
                                        <div class="col-sm-2">
                                            <asp:LinkButton ID="btn_confirm" runat="server" type="submit" class="btn btn-primary mr-2" OnClick="btn_confirm_Click">確認</asp:LinkButton>
                                            <asp:LinkButton ID="btn_cancel" runat="server" class="btn btn-light" OnClick="btn_cancel_Click">取消</asp:LinkButton>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- content-wrapper ends -->

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server"></asp:Content>
