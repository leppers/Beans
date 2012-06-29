<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlAddDonation.ascx.cs" Inherits="controls_WebUserControl" %>
  <asp:Table ID="donationTable" runat="server" GridLines="Vertical" Height="32px" Width="700px">
            <asp:TableRow ID="TableRow1" runat="server">
                    <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" Text="Donation ID" />
                    <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" Text="Employee ID" />
                    <asp:TableHeaderCell ID="TableHeaderCell3" runat="server" Text="Recipient ID" />
                    <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" Text="Donor ID" />
                    <asp:TableHeaderCell ID="TableHeaderCell5" runat="server" Text="Date/Time" />
               </asp:TableRow>
                <asp:TableRow ID="TableRow2" runat="server">
                
                    <asp:TableCell ID="tblCell1" runat="server">
                        <asp:TextBox ID="txtDonationID" runat="server" />
                </asp:TableCell>
                <asp:TableCell ID="tblCell5" runat="server" >
                <asp:TextBox ID="txtEmployeeID" runat="server" />
                </asp:TableCell>
                <asp:TableCell ID="tblCell2" runat="server">
                    <asp:TextBox ID="txtDonorID" runat="server" />
                </asp:TableCell>
                <asp:TableCell ID="tblCell3" runat="server">
                    <asp:TextBox ID="txtRecipientID" runat="server" />
                </asp:TableCell>
                <asp:TableCell ID="tblCell4" runat="server">
                <asp:TextBox ID="txtDateTime" runat="server" />
                </asp:TableCell>
                </asp:TableRow>
              </asp:Table>
