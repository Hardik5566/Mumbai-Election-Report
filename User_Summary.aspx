<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User_Summary.aspx.cs" Inherits="User_Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Customer
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

        .bg_active {
            background-color: darkgreen !important;
        }

         .bg_notactive {
            background-color: darkred !important;
        }

         .table td{
             text-align:center !important;
         }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="messagealert" id="alert_container">
    </div>
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bi bi-grid">&nbsp</i>Mumbai User Report</div>

        <div class="ms-auto btn_header">
            <div class="btn-group">
                <button type="button" class="btn btn-sm btn-danger btn_add" data-bs-toggle="modal" data-bs-target="#modal_add">Export</button>
            </div>
        </div>
    </div>

    <div class="card">

        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="grid_user_summary"
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

        <asp:TemplateField HeaderText="Total User" SortExpression="total_user">
            <ItemTemplate><%# Eval("total_user") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Active User" SortExpression="total_active_user">
            <ItemStyle CssClass="bg_active text-white text-center" />
            <ItemTemplate><%# Eval("total_active_user") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="In-Active User" SortExpression="total_inactive_user">
            <ItemStyle CssClass="bg_notactive text-white text-center" />
            <ItemTemplate><%# Eval("total_inactive_user") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Admin" SortExpression="admin">
            <ItemTemplate><%# Eval("admin") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sub Admin" SortExpression="sub_admin">
            <ItemTemplate><%# Eval("sub_admin") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sakti" SortExpression="sakti">
            <ItemTemplate><%# Eval("sakti") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Booth Pramukh" SortExpression="booth_pramukh">
            <ItemTemplate><%# Eval("booth_pramukh") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sah Sakti" SortExpression="sah_sakti">
            <ItemTemplate><%# Eval("sah_sakti") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sah Booth Pramukh" SortExpression="sah_booth_pramukh">
            <ItemTemplate><%# Eval("sah_booth_pramukh") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Karykarta" SortExpression="karykarta">
            <ItemTemplate><%# Eval("karykarta") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phonebook User" SortExpression="phonebook_match_user">
            <ItemTemplate><%# Eval("phonebook_match_user") %></ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phonebook Voter" SortExpression="phonebook_match_voter">
            <ItemTemplate><%# Eval("phonebook_match_voter") %></ItemTemplate>
        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>


</asp:Content>

