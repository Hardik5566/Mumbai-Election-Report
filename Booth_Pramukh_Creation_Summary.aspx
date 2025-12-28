<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Booth_Pramukh_Creation_Summary.aspx.cs" Inherits="Booth_Pramukh_Creation_Summary" %>

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

        .table td {
            text-align: center !important;
            font-weight: bold;
        }

        .tbl_boder th {
            text-align: center;
        }

        .row-red {
            background-color: #f8d7da;
        }

        .row-yellow {
            background-color: #fff3cd;
        }

        .row-green {
            background-color: #d4edda;
        }

        .table td {
            text-align: center !important;
            font-weight: bold;
            background-color: inherit;
        }

        .tbl_boder td {
            border: 1px solid #bbbbbb !important;
        }

        .legend-bar {
            display: flex;
            gap: 20px;
            margin-bottom: 10px;
            font-weight: 600;
            font-size: 14px;
        }

        .legend-item {
            display: flex;
            align-items: center;
        }

        .legend-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 6px;
        }

        .legend-item.red .legend-dot {
            background-color: #dc3545;
        }

        .legend-item.yellow .legend-dot {
            background-color: #ffc107;
        }

        .legend-item.green .legend-dot {
            background-color: #28a745;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="messagealert" id="alert_container">
    </div>
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bi bi-grid">&nbsp</i>Booth Pramukh Creation Report</div>

        <div class="ms-auto btn_header">
            <div class="btn-group">
                <button type="button" class="btn btn-sm btn-danger btn_add" data-bs-toggle="modal" data-bs-target="#modal_add">Export</button>
            </div>
        </div>
    </div>

    <div class="card">

        <div class="card-body">
            <div class="row mb-2">
                <div class="col-md-6">
                    <div class="legend-bar">
                        <span class="legend-item red">
                            <span class="legend-dot"></span>0–20% Low
                        </span>

                        <span class="legend-item yellow">
                            <span class="legend-dot"></span>20–60% Medium
                        </span>

                        <span class="legend-item green">
                            <span class="legend-dot"></span>60–100% High
                        </span>
                    </div>
                </div>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddl_colour_filter" CssClass="form-control-sm ddl_colour_filter" runat="server">
                        <asp:ListItem Value="All">All</asp:ListItem>
                        <asp:ListItem Value="Red">Red (0–20%)</asp:ListItem>
                        <asp:ListItem Value="Yellow">Yellow (21–60%)</asp:ListItem>
                        <asp:ListItem Value="Green">Green (61–100%)</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
            <div class="table-responsive">
                <asp:GridView ID="grid_survey_summary"
                    ClientIDMode="Static"
                    CssClass="table tbl_boder align-middle mb-0 grid_survey_summary"
                    runat="server"
                    AllowSorting="true"
                    OnSorting="grid_user_summary_Sorting"
                    AutoGenerateColumns="false">

                    <Columns>


                        <asp:TemplateField HeaderText="Ward" SortExpression="ward_no">
                            <ItemTemplate><%# Eval("ward_no") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total Booth" SortExpression="total_booth">
                            <ItemTemplate><%# Eval("total_booth") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Booth Pramukh" SortExpression="booth_pramukh">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("booth_pramukh") %></ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="Active" SortExpression="active_booth_pramukh">
                            <ItemStyle CssClass="bg_negetive text-white text-center" />
                            <ItemTemplate><%# Eval("active_booth_pramukh") %></ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="Remain Booth" SortExpression="remain_booth">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate><%# Eval("remain_booth") %></ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="%" SortExpression="booth_per">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate>
                                <label class="booth-per"><%# Eval("booth_per")+"%" %></label>


                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="%" SortExpression="booth_per">
                            <ItemStyle CssClass="text-center" />
                            <ItemTemplate>
                                <a href="Booth_Pramukh_List.aspx?w=<%# Eval("ward_no") %>">
                                   View
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

            $(".grid_survey_summary tr").each(function () {

                var perText = $(this).find(".booth-per").text().replace('%', '').trim();

                if (perText === "") return;

                var per = parseFloat(perText);
                console.log(per);
                if (per >= 0 && per < 21) {
                    $(this).addClass("row-red");
                }
                else if (per >= 21 && per < 61) {
                    $(this).addClass("row-yellow");
                }
                else if (per >= 61) {
                    $(this).addClass("row-green");
                }
            });


            $('#<%= ddl_colour_filter.ClientID %>').change(function () {
                var filter = $(this).val(); // All, Red, Yellow, Green

                // Iterate only tbody rows
                $('#<%= grid_survey_summary.ClientID %> tbody tr').each(function (index) {
                    var $row = $(this);

                    // Skip the first row (index 0)
                    if (index === 0) return true; // continue to next row

                    var valText = $row.find('.booth-per').text() || "0";
                    var val = parseFloat(valText.replace('%', '')) || 0;

                    var show = false;
                    if (filter === "All") show = true;
                    else if (filter === "Red" && val > 0 && val <= 20) show = true;
                    else if (filter === "Yellow" && val > 21 && val <= 60) show = true;
                    else if (filter === "Green" && val > 61 && val <= 100) show = true;

                    if (show) $row.show();
                    else $row.hide();
                });
            });





        });
    </script>

</asp:Content>

