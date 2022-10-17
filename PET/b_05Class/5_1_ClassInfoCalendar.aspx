<%@ Page Title="" Language="C#" MasterPageFile="~/b_00Main/b_MasterPage.master" %>


<script runat="server">
    string Today = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Today = DateTime.Now.ToString("yyyy-MM-dd");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSHolder" runat="Server">
    <link href="/f_lib/fullCalendar/main.min.css" rel="stylesheet" />
    <style>
        #class i.menu-arrow:before {
            content: "\e0bd";
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #script-warning {
            display: none;
            background: #eee;
            border-bottom: 1px solid #ddd;
            padding: 0 10px;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
            font-size: 12px;
            color: red;
        }

        #loading {
            display: none;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        #calendar {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="Server">
    課程資訊行事曆
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper bg-light">
            <div id='script-warning'>
                <code>資料讀取失敗</code>
            </div>
            <div class="row">
                <div class="col-12">
                    <h3 class="text-primary text-center">團體課程行事曆</h3>
                </div>
            </div>
            <div id='calendar'></div>

            <%--回列表--%>
<%--            <div class="theme-setting-wrapper">
                <div id="settings-trigger">
                    <a href="/b_05Class/5_1_ClassInfo.aspx" title="回列表">
                        <i class="typcn typcn-arrow-back  btn-icon-append" style="font-size: 1.5em; padding: 0; margin: 0"></i>
                    </a>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server">

    <script src="/f_lib/fullCalendar/main.min.js"></script>
    <script src="/f_lib/fullCalendar/locales/zh-tw.js"></script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                initialDate: '<%=Today%>',
                editable: true,
                navLinks: true, // can click day/week names to navigate views
                dayMaxEvents: true, // allow "more" link when too many events
                events: {
                    url: '/b_05Class/ClassInfoCalendar.aspx',
                    failure: function () {
                        document.getElementById('script-warning').style.display = 'block'
                    }
                }
            });

            calendar.render();
            //使用語系 lib
            calendar.setOption('locale', "zh-TW");
        });

    </script>
</asp:Content>
