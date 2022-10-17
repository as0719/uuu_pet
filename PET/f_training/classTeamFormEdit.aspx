<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool chk = true;
        //驗證

        foreach (var item in Form.FindControl("BodyHolder").Controls)
        {
            if (item is TextBox)
            {
                if (((TextBox)item).Text == "") chk = false;
            }
            if (item is DropDownList)
            {
                if (((DropDownList)item).SelectedValue == "") chk = false;
            }
        }
        if (chk) {
            CourseUtility courseUtility = new CourseUtility();
            int id = int.Parse(Request.QueryString["id"]);
            InquiryForm source = courseUtility.GetInquiryFormByID(id);
            source.Q1 = txtQ1.Text;
            source.Q2 = ddlQ2.SelectedValue;
            source.Q3 = ddlQ3.SelectedValue;
            source.Q4 = txtQ4.Text;
            source.Q5 = ddlQ5.SelectedValue;
            source.Q6 = txtQ6.Text;
            source.Q7 = txtQ7.Text;
            source.Q8 = txtQ8.Text;
            source.Q9 = txtQ9.Text;
            source.Q10 = txtQ10.Text;
            source.Q11 = txtQ11.Text;
            source.Q12 = txtQ12.Text;
            source.Q13 = txtQ13.Text;
            source.Q14 = txtQ14.Text;
            source.Q15 = txtQ15.Text;
            source.Q16 = txtQ16.Text;
            source.Q17 = txtQ17.Text;
            source.Q18 = txtQ18.Text;
            source.Status = "新增";
          
            courseUtility.EditInquiryForm(source);
            Response.Redirect("~/f_training/classTeamHistoryForm.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("~/f_training/classTeamHistoryForm.aspx");
        }
        else
        {
            if (!Page.IsPostBack)
            {

                int id = int.Parse(Request.QueryString["id"]);
                CourseUtility utility = new CourseUtility();
                InquiryForm inquiryForm = utility.GetInquiryFormByID(id);
                if (inquiryForm == null)
                {
                    Response.Redirect("~/f_training/classTeamHistoryForm.aspx");
                }
                else
                {
                    lblNo.Text = inquiryForm.FormNo.ToString();
                    txtQ1.Text = inquiryForm.Q1;
                    ddlQ2.SelectedValue = inquiryForm.Q2;
                    ddlQ3.SelectedValue = inquiryForm.Q3;
                    txtQ4.Text = inquiryForm.Q4;
                    ddlQ5.Text = inquiryForm.Q5;
                    txtQ6.Text = inquiryForm.Q6;
                    txtQ7.Text = inquiryForm.Q7;
                    txtQ8.Text = inquiryForm.Q8;
                    txtQ9.Text = inquiryForm.Q9;
                    txtQ10.Text = inquiryForm.Q10;
                    txtQ11.Text = inquiryForm.Q11;
                    txtQ12.Text = inquiryForm.Q12;
                    txtQ13.Text = inquiryForm.Q13;
                    txtQ14.Text = inquiryForm.Q14;
                    txtQ15.Text = inquiryForm.Q15;
                    txtQ16.Text = inquiryForm.Q16;
                    txtQ17.Text = inquiryForm.Q17;
                    txtQ18.Text = inquiryForm.Q18;

                }
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">

    <div class="container mt-3 pt-4 pb-4">

        <div class="row">
            <div class="col-md-1"></div>

            <div class="col-md-10 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">ID :<asp:Label ID="lblNo" runat="server" Text=""></asp:Label></h4>

                        <div class="form-group row">
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問您的姓名?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問您的姓名?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ1" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問您的生理性別?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問您的生理性別?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:DropDownList ID="ddlQ2" CssClass=" custom-select" runat="server">
                                    <asp:ListItem Value="男">男</asp:ListItem>
                                    <asp:ListItem Value="女">女</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問您的年齡落在那一個區間?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問您的年齡落在那一個區間?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:DropDownList ID="ddlQ3" CssClass=" custom-select" runat="server">
                                    <asp:ListItem>20~25</asp:ListItem>
                                    <asp:ListItem>26~30</asp:ListItem>
                                    <asp:ListItem>31~35</asp:ListItem>
                                    <asp:ListItem>36~40</asp:ListItem>
                                    <asp:ListItem>41~49</asp:ListItem>
                                    <asp:ListItem>50以上</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問您的聯絡電話?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問您的聯絡電話?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ4" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問方便與您電話聯絡的時段?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問方便與您電話聯絡的時段?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:DropDownList ID="ddlQ5" CssClass=" custom-select" runat="server">
                                    <asp:ListItem>上午時段 10:00~12:00</asp:ListItem>
                                    <asp:ListItem>下午時段 13:00~18:00</asp:ListItem>
                                    <asp:ListItem>晚間時間 18:00~22:00</asp:ListItem>
                                    <asp:ListItem>不指定時間</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問目前與毛孩住的地址?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問目前與毛孩住的地址?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ6" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問您的Email?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問您的Email?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ7" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問家中有幾隻毛孩?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問家中有幾隻毛孩?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ8" CssClass="form-control p-4" placeholder="您的回答" runat="server" TextMode="Number"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問毛孩的名字是?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問毛孩的名字是?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ9" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問毛孩的年齡大約是幾歲?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問毛孩的年齡大約是幾歲?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ10" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問毛孩的生日?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問毛孩的生日?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ11" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問毛孩的性別?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問毛孩的性別?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ12" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問毛孩的品種?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問毛孩的品種?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ13" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">毛孩是否已結紮?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">毛孩是否已結紮?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ14" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問結紮多久了?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問結紮多久了?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ15" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">結紮後是否有行為的改變?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">結紮後是否有行為的改變?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ16" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">請問目前與毛孩生活中遇到最困擾的是什麼問題?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">請問目前與毛孩生活中遇到最困擾的是什麼問題?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ17" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                            <div class="d-block d-sm-none">
                                <p class="text-primary">承上，問題的嚴重程度是?</p>
                            </div>
                            <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                <p class="text-primary">承上，問題的嚴重程度是?</p>
                            </div>
                            <div class="col-sm-7 col-md-4">
                                <asp:TextBox ID="txtQ18" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-1"></div>
        </div>
        <div class="row">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="Button1_Click" />
            <a href="/f_training/classTeamHistoryForm.aspx" class="btn btn-light">放棄</a>
        </div>


    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_training/classTeamFormEdit.aspx']").addClass("active");
            $("a[href='/f_training/classTeamFormEdit.aspx']").parent().prev().addClass("active");


        })
    </script>
</asp:Content>

