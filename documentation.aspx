<%@ Page Title="Documentation" Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="documenation.aspx.cs" Inherits="documenation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
   <h5> <asp:LinkButton ID="LinkButton1" runat="server" 
           onclick="LinkButton1_Click">Donation Help</asp:LinkButton></h5>
    <h5><asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" >Inventory Help</asp:LinkButton></h5>
  <h5><asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" >Volunteer Help</asp:LinkButton></h5>
</asp:Content>

