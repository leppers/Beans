<%@ Page Title="Individual Clock Out" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="IndivClockOut.aspx.cs" Inherits="IndivClockOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <asp:Panel ID="Panel1" runat="server">
    
    
    <h2>Volunteer Clock-Out</h2><br />
        <!-- <asp:DropDownList ID="ddlEntities" runat="server" 
         DataSourceID="srcddl" DataTextField="Entity_Contact_LName" 
            DataValueField="Entity_ID">
        </asp:DropDownList>
    
        <asp:Button ID="btnSelect" runat="server" Text="Select" 
            onclick="btnSelect_Click" />
            <br />
            
        <asp:SqlDataSource ID="srcddl" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Contact_LName, 
                Entity.Entity_Contact_FName, Entity.Entity_Contact_MName, 
                Entity.Entity_Phone FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = 
                Volunteer.Entity_ID WHERE (Volunteer.Clock_In IS NOT NULL) AND (
                Volunteer.Clock_Out IS NULL)"></asp:SqlDataSource>  -->
        
        
        
        <asp:GridView ID="grdIndivClockOut" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Entity_ID" DataSourceID="srcClockOut" 
            onselectedindexchanged="grdIndivClockOut_SelectedIndexChanged" 
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="596px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField SelectText="Clock Out" ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Volunteer ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
                <asp:BoundField DataField="Entity_Contact_LName" 
                    HeaderText="Last Name" SortExpression="Entity_Contact_LName" />
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="First Name" SortExpression="Entity_Contact_FName" />
                <asp:BoundField DataField="Entity_Contact_MName" 
                    HeaderText="Middle Name" SortExpression="Entity_Contact_MName" />
                <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                    SortExpression="Entity_Phone" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="srcClockOut" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Contact_LName, Entity.Entity_Contact_FName, Entity.Entity_Contact_MName, Entity.Entity_Phone FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Volunteer.Clock_In IS NOT NULL) AND (Volunteer.Clock_Out IS NULL)" 
            UpdateCommand="UPDATE Volunteer SET Entity_ID = @Entity_ID, Clock_Out = @ClockoutTime WHERE (Entity_ID = @Entity_ID)">
            <UpdateParameters>
                <asp:Parameter Name="Entity_ID" />
                <asp:Parameter Name="ClockoutTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
            
  </asp:Panel> 
  
  
   
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        
        <h2>You have clocked out</h2><br /> 
        <h2>Thankyou for your time</h2>
        
    </asp:Panel>
</asp:Content>

