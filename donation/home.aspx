<%@ Page Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" Title="Donation Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
 <h1>Bean's Donation Home Page</h1>   
   
   
    <h2>Create a new Donation <asp:Button ID="btnNewDonation" runat="server" 
            Text="New Donation" onclick="btnNewDonation_Click" /></h2>
    
    <h2>Create a new Donor <asp:Button ID="btnNewDonor" runat="server" 
            Text="New Donor" onclick="btnNewDonor_Click" /></h2>
            
    <h2>Search for a Donation <asp:Button ID="btnSearchDonation" 
            runat="server" Text="Donation Lookup" onclick="btnSearchDonation_Click" /></h2>
    <h2>Search for a Donor <asp:Button ID="btnSearchDonor" runat="server" 
            Text="Donor Lookup" onclick="btnSearchDonor_Click" /></h2>
     
</asp:Content>

