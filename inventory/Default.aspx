 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inventory.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:Button ID="btnAddPIC" runat="server" Text="Add Inventory" 
        onclick="btnAddPIC_Click" />
    <asp:Button ID="btnSearchPic" runat="server" Text="Search Inventory" 
        onclick="btnSearchPic_Click" />

</asp:Content>

