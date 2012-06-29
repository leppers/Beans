<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Phone_Search.aspx.cs" Inherits="Phone_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
  
        <h2>Search By Phone Number</h2><br />Please enter your phone number:<br />
        <asp:TextBox ID="phoneNumSearch_bx" runat="server"></asp:TextBox>
        <asp:Button ID="ph_num_searchBtn" runat="server" Text="Search" 
            onclick="ph_num_searchBtn_Click" />
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="Entity_ID" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Entity_ID" HeaderText="  ID " 
                InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
            <asp:BoundField DataField="Entity_Contact_FName" 
                HeaderText="First Name" SortExpression="Entity_Contact_FName" />
            <asp:BoundField DataField="Entity_Contact_MName" 
                HeaderText="Middle Name" SortExpression="Entity_Contact_MName" />
            <asp:BoundField DataField="Entity_Contact_LName" 
                HeaderText="Last Name" SortExpression="Entity_Contact_LName" />
            <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                SortExpression="Entity_Phone" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT [Entity_ID], [Entity_Contact_FName], [Entity_Contact_MName], [Entity_Contact_LName], [Entity_Phone] FROM [Entity] WHERE ([Entity_Phone] = @Entity_Phone)">
        <SelectParameters>
            <asp:ControlParameter ControlID="phoneNumSearch_bx" Name="Entity_Phone" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
        
        
        <asp:LinkButton ID="ltnGoBack" runat="server" onclick="lbtnGoBack_Click">Go Back</asp:LinkButton>
     


</asp:Content>

