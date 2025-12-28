<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Survey_Summary_Chart.aspx.cs" Inherits="Survey_Summary_Chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .ward-card {
            width: 240px;
            border: 1px solid #ddd;
            padding: 10px;
            margin: 8px;
            float: left;
            text-align: center;
            border-radius: 6px;
        }

        .chart-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            margin-top: 15px;
        }

            .chart-table td {
                padding: 6px 8px;
                white-space: nowrap;
            }

            .chart-table .dot {
                width: 10px;
                height: 10px;
                border-radius: 50%;
                display: inline-block;
                margin-right: 6px;
            }

        /* Colors */
        .pos .dot {
            background: #28a745;
        }

        .neg .dot {
            background: #dc3545;
        }

        .doubt .dot {
            background: #6c757d;
        }

        .cant .dot {
            background: #ffc107;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="row">



        <asp:Repeater ID="rptWards" runat="server">

            <ItemTemplate>
                <div class="col-12 col-sm-4 col-md-3">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title text-center">
                                <h5>Ward <%# Eval("ward_no") %></h5>

                            </div>
                        </div>
                        <div class="card-body" style="text-align: center; margin: 0 auto;">


                            <canvas class="wardChart"
                                width="200"
                                height="200"
                                data-positive="<%# Eval("positive") %>"
                                data-negative="<%# Eval("negative") %>"
                                data-cantsay="<%# Eval("cant_say") %>"
                                data-doubtful="<%# Eval("doubtful") %>" style="margin: 0 auto;"></canvas>




                            <table class="chart-table table table-bordered">
                                <tr>
                                    <td style="background-color: #e3e3e3;" colspan="2" class="pos">
                                        Total Survey (<%# Eval("survey_done") %>)
                                    </td>
                                </tr>

                                <tr>
                                    <td class="pos">
                                        <span class="dot"></span>
                                        Positive (<%# Eval("positive") %>)
                                    </td>
                                    <td class="neg">
                                        <span class="dot"></span>
                                        Negative (<%# Eval("negative") %>)
                                    </td>
                                </tr>

                                <tr>
                                    <td class="doubt">
                                        <span class="dot"></span>
                                        Doubtful (<%# Eval("doubtful") %>)
                                    </td>
                                    <td class="cant">
                                        <span class="dot"></span>
                                        Can’t Say (<%# Eval("cant_say") %>)
                                    </td>
                                </tr>
                            </table>


                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    <script>
        document.addEventListener("DOMContentLoaded", function () {

            document.querySelectorAll(".wardChart").forEach(function (canvas) {

                new Chart(canvas, {
                    type: "pie",
                    data: {
                        datasets: [{
                            data: [
                                canvas.dataset.positive,
                                canvas.dataset.negative,
                                canvas.dataset.cantsay,
                                canvas.dataset.doubtful
                            ],
                            backgroundColor: [
                                "#28a745",
                                "#dc3545",
                                "#ffc107",
                                "#6c757d"
                            ]
                        }]
                    },
                    options: {
                        responsive: false,
                        plugins: {
                            legend: {
                                display: false   // 👈 HIDE LABELS
                            }
                        }
                    }
                });

            });
        });
    </script>



</asp:Content>

