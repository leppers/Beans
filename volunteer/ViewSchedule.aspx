<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="ViewSchedule.aspx.cs" Inherits="ViewSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" 
        GridLines="None" DataKeyNames="Entity_ID" Width="563px">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="Entity_ID" 
                HeaderText="ID" SortExpression="Entity_ID" ReadOnly="True" 
                InsertVisible="False" />
            <asp:BoundField DataField="Entity_Organization_Name" 
                HeaderText="OName" 
                SortExpression="Entity_Organization_Name" />
           
            <asp:BoundField DataField="Entity_Contact_FName" 
                HeaderText="FName" SortExpression="Entity_Contact_FName" />
            <asp:BoundField DataField="Entity_Contact_LName" 
                HeaderText="LName" SortExpression="Entity_Contact_LName" />
            <asp:BoundField DataField="Clock_In" HeaderText="In" 
                SortExpression="Clock_In" />
                <asp:BoundField DataField="Clock_Out" HeaderText="Out" 
                SortExpression="Clock_Out" />
            <asp:BoundField DataField="Volunteers_Scheduled" 
                HeaderText="Scheduled" SortExpression="Volunteers_Scheduled" />
            <asp:BoundField DataField="Volunteers_Worked" HeaderText="Worked" 
                SortExpression="Volunteers_Worked" />
            <asp:BoundField DataField="Shift_Name" HeaderText="Shift" 
                SortExpression="Shift_Name" />
            <asp:BoundField DataField="Shift_Date" HeaderText="Date" 
                SortExpression="Shift_Date" />
           
            
           
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
        
        
        
        
        
        
        
        SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Organization_Name, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Volunteer.Clock_In, Volunteer.Volunteers_Scheduled, Volunteer.Volunteers_Worked, Shift.Shift_Name, Shift.Shift_Date, Volunteer.Clock_Out FROM Volunteer INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID">
    </asp:SqlDataSource>


</asp:Content>

