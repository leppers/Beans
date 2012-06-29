<%@ Page Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="volunteer_Default" Title="Volunteer Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    
    <h2>Volunteer Time Clock</h2><br />
    <asp:Panel ID="Panel1" runat="server">
    
    <asp:Button ID="btnClkIn" runat="server" Text="Clock In" onclick="btnClkIn_Click" />
    <asp:Button ID="btnClkOut" runat="server" Text="Clock Out" 
            onclick="btnClkOut_Click" />
    </asp:Panel>
    
    
    <asp:Panel ID="Panel2" runat="server" Visible="False">
   
    Clock in as:<br /><br />
    <asp:Button ID="btnOrganization" runat="server" Text="Group" 
        onclick="btnOrganization_Click" Visible="True" />
    
    <asp:Button ID="btnIndividual" runat="server" Text="Individual" 
        onclick="btnIndividual_Click" />
        
    </asp:Panel>




</asp:Content>

