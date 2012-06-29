<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Clock.aspx.cs" Inherits="Clock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h1>Clock in/out</h1>
    <br />
    Please enter your Volunteer ID Number:
    <asp:TextBox ID="textBox1" 
        runat="server"/>
    <asp:CompareValidator ID="reqEntity_ID" 
        runat="server" 
        ErrorMessage="(Entry Must be a Number)" Font-Bold="True" 
        ControlToValidate="textBox1" Type="Integer" SetFocusOnError="True"></asp:CompareValidator>   
    <asp:Button ID="Btn1"
         runat="server"
         Text="Submit" PostBackUrl="~/PunchClock.aspx" onclick="Btn1_Click"  />
    <br />
    <br />
    <asp:HyperLink ID="Hlink1" runat="server" NavigateUrl="Name_lookup.aspx">Don't know your Volunteer ID Number?</asp:HyperLink>
    <asp:GridView ID="Confirm_grdView" runat="server" Visible="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView><br />
    <asp:Label ID="Label1" runat="server" Text="Is this correct?" Visible="False"/><br />
    <asp:Button ID="btnYes" runat="server" Text="Yes" Visible="False" />
    <asp:Button ID="btnNo" runat="server" Text="No" PostBackUrl="~/Clock.aspx" 
        Visible="False" />
    
    
    
</asp:Content>

