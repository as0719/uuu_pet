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
    課程資訊管理
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyHolder" runat="Server">
    <div class="main-panel">
        <div class="content-wrapper">


            <div class="row">
                <div class="col-md-12  grid-margin">
                    <div class="card">
                        <div class="table-responsive pt-3">
                            <table class="table table-striped project-orders-table">
                                <thead>
                                    <tr>
                                        <th class="ml-5">課程ID</th>
                                        <th>報名人姓名</th>
                                        <th>電話</th>
                                        <th>Email</th>
                                        <th>參加人數</th>
                                        <th>參加寵物數</th>
                                        <th>登記日期</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#C1</td>
                                        <td>Consectetu</td>
                                        <td>09123456789 </td>
                                        <td>aaa@gmail.com</td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>2022年09月10日</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <button type="button" class="btn btn-success btn-sm btn-icon-text mr-3">
                                                    Edit
                                                           
                                                    <i class="typcn typcn-edit btn-icon-append"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger btn-sm btn-icon-text">
                                                    Delete
                                                           
                                                    <i class="typcn typcn-delete-outline btn-icon-append"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- content-wrapper ends -->
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server"></asp:Content>
