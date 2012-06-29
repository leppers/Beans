<%@ Page Title="Scheduling Complete" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="ScheduleResults.aspx.cs" Inherits="ScheduleResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h2>Scheduling Successful</h2><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="SchedulingHome.aspx">Schedule another Volunteer</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Default.aspx">Home</asp:HyperLink>


</asp:Content>

