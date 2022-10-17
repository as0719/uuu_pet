<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["PermissionEdit"] = null;
        }

    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        //Response.Write(hidPermissionID.Value);
        Session["PermissionEdit"] = hidPermissionID.Value;
        Response.Redirect("~/b_04Employee/4_1_1_EmployeeAuthEdit.aspx?pid=" + hidPermissionID.Value);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #employee i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    員工權限管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper" id="empAuth">
            <div claa="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label" for="BodyHolder_DropDownList1">職務: </label>
                        <div class="col-sm-7">
                            <asp:HiddenField ID="hidPermissionID"  runat="server" />
                            <%--<asp:DropDownList ID="DropDownList1" v-model="permissionId" runat="server" class="form-control danger" @change="GetPermission()"></asp:DropDownList>--%>
                                                  <select class="form-control" v-model="p.permissionId"  @change="GetPermission()">
                                <option v-for="item in jobTitleAry" :value="item.PermissionID">{{item.JobTitle}}</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                           <%-- <a href="/b_04Employee/4_1_1_EmployeeAuthEdit.aspx?pid=1" class="btn btn-outline-secondary btn-icon-text">編輯<i class="typcn typcn-document"></i></a>--%>
                            <asp:Button ID="btnEmpAuthEdit" runat="server" Text="編輯" CssClass="btn btn-primary btn-icon-text" OnClick="btnModify_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!--新增職務-->
                <div class="col-sm-12 col-md-6 col-lg-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">新增職務</h4>
                            <div class="form-inline">
                                <label class="text-primary" for="chJobTitleEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chJobTitleEdit" type="checkbox" checked />
                                    <span class="toggle-slider"></span>
                                </label>
                                <label class="text-primary ml-5" for="chJobTitleView">檢視</label>
                                <label class="toggle-switch ">
                                    <input id="chJobTitleView" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--會員管理-->
                <div class="col-sm-12 col-md-6 col-lg-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">會員管理</h4>
                            <div class="form-inline">
                                <label class="text-primary" for="chMemberEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chMemberEdit" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                                <label class="text-primary ml-5" for="chMemberView">檢視</label>
                                <label class="toggle-switch ">
                                    <input id="chMemberView" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--商城管理-->
                <div class="col-sm-12 col-md-6 col-lg-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">商城管理</h4>
                            <div class="form-inline">
                                <label class="text-primary" for="chMallEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chMallEdit" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                                <label class="text-primary ml-5" for="chMallView">檢視</label>
                                <label class="toggle-switch ">
                                    <input id="chMallView" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--住宿管理-->
                <div class="col-sm-12 col-md-6 col-lg-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">住宿管理</h4>
                            <div class="form-inline">
                                <label class="text-primary" for="chHotelEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chHotelEdit" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                                <label class="text-primary ml-5" for="chHotelView">檢視</label>
                                <label class="toggle-switch ">
                                    <input id="chHotelView" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--員工管理-->
                <div class="col-sm-12 col-md-6 col-lg-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">員工管理</h4>
                            <div class="form-inline">
                                <label class="text-primary" for="chEmployeeEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chEmployeeEdit" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                                <label class="text-primary ml-5" for="chEmployeeView">檢視</label>
                                <label class="toggle-switch ">
                                    <input id="chEmployeeView" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--課程管理-->
                <div class="col-sm-12 col-md-6 col-lg-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">課程管理</h4>
                            <div class="form-inline">
                                <label class="text-primary" for="chClassEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chClassEdit" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                                <label class="text-primary ml-5" for="chClassView">檢視</label>
                                <label class="toggle-switch ">
                                    <input id="chClassView" type="checkbox" />
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- hidden field -->


            <%--新增按鈕--%>
            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="4_1_2_EmployeeAuthAdd.aspx" style="color: white">+</a>
                </div>
            </div>
      <%--      <div class="container-fluid page-body-wrapper">
                <div class="theme-setting-wrapper">
                    <div id="settings-trigger">
                        <a href="4_1_2_EmployeeAuthAdd.aspx" style="color: white">+</a>
                    </div>
                </div>
            </div>--%>


        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script>

        var app = new Vue({
            el: '#empAuth',
            data:{
                p: {
                    permissionId:null
                },
                jobTitleAry: [],
                permissionAry: []
            },
            methods: {
                GetPermission: function () {
                    $.ajax({
                        type: "POST",
                        url: "/WebService.asmx/GetPermissionByTitle",
                        data: JSON.stringify(this.p), //js Object => Json
                        contentType: "application/json; charset=utf-8",                        
                        dataType: "json",
                        success: function (result) {
                            console.log(result);
                            app.permissionAry = result.d;
                            app.SetPermissionResult();
                            $("#BodyHolder_hidPermissionID").val(app.p.permissionId);
                        },
                        error: function (event) {
                            console.log(event.responseText);
                        }
                    });
                },
                GetJobTitles: function() {
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
                SetPermissionResult: function () {
                    var p = this.permissionAry;
                    //課程
                    if (p['CourseEdit'] == "block") {
                        $("#chClassEdit").prop("checked", true);
                    }
                    else {
                        $("#chClassEdit").prop("checked", false);
                    }
                    if (p['CourseView'] == "block") {
                        $("#chClassView").prop("checked", true);
                    }
                    else {
                        $("#chClassView").prop("checked", false);
                    }
                    //會員
                    if (p['MemberEdit'] == "block") {
                        $("#chMemberEdit").prop("checked", true);
                    }
                    else {
                        $("#chMemberEdit").prop("checked", false);
                    }
                    if (p['MemberView'] == "block") {
                        $("#chMemberView").prop("checked", true);
                    }
                    else {
                        $("#chMemberView").prop("checked", false);
                    }
                    //購物
                    if (p['MallOrderEdit'] == "block") {
                        $("#chMallEdit").prop("checked", true);
                    }
                    else {
                        $("#chMallEdit").prop("checked", false);
                    }
                    if (p['MallOrderView'] == "block") {
                        $("#chMallView").prop("checked", true);
                    }
                    else {
                        $("#chMallView").prop("checked", false);
                    }
                    //住宿
                    if (p['RoomOrderEdit'] == "block") {
                        $("#chHotelEdit").prop("checked", true);
                    }
                    else {
                        $("#chHotelEdit").prop("checked", false);
                    }
                    if (p['RoomOrderView'] == "block") {
                        $("#chHotelView").prop("checked", true);
                    }
                    else {
                        $("#chHotelView").prop("checked", false);
                    }
                    //新增職務
                    if (p['PermissionEdit'] == "block") {
                        $("#chJobTitleEdit").prop("checked", true);
                    }
                    else {
                        $("#chJobTitleEdit").prop("checked", false);
                    }
                    if (p['PermissionView'] == "block") {
                        $("#chJobTitleView").prop("checked", true);
                    }
                    else {
                        $("#chJobTitleView").prop("checked", false);
                    }
                    //員工
                    if (p['EmployeeEdit'] == "block") {
                        $("#chEmployeeEdit").prop("checked", true);
                    }
                    else {
                        $("#chEmployeeEdit").prop("checked", false);
                    }
                    if (p['EmployeeView'] == "block") {
                        $("#chEmployeeView").prop("checked", true);
                    }
                    else {
                        $("#chEmployeeView").prop("checked", false);
                    }

                    $("[type = checkbox]").prop("disabled",true);


                    
                }
            },
            created: function () {
                this.GetJobTitles();
                this.p.permissionId = 1;
                this.GetPermission();
            }
        });
      
    </script>
</asp:Content>
