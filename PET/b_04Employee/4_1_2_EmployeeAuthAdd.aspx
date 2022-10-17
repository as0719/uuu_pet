<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">
    string msg;
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtJobTitle.Text != "")
        {
            Permission permission = new Permission();
            permission.JobTitle = txtJobTitle.Text;
            permission.RoomOrderEdit = hHotelEdit.Value == "true" ? "block" : "none";
            permission.RoomOrderView = hHotelView.Value == "true" ? "block" : "none";
            permission.MallOrderEdit = hMallEdit.Value == "true" ? "block" : "none";
            permission.MallOrderView = hMallView.Value == "true" ? "block" : "none";
            permission.CourseEdit = hClassEdit.Value == "true" ? "block" : "none";
            permission.CourseView = hClassView.Value == "true" ? "block" : "none";
            permission.MemberEdit = hMemberEdit.Value == "true" ? "block" : "none";
            permission.MemberView = hMemberView.Value == "true" ? "block" : "none";
            permission.PermissionEdit = hJobTitleEdit.Value == "true" ? "block" : "none";
            permission.PermissionView = hJobTitleView.Value == "true" ? "block" : "none";
            permission.EmployeeEdit = hEmployeeEdit.Value == "true" ? "block" : "none";
            permission.EmployeeView = hEmployeeView.Value == "true" ? "block" : "none";            

            EmployeeUtility utility = new EmployeeUtility();
            utility.AddPermission(permission);
            Response.Redirect("~/b_04Employee/4_1_EmployeeAuth.aspx");
        }
        else
        {
            msg = "swal({ " +
            "title: '訊息', " +
            "text: '請填寫職務名稱'," +
            "type: 'warning'," +
            "});";
        }
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
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-md-3  col-form-label" for="BodyHolder_txtJobTitle">職務: </label>
                        <div class="col-sm-8 col-md-9">
                            <asp:TextBox ID="txtJobTitle" CssClass="form-control" runat="server" placeholder="職務名稱"></asp:TextBox>
                            <%--     <input type="text" class="form-control" id="exampleInputUsername2">--%>
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
                            <div class="form-inlisne">
                                <label class="text-primary" for="chJobTitleEdit">編輯</label>
                                <label class="toggle-switch  mr-2">
                                    <input id="chJobTitleEdit" type="checkbox" />
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
            <!--新增職務-->
            <asp:HiddenField ID="hJobTitleEdit" runat="server" />
            <asp:HiddenField ID="hJobTitleView" runat="server" />
            <!--會員管理-->
            <asp:HiddenField ID="hMemberEdit" runat="server" />
            <asp:HiddenField ID="hMemberView" runat="server" />
            <!--住宿管理-->
            <asp:HiddenField ID="hHotelEdit" runat="server" />
            <asp:HiddenField ID="hHotelView" runat="server" />
            <!--員工管理-->
            <asp:HiddenField ID="hEmployeeEdit" runat="server" />
            <asp:HiddenField ID="hEmployeeView" runat="server" />
            <!--課程管理-->
            <asp:HiddenField ID="hClassEdit" runat="server" />
            <asp:HiddenField ID="hClassView" runat="server" />
            <!--商城管理-->
            <asp:HiddenField ID="hMallEdit" runat="server" />
            <asp:HiddenField ID="hMallView" runat="server" />
            <!-- hidden field -->
            <div class="row">
                <div class="col-sm-10"></div>
                <div class="col-sm-2">
                    <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary mr-2" Text="確認" OnClick="btnSend_Click" />     
                    <a href="/b_04Employee/4_1_EmployeeAuth.aspx" class="btn btn-light">取消</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <!-- alert -->
    <link href="/b_forBackend/css/sweetalert2.css" rel="stylesheet" />
    <script src="/b_forBackend/js/sweetalert2.js"></script>
    <!-- alert -->
    <script>
        <%= msg %>
        $(function () {
            $("[type = checkbox]").change(changeHandler);

        });
        function changeHandler() {
            chid = "#" + this.id;
            hidName = "#BodyHolder_" + this.id.replace('ch', 'h');
            $(hidName).val($(chid).prop("checked"));
            //alert($(hidName).val());
            //alert($(chid).prop("checked"));
        }


    </script>
</asp:Content>
