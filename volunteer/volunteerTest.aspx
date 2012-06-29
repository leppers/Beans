<%@ Page Title="Group Scheduling" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="volunteerTest.aspx.cs" Inherits="volunteerTest" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:Panel ID="Panel1" runat="server" Direction="NotSet" Visible="true">

        Schedule Date<br />
        <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
            Width="496px">
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                Height="8pt" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="12pt" ForeColor="White" Height="12pt" />
        </asp:Calendar>
        
        
        <!-- <asp:TextBox ID="txtbxDateSelect" runat="server" />
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbxDateSelect">
        </cc1:CalendarExtender><br /> 
        <asp:Button ID="btnDateSelect" runat="server" Text="Select"/> --> 
            
    </asp:Panel> 
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <asp:Literal ID="SelectedDateLiteral" runat="server"></asp:Literal><br />
        <asp:RadioButtonList ID="rblShiftSelect" runat="server">
            <asp:ListItem>Morning</asp:ListItem>
            <asp:ListItem>Afternoon</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Literal ID="rblSelectedLiteral" runat="server"></asp:Literal>
        
        <asp:Button ID="btnShiftSelect" runat="server" Text="Select" 
            onclick="btnShiftSelect_Click" /><br /> 
            
        <asp:GridView ID="grdShift" runat="server" DataSourceID="srcShift" 
            AutoGenerateColumns="False" DataKeyNames="Shift_ID" Visible="False">
            <Columns>
                <asp:BoundField DataField="Shift_ID" HeaderText="Shift_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Shift_ID" />
            </Columns>
        </asp:GridView>    
            
        <asp:SqlDataSource ID="srcShift" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT [Shift_ID] FROM [Shift] WHERE (([Shift_Date] = @Shift_Date) AND ([Shift_Name] = @Shift_Name))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Shift_Date" 
                    PropertyName="SelectedDate" Type="DateTime" />
                <asp:ControlParameter ControlID="rblShiftSelect" Name="Shift_Name" 
                    PropertyName="SelectedValue" Type="String" />
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
            CellPadding="4" DataKeyNames="Entity_ID" DataSourceID="srcContactInfo" 
            ForeColor="#333333" GridLines="None" Visible="False" 
            onselectedindexchanged="grdContactInfo_SelectedIndexChanged">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
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
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

