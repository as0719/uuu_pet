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

            <div claa="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">表單狀態: </label>
                        <div class="col-sm-10">
                            <select class="form-control">
                                <option>已確認</option>
                                <option>待審核</option>
                                <option>審核中</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">表單號碼: #1</h4>

                        <div class="forms-sample">
                            <div class="form-group">
                                <label for="exampleInputName1">Q1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</label>
                                <div>
                                    <label for="exampleInputUsername2" class="col-sm-5 col-form-label">2022年08月23日	</label>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Q1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</label>
                                <div>
                                    <label for="exampleInputUsername2" class="col-sm-5 col-form-label">2022年08月23日	</label>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Q1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</label>
                                <div>
                                    <label for="exampleInputUsername2" class="col-sm-5 col-form-label">2022年08月23日	</label>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Q1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</label>
                                <div>
                                    <label for="exampleInputUsername2" class="col-sm-5 col-form-label">2022年08月23日	</label>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Q1: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</label>
                                <div>
                                    <label for="exampleInputUsername2" class="col-sm-5 col-form-label">2022年08月23日	</label>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-9"></div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-danger mr-2">拒絕</button>
                                    <button type="submit" class="btn btn-primary mr-2">確認</button>
                                    <button class="btn btn-light">取消</button>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <!-- content-wrapper ends -->

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="JavaScriptHolder" runat="Server"></asp:Content>
