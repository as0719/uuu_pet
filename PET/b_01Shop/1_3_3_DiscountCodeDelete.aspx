<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            int id = int.Parse(Request.QueryString["id"]);
            string DiscountCode = Request.QueryString["DiscountCode"];

            DiscountUtility discountUtility = new DiscountUtility();
            MallDiscountCode discountCode = discountUtility.GetDiscountCode(id, DiscountCode);

            Label1.Text = discountCode.DiscountCode;
            Label2.Text = discountCode.NumberOfDiscounts.ToString();
            Label3.Text = discountCode.StartDate.ToString();
            Label4.Text = discountCode.EndDate.ToString();
        }

    }

    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        DiscountUtility discountUtility = new DiscountUtility();
        int id = int.Parse(Request.QueryString["id"]);

        discountUtility.DiscountDelete(id);

        Response.Redirect("1_3_DiscountCode.aspx");
    }


    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("1_3_DiscountCode.aspx");
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
    商品新增
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body" style="margin-top: 30px;">
                            <%--<h4 class="card-title">折扣碼ID: #02</h4>--%>
                            <div class="forms-sample">

                                <div class="form-group row">
                                    <div class="col-sm-1  col-form-label"></div>
                                    <label for="exampleInputUsername" class="col-sm-2">折扣碼</label>
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1 col-form-label"></div>
                                    <label for="exampleInputMobile" class="col-sm-2">折數</label>
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-1 col-form-label"></div>
                                    <label for="exampleInputMobile" class="col-sm-2">開始日期</label>
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1 col-form-label"></div>
                                    <label for="exampleInputMobile" class="col-sm-2">結束日期</label>
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-10"></div>
                                    <div class="col-sm-2">

                                        <asp:LinkButton ID="btn_confirm" runat="server" type="submit" class="btn btn-danger mr-2" OnClick="btn_confirm_Click">刪除</asp:LinkButton>
                                        <asp:LinkButton ID="btn_cancel" runat="server" class="btn btn-light" OnClick="btn_cancel_Click">取消</asp:LinkButton>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-1"></div>
            </div>

        </div>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="../b_forBackend/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>

        $(function () {
            $("#BodyHolder_datepicker_from").datepicker(
                {
                    dateFormat: 'yymmdd',
                    regional: ['zh-TW'],
                    dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                    dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    prevText: "上月",
                    nextText: "次月",
                    weekHeader: "週"
                }
            );
            $("#BodyHolder_datepicker_to").datepicker(
                {
                    dateFormat: 'yymmdd',
                    regional: ['zh-TW'],
                    dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
                    dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
                    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    prevText: "上月",
                    nextText: "次月",
                    weekHeader: "週"
                }
            );

        });
    </script>


</asp:Content>
