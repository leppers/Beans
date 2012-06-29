<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="PunchClock.aspx.cs" Inherits="PunchClock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<h1>Clock In/Out</h1><br />
You want to clock in for<br />
    <asp:GridView ID="Confirm_grdView" 
        runat="server">
    </asp:GridView>
    

</asp:Content>

