<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">
            string msg = "";
            protected void btnSend_Click(object sender, EventArgs e)
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

                if (chk)
                {
                    CourseUtility courseUtility = new CourseUtility();
                    InquiryForm inquiryForm = new InquiryForm()
                    {
                        Q1 = txtQ1.Text,
                        Q2 = ddlQ2.SelectedValue,
                        Q3 = ddlQ3.SelectedValue,
                        Q4 = txtQ4.Text,
                        Q5 = ddlQ5.SelectedValue,
                        Q6 = txtQ6.Text,
                        Q7 = txtQ7.Text,
                        Q8 = txtQ8.Text,
                        Q9 = txtQ9.Text,
                        Q10 = txtQ10.Text,
                        Q11 = txtQ11.Text,
                        Q12 = txtQ12.Text,
                        Q13 = txtQ13.Text,
                        Q14 = txtQ14.Text,
                        Q15 = txtQ15.Text,
                        Q16 = txtQ16.Text,
                        Q17 = txtQ17.Text,
                        Q18 = txtQ18.Text,
                        Status = "新增",
                        QDate = DateTime.Now.ToString("yyyy/MM/dd"),
                        QTime = DateTime.Now.ToString("HH:mm")

                };
                courseUtility.AddInquiryForm(inquiryForm);
                Response.Redirect("~/f_training/classprivate.aspx");
            }
        else
        {
            msg = "swal({ " +
          "title: '訊息', " +
          "text: '請確認填寫資訊'," +
          "type: 'warning'," +
          "});";
        }
    }

    protected void btnSetDemo_Click(object sender, EventArgs e)
    {
        txtQ1.Text = "曾國成";
        txtQ4.Text = "0965565418";
        txtQ6.Text = "台北市大同區迪化街一段171號";
        txtQ7.Text = "pami@pami.com";
        txtQ8.Text = "3";
        txtQ9.Text = "Lucy";
        txtQ10.Text = "3Y";
        txtQ11.Text = "2019/08/04";
        txtQ12.Text = "公";
        txtQ13.Text = "混種";
        txtQ14.Text = "是";
        txtQ15.Text = "1年";
        txtQ16.Text = "短期時有情緒不穩的傾向，後來就沒事了";
        txtQ17.Text = "愈來愈大爺感";
        txtQ18.Text = "主人受不了";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <link href="../b_forBackend/themes/blitzer/jquery-ui.min.css" rel="stylesheet" />
    <link href="../b_forBackend/themes/blitzer/jquery.ui.theme.css" rel="stylesheet" />
    <style>
        #form {
            text-align: center;
            position: relative;
            margin-top: 20px
        }

            #form fieldset {
                background: white;
                border: 0 none;
                border-radius: 0.5rem;
                box-sizing: border-box;
                width: 100%;
                margin: 0;
                padding-bottom: 20px;
                position: relative
            }

        .finish {
            text-align: center
        }

        #form fieldset:not(:first-of-type) {
            display: none
        }

        #form .pre-step {
            width: 100px;
            font-weight: bold;
            color: white;
            border: 0 none;
            border-radius: 10px;
            cursor: pointer;
            padding: 10px 5px;
            margin: 10px 5px 10px 0px;
            float: right
        }

        .next-step {
            width: 100px;
            font-weight: bold;
            color: white;
            border: 0 none;
            border-radius: 10px;
            cursor: pointer;
            padding: 10px 5px;
            margin: 10px 5px 10px 0px;
            float: right
        }

        .form, .pre-step {
            background: #616161;
        }

        .form, .next-step {
            background: red;
        }

        #form .pre-step:hover {
            background-color: #000000
        }

        #form .pre-step:focus {
            background-color: #000000
        }

        #form .next-step:hover {
            background-color: #2F8D46
        }

        #form .next-step:focus {
            background-color: #2F8D46
        }

        .text {
            color: red;
            font-weight: normal
        }

        #progressbar {
            margin-bottom: 30px;
            overflow: hidden;
            color: lightgrey
        }

            #progressbar .active {
                color: #2F8D46
            }

            #progressbar li {
                list-style-type: none;
                font-size: 15px;
                width: 20%;
                float: left;
                position: relative;
                font-weight: 400
            }

            #progressbar #step1:before {
                content: "1"
            }

            #progressbar #step2:before {
                content: "2"
            }

            #progressbar #step3:before {
                content: "3"
            }

            #progressbar #step4:before {
                content: "4"
            }

            #progressbar #step5:before {
                content: "5"
            }

            #progressbar li:before {
                width: 50px;
                height: 50px;
                line-height: 45px;
                display: block;
                font-size: 20px;
                color: #ffffff;
                background: lightgray;
                border-radius: 50%;
                margin: 0 auto 10px auto;
                padding: 2px
            }

            #progressbar li:after {
                content: '';
                width: 100%;
                height: 2px;
                background: lightgray;
                position: absolute;
                left: 0;
                top: 25px;
                z-index: -1
            }

            #progressbar li.active:before {
                background: #2F8D46
            }

            #progressbar li.active:after {
                background: #2F8D46
            }

            #progressbar li.active:after {
                background: #2F8D46
            }

        h2 {
            text-transform: uppercase;
            font-weight: normal;
            text-align: center;
            margin: 10px;
            padding: 10px;
            color: red;
        }

        .progress {
            height: 20px
        }

        .pbar {
            background-color: #2F8D46
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">

    <div class="container mt-3 pt-4 pb-4">

        <div class="col-12 bg-light">
            <h5 class="text-danger">完成後訓練師會依照填寫內容去電詢問，感謝您耐心的填寫</h5>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 text-center p-0 mt-3 mb-2">
                <div id="form" style="width: 100%">
                    <ul id="progressbar">
                        <li class="active" id="step1">
                            <strong>基本資料 </strong>
                        </li>
                        <li id="step2"><strong>聯絡資料 </strong></li>
                        <li id="step3"><strong>寵物相關 </strong></li>
                        <li id="step4"><strong>相處問題</strong></li>
                        <li id="step5"><strong>完成</strong></li>
                    </ul>
                    <div class="progress">
                        <div class="pbar"></div>
                    </div>
                    <br>
                    <fieldset>
                        <h2>基本資料</h2>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ1" class="col-form-label text-primary text-left">請問您的姓名?</label>
                            <asp:TextBox ID="txtQ1" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_ddlQ2" class="col-form-label text-primary">請問您的生理性別?</label>
                            <asp:DropDownList ID="ddlQ2" CssClass=" custom-select" runat="server">
                                <asp:ListItem Value="男">男</asp:ListItem>
                                <asp:ListItem Value="女">女</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_ddlQ3" class="col-form-label text-primary">請問您的年齡落在那一個區間?</label>
                            <asp:DropDownList ID="ddlQ3" CssClass=" custom-select" runat="server">
                                <asp:ListItem>20~25</asp:ListItem>
                                <asp:ListItem>26~30</asp:ListItem>
                                <asp:ListItem>31~35</asp:ListItem>
                                <asp:ListItem>36~40</asp:ListItem>
                                <asp:ListItem>41~49</asp:ListItem>
                                <asp:ListItem>50以上</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <input type="button" name="next-step" class="next-step" value="下一步" />
                        <asp:Button ID="btnSetDemo" runat="server" Text="demo" CssClass="btn btn-secondary" OnClick="btnSetDemo_Click" />
                    </fieldset>
                    <fieldset>
                        <h2>聯絡資料 </h2>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ4" class="col-form-label text-primary text-left">請問您的聯絡電話?</label>
                            <asp:TextBox ID="txtQ4" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ5" class="col-form-label text-primary text-left">請問方便與您電話聯絡的時段?</label>
                            <asp:DropDownList ID="ddlQ5" CssClass=" custom-select" runat="server">
                                <asp:ListItem>上午時段 10:00~12:00</asp:ListItem>
                                <asp:ListItem>下午時段 13:00~18:00</asp:ListItem>
                                <asp:ListItem>晚間時間 18:00~22:00</asp:ListItem>
                                <asp:ListItem>不指定時間</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ6" class="col-form-label text-primary text-left">請問目前與毛孩住的地址?</label>
                            <asp:TextBox ID="txtQ6" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ7" class="col-form-label text-primary text-left">請問您的Email?</label>
                            <asp:TextBox ID="txtQ7" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>

                        <input type="button" name="next-step" class="next-step" value="下一步" />
                        <input type="button" name="pre-step" class="pre-step"
                            value="上一步" />
                    </fieldset>
                    <fieldset>
                        <h2>寵物相關 </h2>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ8" class="col-form-label text-primary text-left">請問家中有幾隻毛孩?</label>
                            <asp:TextBox ID="txtQ8" CssClass="form-control p-4" placeholder="您的回答" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ9" class="col-form-label text-primary text-left">請問毛孩的名字是?</label>
                            <asp:TextBox ID="txtQ9" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ10" class="col-form-label text-primary text-left">請問毛孩的年齡大約是幾歲?</label>
                            <asp:TextBox ID="txtQ10" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ11" class="col-form-label text-primary text-left">請問毛孩的生日?</label>
                            <asp:TextBox ID="txtQ11" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ12" class="col-form-label text-primary text-left">請問毛孩的性別?</label>
                            <asp:TextBox ID="txtQ12" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ13" class="col-form-label text-primary text-left">請問毛孩的品種?</label>
                            <asp:TextBox ID="txtQ13" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ14" class="col-form-label text-primary text-left">毛孩是否已結紮?</label>
                            <asp:TextBox ID="txtQ14" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ15" class="col-form-label text-primary text-left">請問結紮多久了?</label>
                            <asp:TextBox ID="txtQ15" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>

                        <input type="button" name="next-step" class="next-step" value="下一步" />
                        <input type="button" name="pre-step" class="pre-step" value="上一步" />
                    </fieldset>
                    <fieldset>
                        <h2>相處問題</h2>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ16" class="col-form-label text-primary text-left">結紮後是否有行為的改變?</label>
                            <asp:TextBox ID="txtQ16" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ17" class="col-form-label text-primary text-left">請問目前與毛孩生活中遇到最困擾的是什麼問題?</label>
                            <asp:TextBox ID="txtQ17" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="BodyHolder_txtQ18" class="col-form-label text-primary text-left">承上，問題的嚴重程度是?</label>
                            <asp:TextBox ID="txtQ18" CssClass="form-control p-4" placeholder="您的回答" runat="server"></asp:TextBox>
                        </div>


                        <input type="button" name="next-step" class="next-step" value="即將完成" />
                        <input type="button" name="pre-step" class="pre-step"
                            value="上一步" />
                    </fieldset>
                    <fieldset>
                        <div class="finish">
                            <h4 class="text text-center">PetLover會依照毛孩的天性、毛孩及主人的生活狀況，在進行電話諮詢後由訓練師們進行評估分析。<br />
                                在上課前了解您與毛孩的狀況，設計專屬於您與毛孩的課程與內容。
                                    <br />
                                <br />
                                <br />
                                <asp:Button ID="btnSend" runat="server" Text="完成送出" CssClass="btn btn-primary sumbit" OnClick="btnSend_Click" />
                            </h4>
                        </div>
                        <input type="button" name="pre-step"
                            class="pre-step"
                            value="上一步" />
                    </fieldset>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <script>

        <%=msg %>
        $(function () {
            $("#navbarCollapse div").children("a").removeClass("active");
            $("a[href='/f_training/classprivate.aspx']").addClass("active");
            $("a[href='/f_training/classprivate.aspx']").parent().prev().addClass("active");

            $("#BodyHolder_txtQ11").datepicker({
                dateFormat: "yy/mm/dd",
                changeYear: true,
                changeMonth: true,
            });

            var currentGfgStep, nextGfgStep, preGfgStep;
            var opacity;
            var current = 1;
            var steps = $("fieldset").length;
            setProgressBar(current);
            $(".next-step").click(function () {
                currentGfgStep = $(this).parent();
                nextGfgStep = $(this).parent().next();
                $("#progressbar li").eq($("fieldset")
                    .index(nextGfgStep)).addClass("active");
                nextGfgStep.show();
                currentGfgStep.animate({ opacity: 0 }, {
                    step: function (now) {
                        opacity = 1 - now;
                        currentGfgStep.css({
                            'display': 'none',
                            'position': 'relative'
                        });
                        nextGfgStep.css({ 'opacity': opacity });
                    },
                    duration: 500
                });
                setProgressBar(++current);
            });
            $(".pre-step").click(function () {
                currentGfgStep = $(this).parent();
                preGfgStep = $(this).parent().prev();
                $("#progressbar li").eq($("fieldset")
                    .index(currentGfgStep)).removeClass("active");
                preGfgStep.show();
                currentGfgStep.animate({ opacity: 0 }, {
                    step: function (now) {
                        opacity = 1 - now;
                        currentGfgStep.css({
                            'display': 'none',
                            'position': 'relative'
                        });
                        preGfgStep.css({ 'opacity': opacity });
                    },
                    duration: 500
                });
                setProgressBar(--current);
            });
            function setProgressBar(currentStep) {
                var percent = parseFloat(100 / steps) * current;
                percentpercent = percent.toFixed();
                $(".pbar")
                    .css("width", percent + "%")
            }


        })

    </script>
</asp:Content>

