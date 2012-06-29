<%@ Page Title="Reset Password"  MasterPageFile="~/MasterPages/Admin.master" Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server" >
    <asp:Panel ID="PanelReset" runat="server" >
    <h1>Reset Password</h1>
    <h5>Please Enter The Username:&nbsp; <asp:TextBox runat="server" ID="txtUserName" />&nbsp;
    <asp:Button ID="btnReset" runat="server" Text="Reset" onclick="btnReset_Click" /></h5>
</asp:Panel>
<asp:Panel ID="PanelComplete" runat="server" >
<h5>Your Password Has Been Reset To: <asp:Label ID="lblPassword" runat="server" /></h5>
</asp:Panel>

</asp:Content>