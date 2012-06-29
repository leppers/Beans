<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="IndivScheduling.aspx.cs" Inherits="IndivScheduling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:Panel ID="pnlCalendar" runat="server">
    
    <h2>Select a date on the Calendar to begin scheduling</h2><br />
    
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="Black" Font-Names="Times New Roman" 
            Font-Size="10pt" ForeColor="#663300" Height="220px" NextPrevFormat="FullMonth" 
            Width="517px" onselectionchanged="Calendar1_SelectionChanged" 
            DayNameFormat="Shortest" TitleFormat="Month">
                <SelectedDayStyle BackColor="#FFEDB7" ForeColor="White" />
                 <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                    Font-Size="8pt" ForeColor="#333333" Width="1%" />
                 <TodayDayStyle BackColor="#CCCC99" />
                 <OtherMonthDayStyle ForeColor="#FFC03E" />
                 <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                 <DayHeaderStyle Font-Bold="True" Font-Size="7pt" ForeColor="#333333" 
                     Height="10pt" BackColor="#D0A375" />
                    <TitleStyle BackColor="#996633" Font-Bold="True" 
                    Font-Size="13pt" ForeColor="White" Height="14pt" />
        </asp:Calendar>
        
        
    </asp:Panel>
    
<!-- Next Panel -->
    
    <asp:Panel ID="pnlShiftSelect" runat="server" Visible="False">
               
        <asp:Literal ID="SelectedDateLiteral" runat="server"></asp:Literal>
        
        <br />
        <asp:GridView ID="grdShift" runat="server" DataSourceID="srcShift" 
            AutoGenerateColumns="False" DataKeyNames="Shift_ID" 
            onselectedindexchanged="grdShift_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Shift_ID" HeaderText="Shift_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Shift_ID" />
                <asp:BoundField DataField="Shift_Name" HeaderText="Shift_Name" 
                    SortExpression="Shift_Name" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="srcShift" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT [Shift_ID], [Shift_Name] FROM [Shift] WHERE ([Shift_Date] = @Shift_Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Shift_Date" 
                    PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        
     </asp:Panel>
     
<!-- Next Panel -->
     
    <asp:Panel ID="pnlIndividualSchedule" runat="server" Visible="False">
    Enter the Last Name of the Volunteer<br />
        <asp:TextBox ID="txtNameLookup" runat="server"/>
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click" /><br />
        
        <asp:GridView ID="grdIndividual_Entity" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" DataKeyNames="Entity_ID" 
            DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None" 
            Visible="False" 
            onselectedindexchanged="grdIndividual_Entity_SelectedIndexChanged" 
            Width="808px" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Volunteer ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
                <asp:BoundField DataField="Entity_Contact_LName" HeaderText="Last Name " 
                    SortExpression="Entity_Contact_LName" />
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="First Name" SortExpression="Entity_Contact_FName" />
                <asp:BoundField DataField="Entity_Contact_MName" 
                    HeaderText="Middle Name" SortExpression="Entity_Contact_MName" />
                <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                    SortExpression="Entity_Phone" />
                <asp:BoundField DataField="Entity_Email" HeaderText="Email" 
                    SortExpression="Entity_Email" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT [Entity_ID], [Entity_Contact_FName], [Entity_Contact_LName],
             [Entity_Contact_MName], [Entity_Email], [Entity_Phone] FROM [Entity] 
             WHERE ([Entity_Contact_LName] = @Entity_Contact_LName)">
            
        
        
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNameLookup" Name="Entity_Contact_LName" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        
        
    </asp:Panel>
    
<!-- Next Panel -->
    <asp:Panel ID="pnlBinaryField1" runat="server" Visible="False">
        <br /><asp:Label ID="Label1" runat="server" Text="Label">Is this Volunteer 
        performing Community Service Requirements?</asp:Label><br />
        (Check the box for yes, leave empty for no)<br /><br />
        <asp:CheckBox ID="cbxCommServ" runat="server" Text="Yes" Checked="False" /><br />
        
        <asp:Button ID="btnCommunity" runat="server" Text="Select" 
            onclick="btnCommunity_Click" />       
    </asp:Panel>
<!-- Next Panel -->
    
    <asp:Panel ID="pnlBinaryField2" runat="server" Visible="False">
        <br /><asp:Label ID="Label2" runat="server" Text="Label">Is this Volunteer 
        a Bean's Cafe client?</asp:Label><br />
        (check the box for yes, leave empty for No)<br /><br />
        <asp:CheckBox ID="cbxClient" runat="server" Text="Yes" Checked="False" /><br />
        
        <asp:Button ID="btnClient" runat="server" Text="Select" 
            onclick="btnClient_Click" />
    </asp:Panel>
<!-- Next Panel -->
    <asp:Panel ID="pnlSelect" runat="server" Visible="False">
        If the above scheduling information is correct<br />
        click the Schedule button<br />
        <asp:Button ID="btnSchedule" runat="server" Text="Schedule" 
            onclick="btnSchedule_Click" />
    
    
        
    </asp:Panel>  

</asp:Content>

