<%@ Page Title="Delete User" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="deleteuser.aspx.cs" Inherits="deleteuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">


  <h5>Delete User</h5>
    
  
    <h5>Select A User To Delete:</h5><asp:DropDownList ID="ddlUsernames" runat="server" AutoPostBack="True" /><br /><br />
  

  Delete related profile and roles data: <asp:CheckBox id="DeleteRelatedData" 
                                                       checked="True" runat="Server" /><br /><br />

  <asp:Button id="YesButton" Text="Yes" OnClick="YesButton_OnClick" runat="server" OnClientClick="confirm('Are You Sure?')" />
  <asp:Button id="CancelButton" Text="Cancel" OnClick="CancelButton_OnClick" runat="server" />

<asp:Label id="Msg" ForeColor="maroon" runat="server" />
</asp:Content>

