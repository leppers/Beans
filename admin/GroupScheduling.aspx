<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="GroupScheduling.aspx.cs" Inherits="GroupScheduling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Direction="NotSet" Visible="true">

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
    
    <asp:Panel ID="Panel2" runat="server" Visible="False">
    
        <asp:Literal ID="SelectedDateLiteral" runat="server"></asp:Literal><br /><br />
        
        <asp:GridView ID="grdShift" runat="server" AutoGenerateColumns="False" 
            DataSourceID="srcShift" 
            onselectedindexchanged="grdShift_SelectedIndexChanged" Width="153px" 
            DataKeyNames="Shift_ID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Shift_Name" HeaderText="Shift" 
                    SortExpression="Shift_Name" />
                <asp:BoundField DataField="Shift_ID" HeaderText="Shift ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Shift_ID" />
            </Columns>
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="srcShift" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            
            
            SelectCommand="SELECT [Shift_Name], [Shift_ID] FROM [Shift] WHERE ([Shift_Date] = @Shift_Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Shift_Date" 
                    PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
            
                      
    
    </asp:Panel>
   <br /><br />
   
    <asp:Panel ID="Panel3" runat="server" Visible="False">
        
        <br />
        Volunteer Organization Name
    
        <asp:DropDownList ID="ddlOrgName" runat="server" 
                DataSourceID="LinqDataSource1" DataTextField="Entity_Organization_Name" 
                DataValueField="Entity_ID">
        </asp:DropDownList>
        
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="VolunteerDatabaseDataContext" 
            Select="new (Entity_ID, Entity_Organization_Name)" 
            TableName="Entities">
        </asp:LinqDataSource>
        
        <asp:Button ID="btnSelect" runat="server" Text="Select" 
            onclick="btnSelect_Click" />
   
    
    
    
        <asp:GridView ID="grdContactInfo" runat="server" AutoGenerateColumns="False" 
            CellPadding="2" DataKeyNames="Entity_ID" DataSourceID="srcContactInfo" 
            ForeColor="Black" GridLines="None" Visible="False" 
            onselectedindexchanged="grdContactInfo_SelectedIndexChanged" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Entity_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="Entity_Contact_FName" SortExpression="Entity_Contact_FName" />
                <asp:BoundField DataField="Entity_Contact_LName" 
                    HeaderText="Entity_Contact_LName" SortExpression="Entity_Contact_LName" />
                <asp:BoundField DataField="Entity_Email" HeaderText="Entity_Email" 
                    SortExpression="Entity_Email" />
                <asp:BoundField DataField="Entity_Phone" HeaderText="Entity_Phone" 
                    SortExpression="Entity_Phone" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        <br />
        <asp:Label ID="lblInstruct" runat="server" Text="Click Select 
            if the Contact information is correct" Visible="False"></asp:Label>
        <asp:SqlDataSource ID="srcContactInfo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT [Entity_ID], [Entity_Contact_FName], [Entity_Contact_LName], [Entity_Email], [Entity_Phone] FROM [Entity] WHERE ([Entity_ID] = @Entity_ID AND [Entity_Organization_Name] IS NOT NULL)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlOrgName" Name="Entity_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
     </asp:Panel> 
       
    <asp:Panel ID="Panel4" runat="server" Visible="False">  
         <br />
            Number of Workers            
        <asp:TextBox ID="txtNumberofWorkers" runat="server" CausesValidation="True" MaxLength="10" />
        
        <asp:RequiredFieldValidator ID="reqNumWorker" runat="server" 
            ErrorMessage="(Required)" ControlToValidate="txtNumberofWorkers"/>
            
        <asp:CompareValidator ID="compvalNumWork" runat="server" ErrorMessage="(Must be a Number)" ControlToValidate="txtNumberofWorkers" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
        <br /><asp:Button ID="btnNumWork" runat="server" Text="Select" 
             onclick="btnNumWork_Click" />
        <br /><br />
    </asp:Panel>
    <asp:Panel ID="Panel5" runat="server" Visible="False">
    
        Comments:<br />
        <asp:TextBox ID="txtComments" runat="server" MaxLength="50" Height="73px" 
            Width="247px" TextMode="SingleLine"></asp:TextBox>
            <br />
            <asp:Button ID="btnSchedule" runat="server" Text="Schedule" 
            onclick="btnSchedule_Click" /><br />
    </asp:Panel>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        InsertCommand="INSERT INTO Volunteer(Entity_ID, Shift_ID, Volunteers_Scheduled, Volunteer_Comments) VALUES (@EntID, @ShiftID, @VolSchedule, @VolComment)" 
        SelectCommand="SELECT Entity.Entity_ID, Shift.Shift_ID, Shift.Shift_Name, Shift.Shift_Date, Volunteer.Volunteers_Scheduled, Volunteer.Volunteer_Comments FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID">
        <InsertParameters>
            <asp:Parameter Name="EntID" />
            <asp:Parameter Name="ShiftID" />
            <asp:Parameter Name="VolSchedule" />
            <asp:Parameter Name="VolComment" />
        </InsertParameters>
    </asp:SqlDataSource>
    
</asp:Content>

