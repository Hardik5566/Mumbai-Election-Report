<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Zone_Wise_User_Summary.aspx.cs" Inherits="Zone_Wise_User_Summary" %>

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

        .ward_nos {
            width: 100px;
        }

        .center_text {
            text-align: center;
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
                <asp:Button ID="btn_export" CssClass="btn btn-sm btn-danger btn_add" OnClick="btn_export_Click" runat="server" Text="Export" />
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
                    AutoGenerateColumns="false">

                    <Columns>


                        <asp:TemplateField HeaderText="Zone">
                            <ItemTemplate><%# Eval("zone_name") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ward List">

                            <ItemTemplate>
                                <p style="width: 300px; word-break: break-word; white-space: normal;">
                                    <%# Eval("ward_nos") %>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Active User">
                            <ItemStyle CssClass="bg_active text-white text-center" />
                            <ItemTemplate><%# Eval("total_active") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="In-Active User">
                            <ItemStyle CssClass="bg_notactive text-white text-center" />
                            <ItemTemplate><%# Eval("total_inactive") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Admin" SortExpression="admin">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("admin") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sub Admin" SortExpression="sub_admin">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("sub_admin") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sakti" SortExpression="sakti">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("sakti") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Booth Pramukh" SortExpression="booth_pramukh">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("booth_pramukh") %></ItemTemplate>
                        </asp:TemplateField>

                        <%-- <asp:TemplateField HeaderText="Sah Sakti" SortExpression="sah_sakti">
                            <ItemTemplate><%# Eval("sah_sakti") %></ItemTemplate>
                        </asp:TemplateField>--%>

                        <%--  <asp:TemplateField HeaderText="Sah Booth Pramukh" SortExpression="sah_booth_pramukh">
                            <ItemTemplate><%# Eval("sah_booth_pramukh") %></ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="Karykarta" SortExpression="karykarta">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("karykarta") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phonebook User" SortExpression="phonebook_match_user">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("phonebook_match_user") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phonebook Voter" SortExpression="phonebook_match_voter">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("phonebook_match_voter") %></ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>


</asp:Content>

