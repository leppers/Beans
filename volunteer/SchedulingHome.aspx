<%@ Page Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="SchedulingHome.aspx.cs" Inherits="volunteer_Default" Title="Scheduling Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <h2>Volunteer Scheduling</h2><br />
    Do you want to schedule a
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="GroupScheduling.aspx">Group</asp:HyperLink>
    or an
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="IndivScheduling.aspx">Individual</asp:HyperLink>?
   

</asp:Content>

