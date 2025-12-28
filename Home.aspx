<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .page-content {
            padding: 0 !important;
        }

        .page-content2 {
            padding: 1.5rem 1.5rem 2.5rem 1.5rem;
        }


        .card {
            box-shadow: none;
        }

        /* Card base */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            border: none;
        }

        /* Wrapper */
        .ward-summary {
            text-align: center;
        }

        /* Title */
        .ward-title {
            font-size: 15px;
            margin-bottom: 15px;
            color: #333;
            border-bottom: 1px solid #eee;
            padding-bottom: 8px;
        }

        /* Grid */
        .ward-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

            /* Single item */
            .ward-grid .item {
                background: #f8f9fa;
                border-radius: 8px;
                padding: 12px 5px;
            }

            /* Label */
            .ward-grid .label {
                font-size: 13px;
                color: #666;
                margin-bottom: 4px;
            }

            /* Value */
            .ward-grid .value {
                font-size: 17px;
                font-weight: 700;
                color: #333;
            }

            /* Active */
            .ward-grid .item.active {
                background: #e8f5e9;
            }

                .ward-grid .item.active .value {
                    color: #2e7d32;
                }

            /* Inactive */
            .ward-grid .item.inactive {
                background: #fdecea;
            }

                .ward-grid .item.inactive .value {
                    color: #c62828;
                }

        /* Voters single column fix */
        .col-md-2 .ward-grid {
            grid-template-columns: 1fr;
        }



        .stat-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 12px;
            font-family: inherit;
        }

            .stat-table th,
            .stat-table td {
                border: 1px solid #e0e0e0;
                width: 33.33%;
                text-align: center;
                padding: 10px;
            }

        .stat-header th {
            font-size: 13px;
            font-weight: 200;
            color: #555;
            background: #fafafa;
        }

        .stat-value td {
            font-size: 15px;
            font-weight: 700;
            color: #222;
        }

        /* dots */
        .dot {
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 6px;
        }

            .dot.total {
                background: #367fff;
            }

            .dot.active {
                background: #4caf50;
            }

            .dot.inactive {
                background: #f44336;
            }

        /* Force same height cards */
        .equal-height-row {
            display: flex;
        }

            .equal-height-row > [class*="col-"] {
                display: flex;
            }

        /* Chart */
        .chart-box {
            min-height: 100px;
        }

            .chart-box #usersPie {
                height: 200px !important;
                margin: 0 auto;
            }

            .chart-box #phonebookChart {
                height: 200px !important;
                margin: 0 auto;
            }

            .chart-box #surveyBarChart {
                height: 200px !important;
                margin: 0 auto;
            }

            .chart-box #SlipPie {
                height: 200px !important;
                margin: 0 auto;
            }

        /* Mini boxes */
        .mini-box {
            border: 1px solid #e2e2e2;
            border-radius: 8px;
            padding: 14px;
            text-align: center;
            background: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .mini-title {
            font-size: 13px;
            color: #777;
            margin-bottom: 6px;
            font-weight: 600;
        }

        .mini-value {
            font-size: 22px;
            font-weight: 700;
            color: #222;
        }

        .stat-table-compact {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            text-align: center;
        }

            .stat-table-compact td {
                padding: 8px 6px;
                border: 1px solid #e0e0e0;
            }

            .stat-table-compact .total-row td {
                background: #f5f5f5;
                font-weight: 600;
                text-align: left;
                padding: 8px 10px;
            }

            .stat-table-compact .status-row td {
                vertical-align: middle;
            }

            .stat-table-compact strong {
                font-size: 14px;
                display: block;
                margin-top: 2px;
            }

        /* Dots */
        .dot {
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-right: 4px;
        }

        /* Colors */
        .pos .dot {
            background: #28a745;
        }

        .neg .dot {
            background: #dc3545;
        }

        .doubt .dot {
            background: #fd7e14;
        }

        .cant .dot {
            background: #6c757d;
        }

        .total-row .dot.total {
            background: #0d6efd;
        }

        .home-banner {
            min-height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #fff7ed, #ffffff);
            border-bottom: 1px solid #eee;
        }

        .banner-logo {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            object-fit: cover;
        }

        .banner-title {
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            color: #212529;
        }

        .banner-subtitle {
            font-size: 1.1rem;
            color: #6c757d;
            margin-top: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">


    <div>
        <img src="img/Header.jpg" style="width: 100%" />
    </div>

    <div class="page-content2">



        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-5">
                        <div class="card overflow-hidden radius-10">
                            <div class="card-body">
                                <div class="ward-summary">
                                    <div class="ward-title">Ward</div>

                                    <div class="ward-grid">
                                        <div class="item">
                                            <div class="label">Total</div>
                                            <div class="value">227</div>
                                        </div>

                                        <div class="item active">
                                            <div class="label">Active</div>
                                            <div class="value">
                                                <asp:Label ID="lbl_active_ward" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>

                                        <div class="item inactive">
                                            <div class="label">Not Active</div>
                                            <div class="value">
                                                <asp:Label ID="lbl_not_active_ward" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card overflow-hidden radius-10">
                            <div class="card-body">
                                <div class="ward-summary">
                                    <div class="ward-title">Booth</div>

                                    <div class="ward-grid">
                                        <div class="item">
                                            <div class="label">Total Booth</div>
                                            <div class="value">
                                                <asp:Label ID="lbl_total_booth" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>

                                        <div class="item active">
                                            <div class="label">Active</div>
                                            <div class="value">
                                                <asp:Label ID="lbl_active_booth" runat="server" Text=""></asp:Label>

                                            </div>
                                        </div>

                                        <div class="item inactive">
                                            <div class="label">Not Active</div>
                                            <div class="value">
                                                <asp:Label ID="lbl_not_active_booth" runat="server" Text=""></asp:Label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card overflow-hidden radius-10">
                            <div class="card-body">
                                <div class="ward-summary">
                                    <div class="ward-title">Voters</div>

                                    <div class="ward-grid">
                                        <div class="item">
                                            <div class="label">Total</div>
                                            <div class="value">1,03,54,316</div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row equal-height-row">

                    <div class="col-md-5 d-flex">
                        <div class="card overflow-hidden radius-10 w-100">
                            <div class="card-body d-flex flex-column">

                                <div class="ward-summary flex-grow-1">

                                    <div class="ward-title">Users</div>

                                    <!-- Pie Chart -->
                                    <div class="chart-box flex-grow-1">
                                        <canvas id="usersPie"></canvas>

                                    </div>

                                    <table class="stat-table mt-3">
                                        <tr class="stat-header">
                                            <th><span class="dot total"></span>Total</th>
                                            <th><span class="dot active"></span>Active</th>
                                            <th><span class="dot inactive"></span>Not Active</th>
                                        </tr>
                                        <tr class="stat-value">
                                            <td>
                                                <asp:Label ID="lbl_total_user" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_active_total_user" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_inactive_total_user" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>

                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="col-md-7 d-flex">
                        <div class="card overflow-hidden radius-10 w-100">
                            <div class="card-body d-flex">



                                <div class="row g-3 w-100 align-content-stretch">

                                    <asp:ListView ID="list_zone_user" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-4">
                                                <div class="mini-box h-100">
                                                    <div class="mini-title">
                                                        <%# Eval("zone_name") %>
                                                    </div>
                                                    <div class="mini-value"><%# Eval("active_user") %></div>
                                                </div>

                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>

                                </div>
                            </div>


                        </div>
                    </div>



                </div>

                <div class="row">
                    <div class="col-md-6 d-flex">
                        <div class="card overflow-hidden radius-10 w-100">
                            <div class="card-body d-flex flex-column">

                                <div class="ward-summary flex-grow-1">

                                    <div class="ward-title">Phonebook Match</div>

                                    <!-- Pie Chart -->
                                    <div class="chart-box flex-grow-1">
                                        <canvas id="phonebookChart"></canvas>
                                    </div>

                                    <table class="stat-table mt-3">
                                        <tr class="stat-header">
                                            <th><span class="dot total"></span>Total Match User</th>
                                            <th><span class="dot active"></span>Total Match Voter</th>
                                        </tr>
                                        <tr class="stat-value">
                                            <td>5247</td>
                                            <td>200</td>
                                        </tr>
                                    </table>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex">
                        <div class="card overflow-hidden radius-10 w-100">
                            <div class="card-body d-flex flex-column">

                                <div class="ward-summary flex-grow-1">

                                    <div class="ward-title">Survey</div>

                                    <!-- Pie Chart -->
                                    <div class="chart-box flex-grow-1">
                                        <canvas id="surveyBarChart"></canvas>
                                    </div>

                                    <table class="stat-table-compact">
                                        <tr class="total-row">
                                            <td colspan="4">


                                                <span class="dot total"></span>
                                                Total Survey :
                                            <asp:Label ID="lbl_total_survey" runat="server" />

                                            </td>
                                        </tr>

                                        <tr class="status-row">
                                            <td class="pos">
                                                <span class="dot"></span>
                                                Positive<br />
                                                <strong>
                                                    <asp:Label ID="lbl_postive" runat="server" /></strong>
                                            </td>

                                            <td class="neg">
                                                <span class="dot"></span>
                                                Negative<br />
                                                <strong>
                                                    <asp:Label ID="lbl_negetive" runat="server" /></strong>
                                            </td>

                                            <td class="doubt">
                                                <span class="dot"></span>
                                                Doubtful<br />
                                                <strong>
                                                    <asp:Label ID="lbl_doubtful" runat="server" /></strong>
                                            </td>

                                            <td class="cant">
                                                <span class="dot"></span>
                                                Can’t Say<br />
                                                <strong>
                                                    <asp:Label ID="lbl_cantsay" runat="server" /></strong>
                                            </td>
                                        </tr>
                                    </table>



                                </div>

                            </div>
                        </div>
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-6 d-flex">
                        <div class="card overflow-hidden radius-10 w-100">
                            <div class="card-body d-flex flex-column">

                                <div class="ward-summary flex-grow-1">

                                    <div class="ward-title">Slip</div>

                                    <!-- Pie Chart -->
                                    <div class="chart-box flex-grow-1 mb-4">
                                         <canvas id="SlipPie"></canvas>
                                    </div>



                                   <table class="stat-table-compact">
                                       
                                        <tr class="status-row">
                                            <td class="cant">
                                                <span class="dot"></span>
                                                Total Voter<br />
                                                <strong>
                                                    <asp:Label ID="Label2" Text="1,03,54,316" runat="server" /></strong>
                                            </td>

                                            <td class="pos">
                                                <span class="dot"></span>
                                                Slip Send<br />
                                                <strong>
                                                    <asp:Label ID="Label3" Text="0" runat="server" /></strong>
                                            </td>

                                            <td class="neg">
                                                <span class="dot"></span>
                                                Remain<br />
                                                <strong>
                                                    <asp:Label ID="Label4" Text="1,03,54,316" runat="server" /></strong>
                                            </td>

                                        </tr>
                                    </table>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex">
                        <div class="card overflow-hidden radius-10 w-100">
                            <div class="card-body d-flex flex-column">

                                <div class="ward-summary flex-grow-1">

                                    <div class="ward-title">Start Karykarta</div>

                                    <!-- Pie Chart -->
                                    <div class="chart-box flex-grow-1">
                                        <canvas id="usersPie"></canvas>
                                    </div>

                                    <table class="stat-table">
                                        <tr>
                                            <td style="background-color: #e3e3e3;" colspan="2" class="pos">Total Survey 51000)
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="pos">
                                                <span class="dot"></span>
                                                Positive 5465
                                            </td>
                                            <td class="neg">
                                                <span class="dot"></span>
                                                Negative 54
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="doubt">
                                                <span class="dot"></span>
                                                Doubtful 7897
                                            </td>
                                            <td class="cant">
                                                <span class="dot"></span>
                                                Can’t Say 1215
                                            </td>
                                        </tr>
                                    </table>


                                </div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-md-4">
                <div class="card overflow-hidden radius-10">
                    <div class="card-body">
                        <img src="img/DISTRINCT%20WISE%20MAP.jpg" width="100%" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>




</asp:Content>

