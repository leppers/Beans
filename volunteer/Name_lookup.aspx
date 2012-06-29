<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Name_lookup.aspx.cs" Inherits="Name_lookup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h1>Clock In/Out</h1><br />
    <h1>Look up Volunteer ID Number by Name</h1><br />
    <asp:Label ID="lblFname" runat="server" 
            Text="Please enter your first name" 
            AssociatedControlID="fnameBox"/>
            
    <asp:TextBox ID="fnameBox" 
        runat="server"/><br />
        
    
        
    <asp:Label ID="lblMname" runat="server" 
            Text="Please enter your middle name" 
            AssociatedControlID="middleIBox"/>
            
    <asp:TextBox ID="middleIBox" 
        runat="server" Width="36px"/>
            
    <asp:Label ID="lblLname" runat="server" 
            Text="Please enter your last name" 
            AssociatedControlID="lnameBox"/>
            
    <asp:TextBox ID="lnameBox" 
        runat="server" Width="125px"/><br />
    
    
        
    <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" /> 
    
    <asp:GridView ID="grdEntity" 
        runat="server" Visible="False" />
        
    
</asp:Content>

