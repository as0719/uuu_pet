<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <link href="/b_forBackend/css/jsgrid.min.css" rel="stylesheet" />
    <link href="/b_forBackend/css/jsgrid-theme.min.css" rel="stylesheet" />
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
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                             <div class="alert alert-success  " id="success-alert">
                                <button type="button" class="close" data-dismiss="alert">x</button>
                                <strong>Success!</strong>
                                會員資料-更新成功
                            </div>
                            <div id="externalPager" class="container"></div>
                            <div id="jsGrid">
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="/b_forBackend/jsgrid.min.js"></script>
    <script>
        //http://js-grid.com/demos/
        $(function () {
            $("#jsGrid").jsGrid({
                width: "100%",
                height: "400px",

                autoload: true,

                paging: true,
                pageLoading: true,
                pageSize: 3,

                editing: true,
                sorting: true,
                /* pageIndex: 2,*/
                /* deleteConfirm: "確認刪除此筆資料?",*/
                pagerContainer: "#externalPager",
                pagerFormat: "current page: {pageIndex} &nbsp;&nbsp; {first} {prev} {pages} {next} {last} &nbsp;&nbsp; total pages: {pageCount}",
                pagePrevText: "<",
                pageNextText: ">",
                pageFirstText: "首頁",
                pageLastText: "最後一頁",
                pageNavigatorNextText: "&#8230;",
                pageNavigatorPrevText: "&#8230;",

                fields: [
                    { name: "CustomerName", title: "姓名", type: "text", width: 50 },
                    { name: "Email", type: "text", width: 100, sorting: false },
                    { name: "Phone", title: "手機", type: "text", width: 90, sorting: false },
                    { name: "Remark", title: "備註", type: "text", width: 150, sorting: false },
                    { type: "control", deleteButton: false }
                ],
                controller: {
                    loadData: function (filter) {
                        var myData = null;
                        var itemCount = 0;
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "/WebService.asmx/GetMemberByPage",
                            data: JSON.stringify({
                                pageSize: filter.pageSize,
                                pageIndex: filter.pageIndex
                            }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                myData = data.d._Members;
                                itemCount = data.d.TotalCount;
                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });

                        return {
                            data: myData,
                            itemsCount: itemCount
                        };
                    },
                    insertItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/insertMember",
                            data: JSON.stringify({ vmember: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { alert("OK"); }
                        });
                    },
                    updateItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "/WebService.asmx/updateMember",
                            data: JSON.stringify({ vmember: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                $("#success-alert").show();
                                $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
                                    $("#success-alert").slideUp(500);
                                });
                            }
                        });
                    },

                }
            });
            $("#success-alert").hide();
        });

    </script>
</asp:Content>
