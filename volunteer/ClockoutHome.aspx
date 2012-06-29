<%@ Page Title="Clock Out" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="ClockoutHome.aspx.cs" Inherits="Clock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h2>Would you like to clock out as</h2><br />
    a &nbsp<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="GroupClockOut.aspx">group</asp:HyperLink>
    or an &nbsp <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="IndivClockOut.aspx">individual</asp:HyperLink>
    
    
</asp:Content>

