<%@ Page Title="Volunteer Calendar" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <asp:Panel ID="pnlCalendar" runat="server">
     
    <h2>View Schedule</h2><br />
    Select a date on the calendar to view schedule for that day<br /><br />
    
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="Black" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
            Width="425px" onselectionchanged="Calendar1_SelectionChanged" BorderStyle="Solid" 
                                CellSpacing="1">
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                 <TodayDayStyle BackColor="#999999" ForeColor="White" />
                 <OtherMonthDayStyle ForeColor="#999999" />
                 <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
                 <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                     Height="8pt" />
                    <TitleStyle BackColor="#333399" Font-Bold="True" 
                    Font-Size="12pt" ForeColor="White" Height="12pt" BorderStyle="Solid" />
        </asp:Calendar>
     </asp:Panel>
     
     
      
<!-- Next Panel -->
     
    <asp:Panel ID="pnlView" runat="server" Visible="False">
    <asp:Literal ID="SelectedDateLiteral" runat="server"></asp:Literal>
    <br />
    <br />
        <asp:GridView ID="grdSchedule" runat="server" DataSourceID="srcSchedule" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" DataKeyNames="Entity_ID" Width="676px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="Entity_ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Entity_ID" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Organization_Name" 
                    HeaderText="Organization Name" SortExpression="Entity_Organization_Name" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_FName" HeaderText="First Name" 
                    SortExpression="Entity_Contact_FName" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_LName" HeaderText="Last Name" 
                    SortExpression="Entity_Contact_LName" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Volunteers_Scheduled" 
                    HeaderText="# Volunteers Scheduled" SortExpression="Volunteers_Scheduled" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Shift_Name" HeaderText="Shift" 
                    SortExpression="Shift_Name" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <HeaderStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>  
        
         <asp:SqlDataSource ID="srcSchedule" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>">
        </asp:SqlDataSource>
        <br />
        <asp:LinkButton ID="lbtnReturn" runat="server" onclick="lbtnReturn_Click">Return to Calendar</asp:LinkButton>
        
        </asp:Panel>                 
                      
                 
</asp:Content>

