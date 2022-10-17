<%@ Page Title="歷史訂單" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">



    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            if (Session["loginUser"] != null)
            {

                Member member = Session["loginUser"] as Member;

                PageUtility pageUtility = new PageUtility();
                pageUtility.BindRepeater($"select a.* from MallOrders as a " +
                    $"left join Members as b " +
                    $"on a.CustomerId = b.CustomerId " +
                    $"where a.CustomerId = {member.CustomerId}" +
                    $"order by a.OrderNumber Desc;", 
                    rpt_all, rpt_page, 0, 10);

            }

        }
    }


    protected void rpt_page_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (Session["loginUser"] != null)
        {
            Member member = Session["loginUser"] as Member;
            PageUtility pageUtility = new PageUtility();


            int PageNum = Convert.ToInt32(e.CommandArgument) - 1;
            pageUtility.BindRepeater($"select a.* from MallOrders as a " +
                        $"left join Members as b " +
                        $"on a.CustomerId = b.CustomerId " +
                        $"where a.CustomerId = {member.CustomerId}" +
                        $"order by a.OrderNumber Desc;", 
                        rpt_all, rpt_page, PageNum, 10);
        }

    }



</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" runat="Server">
    <style>
        .card-img,
        .card-img-top,
        .card-img-bottom {
            height: 100%
        }

        body {
            font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        /*.list-group-item {
            border: 0px;
        }*/
    </style>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="container mt-3 pt-4 pb-4">

        <br />
        <%--        <div class="row">--%>
        <h3 class="text-center">
            <strong>歷史訂單</strong>
        </h3>


        <div id="divConfirm"></div>

        <br />
        <%--<div class="container pt-5">--%>
        <%--<div class="container-fluid">--%>
        <div class="row">


            <%--px-xl-5--%>
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 200px;">訂單編號</th>
                            <th style="width: 200px;">訂單日期</th>
                            <th style="width: 200px;">訂單狀態</th>
                            <th style="width: 150px;">總金額</th>
                            <th style="width: 150px;">檢視</th>
                            <th style="width: 150px;">取消</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <asp:Repeater ID="rpt_all" runat="server">

                            <ItemTemplate>

                                <tr data-toggle="collapse">
                                    <td class="align-middle"><%# Eval("OrderNumber") %></td>
                                    <td class="align-middle"><%# Eval("OrderDate") %></td>
                                    <td class="align-middle">
                                        <div class="badge" data-id='<%# Eval("OrderNumber") %>'>
                                            <%# Eval("OrderStatus") %>
                                        </div>
                                    </td>
                                    <td class="align-middle">$<%# Eval("Total") %></td>
                                    <td class="align-middle">
                                        <%--<asp:Button ID="Button1" runat="server" Text="訂單細項" class="btn btn-primary"/>--%><%--<asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-primary" NavigateUrl='~/f_shop/HistoryOrdersDetail.aspx?OrderNumber=<%# Eval("OrderNumber") %>'>訂單細項</asp:HyperLink>--%>
                                        <a class="btn btn-primary" href="HistoryOrdersDetail.aspx?OrderNumber=<%# Eval("OrderNumber") %>">檢視訂單
                                        </a>
                                    </td>
                                    <td class="align-middle">
                                        <a class="btn btn-warning" id='o<%# Eval("OrderNumber") %>' href="HistoryOrdersDetailCancel.aspx?OrderNumber=<%# Eval("OrderNumber") %>">取消訂單
                                        </a></td>
                                </tr>


                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>



            </div>

            <div class="col-md-12  text-center">
                <div class="btn-group">
                    <asp:Repeater ID="rpt_page" runat="server" OnItemCommand="rpt_page_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnPage" class="btn btn-primary"
                                CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                runat="server" ForeColor="White" Font-Bold="True">
                                    <%# Container.DataItem %>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>



    </div>

    <!-- Cart End -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" runat="Server">
    <script>


        $(function () {
            $(".badge").each(function () {
                /*   $(this).html();*/
                if ($(this).html().trim() == "已完成") {
                    $(this).addClass("badge-primary")
                    $('#o' + $(this).data('id')).css('display', 'none')
                }
                if ($(this).html().trim() == "配送中") {
                    $(this).addClass("badge-secondary")
                    $('#o' + $(this).data('id')).css('display', 'none')

                }
                if ($(this).html().trim() == "已建立") {
                    $(this).addClass("badge-info")

                }
                if ($(this).html().trim() == "備貨中") {
                    $(this).addClass("badge-dark")
                    $('#o' + $(this).data('id')).css('display', 'none')

                }
                if ($(this).html().trim() == "已取消") {
                    $(this).addClass("badge-warning")
                    $('#o' + $(this).data('id')).css('display', 'none')

                }
            })
        })


        //$(function () {
        //    $(".badge").each(function () {
        //        if ($(this).html() == "已建立") {
        //            $(this).parent().next().next().children().html("檢視/取消訂單")
        //        } else {
        //            $(this).parent().next().next().children().text("檢視訂單")
        //        }
        //    })
        //})

    </script>



    <script>
        function showConfirmRequest(callBackFunction, title, content) {
            $("#divConfirm").html(content).dialog({
                autoOpen: true,
                modal: true,
                title: title,
                draggable: true,
                resizable: false,
                close: function (event, ui) { $(this).dialog("destroy"); },
                buttons: {
                    'Ok': function () { callBackFunction(); },
                    'Cancel': function () {
                        $(this).dialog("destroy");
                    }
                },
                overlay: {
                    opacity: 0.45,
                    background: "black"
                }
            });
        }
    </script>


</asp:Content>

