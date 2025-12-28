<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Survey_Summary.aspx.cs" Inherits="Survey_Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .brand_img {
            width: 100%;
        }

        .badge {
            background-color: #ffffff;
            color: black;
            border: 1px solid black;
        }

        .bg_positive {
            background-color: #ace9ac !important;
            color: #045904 !important;
        }

        .bg_negetive {
            background-color: #f9a1a1 !important;
            color: #ed0300 !important;
        }

        .bg_doutfull {
            background-color: #8f8fff !important;
            color: #0b0b81 !important;
        }

        .bg_cantsay {
            background-color: #7eb8e7 !important;
            color: #063461 !important;
        }

        .table td, .table th {
            text-align: center !important;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="messagealert" id="alert_container">
    </div>
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bi bi-grid">&nbsp</i>Mumbai Survey Report</div>

        <div class="ms-auto btn_header">
            <div class="btn-group">
                <a href="Survey_Summary_Chart.aspx" class="btn btn-sm btn-primary btn_add">Survey Chart</a>&nbsp
                <button type="button" class="btn btn-sm btn-danger btn_add" data-bs-toggle="modal" data-bs-target="#modal_add">Export</button>
            </div>
        </div>
    </div>

    <div class="card">

        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="grid_survey_summary"
                    ClientIDMode="Static"
                    CssClass="table tbl_boder align-middle mb-0"
                    runat="server"
                    AllowSorting="true"
                    OnSorting="grid_user_summary_Sorting"
                    AutoGenerateColumns="false">

                    <Columns>


                        <asp:TemplateField HeaderText="Ward" SortExpression="ward_no">
                            <ItemTemplate><%# Eval("ward_no") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total Survey" SortExpression="survey_done">
                            <ItemTemplate><%# Eval("survey_done") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Positive" SortExpression="positive">
                            <ItemStyle CssClass="bg_positive text-white text-center" />
                            <ItemTemplate><%# Eval("positive") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Negative" SortExpression="negative">
                            <ItemStyle CssClass="bg_negetive text-white text-center" />
                            <ItemTemplate><%# Eval("negative") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Doubtful" SortExpression="doubtful">
                            <ItemStyle CssClass="bg_doutfull text-white text-center" />
                            <ItemTemplate><%# Eval("doubtful") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Can't say" SortExpression="cant_say">
                            <ItemStyle CssClass="bg_cantsay text-white text-center" />
                            <ItemTemplate><%# Eval("cant_say") %></ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>


</asp:Content>

