<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Authentication/RegisterMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PetClinic.Views.Authentication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterContainer" runat="server">
    <div class="container-fluid mt-lg-5">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <h1 class="text-success text-center">Register</h1>
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row">
            <div class="col-md-3 mx-auto">
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
                        <label for="txtPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="txtPassword" required="required" runat="server" />
                    </div>
                    <div class="mt-3">
                        <div class="d-grid">
                            <asp:Button ID="btnRegister" type="button" class="btn btn-success btn-block" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                    <span id="lblResult" style="color:orangered"  class="mt-2" runat="server"></span>

                </form>
            </div>
        </div>
    </div>
</asp:Content>
