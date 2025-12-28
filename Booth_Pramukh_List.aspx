<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Booth_Pramukh_List.aspx.cs" Inherits="Booth_Pramukh_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Booth Pramukh List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .card {
            border: 1px solid gray;
            box-shadow: none !important;
        }

        .rounded_photo {
            border-radius: 10%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="messagealert" id="alert_container">
    </div>
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bi bi-grid">&nbsp</i>Ward No. <%= Request.QueryString["w"].ToString() %> Booth Pramukh</div>

        <div class="ms-auto btn_header">
            <div class="btn-group">
                <a class="btn btn-sm btn-primary" href="Booth_Pramukh_Creation_Summary.aspx">Go To Ward List</a>&nbsp
                <asp:Button ID="btn_export" class="btn btn-sm btn-danger btn_add" OnClick="btn_export_Click" runat="server" Text="Export" />
            </div>
        </div>
    </div>

    <div class="row">
        <asp:ListView ID="list_booth_pramukh" runat="server">
            <ItemTemplate>

                <div class="col-md-2">
                    <div class="card shadow-sm mb-3">
                        <div class="card-body text-center">

                            <!-- Booth No -->
                            <div class="mb-2">
                                <span class="badge bg-bronze" style="font-size: 14px; font-weight: 500;"><%# "Booth No. "+Eval("booth_javabdari") %></span>
                            </div>

                            <!-- User Photo -->
                            <div class="mb-2">
                                <img src="<%# get_photo_url(Eval("photo").ToString()) %>" style="width: 85px" onerror="this.onerror=null;this.src='img/default_user.jpg';" class="rounded_photo border" alt="User Photo">
                            </div>

                            <!-- Name -->
                            <h6 class="card-title mb-1" style="font-weight: 800; color: #c56b0b;"><%# Eval("name") %></h6>

                            <!-- Contact Number -->
                            <p class="card-text mb-2"><%# Eval("mobile_no") %></p>

                            <!-- Action Icons -->
                            <div class="d-flex justify-content-center gap-3">
                                <a href="tel:+919876543210" class="text-success fs-5">
                                    <i class="bi bi-telephone-fill"></i>
                                </a>
                                <a href="https://wa.me/919876543210" target="_blank" class="text-success fs-5">
                                    <i class="bi bi-whatsapp"></i>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:ListView>
    </div>

</asp:Content>

