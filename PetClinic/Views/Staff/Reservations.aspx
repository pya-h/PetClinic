<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Staff/StaffPanel.Master" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="PetClinic.Views.Staff.Reservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ReservationsContent" ContentPlaceHolderID="StaffPanelContainer" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <h1 class="text-success text-center">Manage Client Reservations</h1>
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row">
            <div class="col-md-3">
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
                    <div class="row">
                        <div class="col d-grid">
                            <asp:Button style="height: 3rem" ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-block btn-large" OnClick="btnEdit_Click" />
                        </div>
                        <div class="col d-grid">
                            <asp:Button style="height: 3rem" ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-block" OnClick="btnDelete_Click" />
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="d-grid">
                            <asp:Button ID="btnSave" style="height: 3rem" runat="server" Text="Save" CssClass="btn btn-success btn-block" OnClick="btnSave_Click" />
                        </div>
                    </div>
                    <span id="lblResult" class="mt-2" runat="server"></span>
                </form>
            </div>
            <div class="col-md-9 mt-2">
                <asp:GridView ID="gridReservations" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridReservations_SelectedIndexChanged">
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
