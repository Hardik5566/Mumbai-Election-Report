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

        .table td {
            text-align: center !important;
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
                <asp:Button ID="btn_export" class="btn btn-sm btn-danger btn_add" OnClick="btn_export_Click" runat="server" Text="Export" />
               <%-- <button type="button" class="btn btn-sm btn-danger btn_add" data-bs-toggle="modal" data-bs-target="#modal_add">Export</button>--%>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <asp:DropDownList ID="ddl_district" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged" runat="server" CssClass="form-control" AutoPostBack="true">
                <asp:ListItem Value="">-- Select Zone --</asp:ListItem>
                <asp:ListItem Value="1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 44, 45, 46, 47, 48, 49">North Mumbai</asp:ListItem>
                <asp:ListItem Value="103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142">North East</asp:ListItem>
                <asp:ListItem Value="70, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 149, 151, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171">North Central</asp:ListItem>
                <asp:ListItem Value="37, 38, 39, 40, 41, 42, 43, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 121">North West</asp:ListItem>
                <asp:ListItem Value="143, 144, 145, 146, 147, 148, 150, 152, 153, 154, 155, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 194, 200, 201">South Central</asp:ListItem>
                <asp:ListItem Value="193, 195, 196, 197, 198, 199, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227">South Mumbai</asp:ListItem>
            </asp:DropDownList>


        </div>
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

