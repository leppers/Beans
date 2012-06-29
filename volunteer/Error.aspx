<%@ Page Title="Error" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Construction2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h2 style="height: 28px">We're Sorry, A Error Has Occured Please Try Again</h2>
    <h5>Please Contact The System Adminstrator</h5>
        <br />
        <asp:Image ID="imgConstruction" runat="server" ImageUrl="images/Construction Equipment.jpg" /><br />
        <asp:LinkButton ID="lbtnHome" runat="server" PostBackUrl="~/Default.aspx">Return to Home Page</asp:LinkButton>
    

</asp:Content>

