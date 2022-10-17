<%@ Page Title="折扣管理" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.ComponentModel" %>

<script runat="server">

    public DataTable ConvertToDataTable<T>(IList<T> data)
    {
        PropertyDescriptorCollection properties =
           TypeDescriptor.GetProperties(typeof(T));
        DataTable table = new DataTable();
        foreach (PropertyDescriptor prop in properties)
            table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
        foreach (T item in data)
        {
            DataRow row = table.NewRow();
            foreach (PropertyDescriptor prop in properties)
                row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
            table.Rows.Add(row);
        }
        return table;

    }

    public void BindRepeater2(Repeater rpt1, Repeater rpt2, int PageNum, int pageSize, string df_search, string df_status)
    {

        DiscountUtility discountUtility = new DiscountUtility();
        DataTable dt = new DataTable();

        //搜尋框
        if (string.IsNullOrEmpty(df_search))
        {
            //df_search = TextBox1.Text;
            List<MallDiscountCode> mallDiscountCodes = discountUtility.GetAllDiscounts();
            dt = ConvertToDataTable(mallDiscountCodes);
        }
        else
        {
            List<MallDiscountCode> mallDiscounts_search = discountUtility.GetAllDiscounts().Where(s => s.DiscountCode == df_search).ToList();
            dt = ConvertToDataTable(mallDiscounts_search);

        }

        //下拉選單
        if (df_status == "請選擇")
        {
            List<MallDiscountCode> mallDiscountCodes = discountUtility.GetAllDiscounts();

            dt = ConvertToDataTable(mallDiscountCodes);
        }
        else if (df_status == "待生效")
        {
            List<MallDiscountCode> mallDiscounts_drpdown = discountUtility.GetAllDiscounts().Where(s => s.Status == df_status).ToList();
            dt = ConvertToDataTable(mallDiscounts_drpdown);
        }
        else if (df_status == "已過期")
        {
            List<MallDiscountCode> mallDiscounts_drpdown = discountUtility.GetAllDiscounts().Where(s => s.Status == df_status).ToList();
            dt = ConvertToDataTable(mallDiscounts_drpdown);
        }
        else if (df_status == "使用中")
        {
            List<MallDiscountCode> mallDiscounts_drpdown = discountUtility.GetAllDiscounts().Where(s => s.Status == df_status).ToList();
            dt = ConvertToDataTable(mallDiscounts_drpdown);
        }

        //DataTable dt = ConvertToDataTable(mallDiscountCodes);



        PagedDataSource pgitems = new PagedDataSource();
        DataView dv = new DataView(dt);
        //pdsData.DataSource = dv;
        //pdsData.AllowPaging = true;

        pgitems.DataSource = dv;
        pgitems.AllowPaging = true;
        pgitems.PageSize = pageSize;
        pgitems.CurrentPageIndex = PageNum;

        if (pgitems.PageCount > 1)
        {
            rpt2.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rpt2.DataSource = pages;
            rpt2.DataBind();
        }
        else
        {
            rpt2.Visible = false;
        }

        //Finally, set the datasource of the repeater
        rpt1.DataSource = pgitems;
        rpt1.DataBind();

    }







    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            BindRepeater2(rpt_all, rpt_page, 0, 5, null, null);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //OrderUtility orderUtility = new OrderUtility();

        if (String.IsNullOrEmpty(TextBox1.Text))
        {

            BindRepeater2(rpt_all, rpt_page, 0, 5, null, null);
        }
        else
        {
            //string search = TextBox1.Text;

            BindRepeater2(rpt_all, rpt_page, 0, 5, TextBox1.Text, null);

        }

    }

    protected void rpt_page_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        int PageNum = Convert.ToInt32(e.CommandArgument) - 1;
        BindRepeater2(rpt_all, rpt_page, PageNum, 5, TextBox1.Text, DropDownList1.Text);
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "請選擇")
        {
            BindRepeater2(rpt_all, rpt_page, 0, 5, null, DropDownList1.SelectedItem.Text);
        }
        else if (DropDownList1.SelectedItem.Text == "使用中")
        {
            BindRepeater2(rpt_all, rpt_page, 0, 5, null, DropDownList1.SelectedItem.Text);
        }
        else if (DropDownList1.SelectedItem.Text == "待生效")
        {
            BindRepeater2(rpt_all, rpt_page, 0, 5, null, DropDownList1.SelectedItem.Text);
        }
        else if (DropDownList1.SelectedItem.Text == "已過期")
        {
            BindRepeater2(rpt_all, rpt_page, 0, 5, null, DropDownList1.SelectedItem.Text);
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <style>
        #shop i.menu-arrow:before {
            content: "\e0bd";
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    折扣管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">


                <div class="col-md-12 stretch-card">
                    <div class="card-body">


                        <div class="form-group">
                            <div class="input-group">
                                <label class="col-form-label">折扣碼: </label>
                                &nbsp&nbsp&nbsp
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control col-3" placeholder="折扣碼"></asp:TextBox>
                                
                                <div class="col-sm-3">
                                <div class="form-group">
                                    <asp:Button ID="Button2" runat="server" Text="搜尋" class="btn btn-primary" OnClick="Button2_Click" />
                                    <%--&nbsp&nbsp&nbsp<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="1_3_4_DiscountCodeHistory.aspx">已過期折扣碼</asp:HyperLink>--%>
                                </div>
                                    </div>
                            </div>
                            <div class="input-group">
                                <label class="col-form-label">折扣碼狀態: </label>
                                &nbsp&nbsp&nbsp
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control col-3" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem>請選擇</asp:ListItem>
                                    <asp:ListItem>使用中</asp:ListItem>
                                    <asp:ListItem>待生效</asp:ListItem>
                                    <asp:ListItem>已過期</asp:ListItem>
                                </asp:DropDownList>
                            </div>


                        </div>
                    </div>
                </div>



                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-2">


                            <asp:Repeater ID="rpt_all" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-striped project-orders-table">
                                        <thead>
                                            <tr>
                                                <%--<th class="col-1">編號</th>--%>
                                                <%--<th class="text-center"></th>--%>
                                                <th class="text-center"><strong>折扣碼</strong></th>
                                                <th class="text-center"><strong>折數</strong></th>
                                                <th class="text-center"><strong>開始日期</strong></th>
                                                <th class="text-center"><strong>結束日期</strong></th>
                                                <th class="text-center"><strong>目前狀態</strong></th>
                                                <th class="text-center mallEditPermission"><strong>編輯</strong></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <%--<td><%#Eval("No") %></td>--%>
                                        <%--<td class="text-center"></td>--%>
                                        <td class="text-center"><strong><%#Eval("DiscountCode") %></strong></td>
                                        <td class="text-center"><%#Eval("NumberOfDiscounts") %> </td>
                                        <td class="text-center"><%#Eval("StartDate").ToString().Insert(4, "/").Insert(7, "/") %> </td>
                                        <td class="text-center"><%#Eval("EndDate").ToString().Insert(4, "/").Insert(7, "/") %> </td>
                                        <td class="text-center">
                                            <div class="badge"><%#Eval("Status") %></div>
                                        </td>

                                        <td class="text-center mallEditPermission">
                                            <div class="text-center mallEditPermission">
                                                <a href="1_3_2_DiscountCodeEdit.aspx?id=<%#Eval("No") %>&DiscountCode=<%#Eval("DiscountCode") %>">
                                                    <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                        編輯
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                    </button>

                                                </a>
                                                <a href="1_3_3_DiscountCodeDelete.aspx?id=<%#Eval("No") %>&DiscountCode=<%#Eval("DiscountCode") %>">
                                                    <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                        刪除
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                    </button>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                            </table>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

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
            <%--            <div class="row">
                <div class="col-11"></div>
                <div class="col-1">
                    <button type="button" class="btn btn-secondary btn-sm btn-icon-text mr-3">
                        新增
                    <i class="typcn typcn-edit btn-icon-append"></i>
                    </button>
                </div>
            </div>--%>


            <%--新增按鈕--%>
            <div class="container-fluid page-body-wrapper mallEditPermission">

                <div id="settings-trigger">

                    <a href="1_3_1_DiscountCodeAdd.aspx" style="color: white">+</a>
                </div>

            </div>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script>
        var Today = new Date();
        Today.toLocaleDateString();


        function datecheck(startdate, enddate) {
            if (Today > startdate.toLocaleDateString() && Today < enddate.toLocaleDateString()) {
                event.preventDefault();
                $(".aaa").val("使用中");

            };

        }




    </script>

    <script>

        $(function () {
            if ($("#txpMallEdit").val() == "none") {
                $(".mallEditPermission").remove();
            }

        })


        $(function () {
            $(".badge").each(function () {
                $(this).html();
                if ($(this).html() == "使用中") {
                    $(this).addClass("badge-primary")
                }

                if ($(this).html() == "待生效") {
                    $(this).addClass("badge-info")
                }

                if ($(this).html() == "已過期") {
                    $(this).addClass("badge-warning")
                }

            })
        })


    </script>
</asp:Content>
