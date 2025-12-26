<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .card {
            box-shadow: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="card overflow-hidden">
                <div class="card-body" style="background-color: #cb7916; color: white;">
                    <h5 style="text-align: center; text-transform: uppercase; font-weight: 600;">Mumbai Municipal Corporation </h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>Total Ward</p>
                                <h4 class="">227
                                </h4>
                            </div>
                            <div>
                                <img src="img/polling-station.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>Total Booth</p>
                                <h4 class="">11,748
                                </h4>
                            </div>
                            <div>
                                <img src="img/ticket-office.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>Total Voter</p>
                                <h4 class="">1,03,54,316
                                </h4>
                            </div>
                            <div>
                                <img src="img/group.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>


    </div>


    <div class="row">

        <div class="col-md-4">
            <div class="card overflow-hidden radius-10">
                <div class="card-body" style="background-color: #43abf4;">
                    <a href="#" style="color: white">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>Total User</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_total_user" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="img/team.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card overflow-hidden radius-10">
                <div class="card-body" style="background-color: #44c091">
                    <a href="#" style="color: white">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>Active User</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_active_user" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="img/active_user.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card overflow-hidden radius-10">
                <div class="card-body" style="background-color: #b75252">
                    <a href="#" style="color: white">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>In-Active User</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_inactive_user" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="img/not_Active.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>
                                    Total<br />
                                    Survey
                                </p>
                                <h4 class="">
                                    <asp:Label ID="lbl_total_survey" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="img/surveyor (1).png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>
                                    Total<br />
                                    Slip Send
                                </p>
                                <h4 class="">0
                                </h4>
                            </div>
                            <div>
                                <img src="img/id-card.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>
                                    Phonebook<br />
                                    Match
                                </p>
                                <h4 class="">
                                    <asp:Label ID="lbl_phonebook_user" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="img/phone-book.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card overflow-hidden radius-10">
                <div class="card-body">
                    <a href="#" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>Phonebook<br />
                                    Match Voter</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_phonebook_voter" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="img/phone-book_voter.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h6>Confirm Voter (Phonebook Match Voters)</h6>
                    <canvas id="voterChart" width="200" height="200"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h6>Survey</h6>
                    <canvas id="surveyBarChart" width="400" height="290"></canvas>

                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>


</asp:Content>

