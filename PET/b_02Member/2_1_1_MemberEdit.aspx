<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">
    string msg;
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtCustomerName.Text.Trim() == "")
        {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: '姓名不得為空白'," +
            "type: 'warning'," +
            "});";
        }
        else
        {

            MemberUtility utility = new MemberUtility();
            V_Members vmember = utility.GetMemberById(int.Parse(Request.QueryString["id"]));

            Member member = new Member()
            {
                CustomerId = vmember.CustomerId,
                CustomerName = txtCustomerName.Text,
                Password = vmember.Password,
                Email = txtEmail.Text,
                Phone = txtPhone.Text,
                Remark = txtRemark.Text
            };
            utility.EditMember(member);
            Response.Redirect("~/b_02Member/2_1_Member.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = int.Parse(Request.QueryString["id"]);
            MemberUtility utility = new MemberUtility();
            V_Members member = utility.GetMemberById(id);
            lblCustomerID.Text = member.CustomerId.ToString();
            txtCustomerName.Text = member.CustomerName;
            txtEmail.Text = member.Email;
            txtPhone.Text = member.Phone;
            txtRemark.Text = member.Remark;
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #member i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    會員管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">ID :
                                <asp:Label ID="lblCustomerID" runat="server" Text=""></asp:Label></h4>
                            <div class="forms-sample">
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtCustomerName" class="col-sm-3 col-form-label">姓名</label>
                                    <asp:TextBox ID="txtCustomerName" CssClass="col-sm-5 col-form-control" runat="server" v-model="member.CustomerName" required></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtEmail" class="col-sm-3 col-form-label">電子郵件</label>
                                    <asp:TextBox ID="txtEmail" CssClass="col-sm-5 col-form-control" runat="server" v-model="member.Email" required></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtPhone" class="col-sm-3 col-form-label">手機</label>
                                    <asp:TextBox ID="txtPhone" CssClass="col-sm-5 col-form-contr" runat="server" v-model="member.Phone"></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-1"></div>
                                    <label for="BodyHolder_txtRemark" class="col-sm-3 col-form-label">備註</label>
                                    <asp:TextBox ID="txtRemark" CssClass="col-sm-5 col-form-contr" runat="server" v-model="member.Remark"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-9"></div>
                                    <div class="col-sm-3">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="Button1_Click" />
                                        <a href="/b_02Member/2_1_Member.aspx" class="btn btn-light">取消</a>

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
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%= msg %>
    </script>
</asp:Content>
