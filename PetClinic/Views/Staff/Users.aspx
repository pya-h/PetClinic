<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/StaffPanel.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="PetClinic.Views.Staff.Users" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StaffPanelContainer" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <h1 class="text-success text-center">Manage All Users</h1>
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <form>
                    <div class="mb-3">
                        <label for="txtFullname" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="txtFullname" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="txtUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="txtUsername" required="required" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="txtPhonenumber" class="form-label">Phone Number</label>
                        <input type="number" class="form-control" id="txtPhonenumber" required="required" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="ddlGender" class="form-label">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="txtLocation" class="form-label">Location</label>
                        <input type="text" class="form-control" id="txtLocation" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="ddlUserType" class="form-label">User Type</label>
                        <asp:DropDownList ID="ddlUserType" runat="server" class="form-control">
                            <asp:ListItem>Customer</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="txtPassword" required="required" runat="server" />
                    </div>
                    <div class="row">
                        <div class="col d-grid">
                            <asp:Button ID="btnEditUser" runat="server" Text="Edit" CssClass="btn btn-warning btn-block" OnClick="btnEditUser_Click" />
                        </div>
                        <div class="col d-grid">
                            <asp:Button ID="btnDeleteUser" runat="server" Text="Delete" CssClass="btn btn-danger btn-block" OnClick="btnDeleteUser_Click" />
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="d-grid">
                            <asp:Button ID="btnSaveUser" type="button" class="btn btn-success btn-block" runat="server" Text="Save" OnClick="btnSaveUser_Click" />
                        </div>
                    </div>
                    <span id="lblResult" style="color:orangered"  class="mt-2" runat="server"></span>

                </form>
            </div>
            <div class="col-md-9">
                <asp:GridView ID="gridUsers" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridUsers_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
