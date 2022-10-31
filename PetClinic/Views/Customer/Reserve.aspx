<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Customer/CustomerPanel.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="PetClinic.Views.Customer.Reserve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CustomerPanelContainer" runat="server">
    <div class="container-fluid">
        <div class="row text-center">
           <div class="col-md-3 mx-auto">
                <form>
                    <div class="mb-3">
                        <label for="txtPetType" class="form-label">Pet Type</label>
                        <input type="text" class="form-control" id="txtPetType" runat="server" required="required" />
                    </div>

                    <div class="mb-3">
                        <label for="txtPetType" class="form-label">Date</label>
                        <asp:TextBox ID="txtDate" class="form-control" runat="server" placeholder="yyyy/mm/dd" Textmode="Date" ReadOnly="false"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="ddlTime" class="form-label">Time</label>
                        <asp:DropDownList runat="server" class="form-control" ID="ddlTime"> 
                            <asp:ListItem>8 - 10</asp:ListItem>
                            <asp:ListItem>10 - 12</asp:ListItem>
                            <asp:ListItem>12 - 14</asp:ListItem>
                            <asp:ListItem>14 - 16</asp:ListItem>
                            <asp:ListItem>16 - 18</asp:ListItem>
                            <asp:ListItem>18 - 20</asp:ListItem>
                            <asp:ListItem>20 - 22</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="txtSymptoms" class="form-label">Symptoms</label>
                        <input type="text" class="form-control" id="txtSymptoms" runat="server" required="required"/>
                    </div>
                    <div class="mb-3">
                        <label for="txtExtraNotes" class="form-label">Extra Notes</label>
                        <textarea rows="3" class="form-control" id="txtExtraNotes" runat="server"></textarea>
                    </div>
                    <div class="row m">
                        <div class="d-grid">
                            <asp:Button ID="btnReserve" style="height: 3rem" runat="server" Text="Reserve" CssClass="btn btn-primary btn-block" OnClick="btnReserve_Click" />
                        </div>
                    </div>
                    <span id="lblResult" class="mt-2" style="color:orangered" runat="server"></span>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
