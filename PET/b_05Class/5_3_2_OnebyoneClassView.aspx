<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">


</script>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #class i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    一對一報名管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-1"></div>

                <div class="col-md-10 grid-margin stretch-card">
                    <div class="card" id="app">
                        <div class="card-body">
                            <h4 class="card-title">ID : {{inquiryFormAry.FormNo}}</h4>

                            <div class="form-group row">
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問您的姓名?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問您的姓名?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q1}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問您的生理性別?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問您的生理性別?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q2}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問您的年齡落在那一個區間?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問您的年齡落在那一個區間?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q3}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問您的聯絡電話?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問您的聯絡電話?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q4}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問方便與您電話聯絡的時段?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問方便與您電話聯絡的時段?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q5}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問目前與毛孩住的地址?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問目前與毛孩住的地址?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q6}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問您的Email?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問您的Email?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q7}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問家中有幾隻毛孩?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問家中有幾隻毛孩?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q8}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問毛孩的名字是?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問毛孩的名字是?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q9}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問毛孩的年齡大約是幾歲?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問毛孩的年齡大約是幾歲?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q10}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問毛孩的生日?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問毛孩的生日?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q11}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問毛孩的性別?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問毛孩的性別?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q12}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問毛孩的品種?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問毛孩的品種?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q13}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">毛孩是否已結紮?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">毛孩是否已結紮?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q14}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問結紮多久了?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問結紮多久了?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q15}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">結紮後是否有行為的改變?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">結紮後是否有行為的改變?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q16}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">請問目前與毛孩生活中遇到最困擾的是什麼問題?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">請問目前與毛孩生活中遇到最困擾的是什麼問題?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q17}}</p>
                                </div>
                                <div class="d-block d-sm-none">
                                    <p class="text-primary">承上，問題的嚴重程度是?</p>
                                </div>
                                <div class="col-sm-5 col-md-2 d-none d-sm-block text-right">
                                    <p class="text-primary">承上，問題的嚴重程度是?</p>
                                </div>
                                <div class="col-sm-7 col-md-4">
                                    <p class="text-info">{{inquiryFormAry.Q18}}</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-1"></div>
            </div>

            <%--回列表--%>
            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="/b_05Class/5_3_OnebyoneClassAll.aspx" title="回列表">
                        <i class="typcn typcn-arrow-back  btn-icon-append" style="font-size: 1.5em; padding: 0; margin: 0"></i>
                    </a>
                    <%--  <a href="4_2_1_EmployeeAdd.aspx" style="color: white">+</a>--%>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script>
        $(() => {
            var getUrl = document.URL;
            var url = getUrl.split('=');
            eid = url[1];
            var app = new Vue({
                el: '#app',
                data: {
                    myData: {
                        id: eid
                    },
                    inquiryFormAry: null,
                    jobTitleAry: []
                },
                methods: {
                    GetInquiryForm: function () {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/GetInquiryFormByID",
                            data: JSON.stringify(this.myData), //js Object => Json
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                app.inquiryFormAry = result.d;

                            },
                            error: function (event) {
                                console.log(event.responseText);
                            }
                        });
                    },
                    GetJobTitles: function () {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/GetJobTitles",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                console.log(result);
                                app.jobTitleAry = result.d;
                            },
                            error: function (event) {
                                console.log(event.responseText);
                            }
                        });
                    },
                    SetPermission: function () {
                        $("#BodyHolder_txtPermissionID").val(this.employeeAry.PermissionID);
                    },

                },
                created: function () {
                    this.GetInquiryForm();
                }
            });

        });
    </script>
</asp:Content>
