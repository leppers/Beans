<%@ Page Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Title="Bean's Cafe" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<h5>Beans Home</h5>
<h5>Donation: <asp:HyperLink ID="lnkDonationHome" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/donation/" Text="Donation Home" /></h5>
<h5>Inventory: <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/inventory/" Text="Inventory Home" /> </h5>
<h5>Volunteer: <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/volunteer/" Text="Volunteer Home" /></h5>
<h5>Admin: <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/" Text="Admin Home" /></h5>
</asp:Content>

