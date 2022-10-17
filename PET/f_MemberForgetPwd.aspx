<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    string msg;
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtName.Text != "" && txtEmail.Text != "")
        {
            MemberUtility utility = new MemberUtility();
            Member member= utility.CheckMemberNameMail(txtName.Text, txtEmail.Text);
            if (member == null)
            {
                msg = "swal({ " +
          "title: '訊息', " +
          "text: '請確認帳號與電子信箱'," +
          "type: 'warning'," +
          "});";
            }
            else {
                //todo command sendpwdmail     
                //取得密碼

                //更新資料庫

                //寄信
                Comman.SendCustPwdMail(member);
                Response.Redirect("~/f_Index.aspx");
            }
        }
        else {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: '請填寫帳號與電子信箱'," +
            "type: 'warning'," +
            "});";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>PetLover</title>
    <!-- Favicon -->
    <link href="/f_img/favicon.png" rel="icon" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/f_css/style.css" rel="stylesheet" />

    <!--Login Css https://codepen.io/Rh2o/pen/yLgxJoG -->
    <link href="/f_css/Login.css" rel="stylesheet" />
</head>
<body>

    <div class="container" id="container">
        <div class="form-container sign-in-container">

            <form id="form1" runat="server">

                <h1>忘記密碼</h1>
                <span>申請變更密碼</span>
                <asp:TextBox ID="txtName" runat="server" placeholder="帳號" required></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email" required></asp:TextBox>

                <asp:Button ID="Button1" runat="server" CssClass="ghost bg-primary" Text="送出" OnClick="Button1_Click"/>   
                <input type="button" class="ghost bg-primary" value="demo" onclick="setDemo()" />
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right bg-primary">
                    <h1>Hello, Friend!</h1>
                    <%--<p>申請加入會員</p>
                    <input type="button" class="ghost bg-primary" value="加入會員" onclick="window.location.href='/f_register.html'" />--%>
                </div>
            </div>
        </div>
    </div>
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>
        <%= msg %>
        function setDemo() {
            document.getElementById("txtName").value = "林筱雯";
            document.getElementById("txtEmail").value = "mary@uuu.com";
        }
    </script>

</body>
</html>
