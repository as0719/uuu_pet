<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CourseUtility utility = new CourseUtility();
            var result = utility.GetAllinquiryForms().GroupBy(f => f.Status).
                 Select(g => new { g.Key, Count = g.Count() });
            int i = 0;
           
            foreach (var item in result)
            {
                if (i == 0)
                {
                    HiddenField1.Value = item.Key;
                    HiddenField2.Value = item.Count.ToString();
                }
                else
                {
                    HiddenField1.Value += "," + item.Key;
                    HiddenField2.Value += "," + item.Count.ToString();
                }

                i++;
            }
        }

    }
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
                    <div class="card">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
            </div>

        </div>
        <!-- content-wrapper ends -->
    </div>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script src="/b_forBackend/js/chart.js"></script>
    <script>
        var ctx = document.getElementById("myChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: document.getElementById("BodyHolder_HiddenField1").value.split(","),
                datasets: [{
                    label: '一對一團體課',
                    data: document.getElementById("BodyHolder_HiddenField2").value.split(","),
                    borderWidth: 1,
                    //backgroundColor: GetRandomColors(document.getElementById("HiddenField2").value.split(",").length)
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

    </script>
</asp:Content>
