<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Calendar2.aspx.cs" Inherits="Calendar2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<asp:Panel ID="pnlCalendar" runat="server">
    
    <br /><br />
    
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="278px" NextPrevFormat="ShortMonth" 
            Width="524px" onselectionchanged="Calendar1_SelectionChanged">
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
        
        
    </asp:Panel>
    
<!-- Next Panel -->
    
    <asp:Panel ID="pnlShiftSelect" runat="server" Visible="False">
               
        <asp:Literal ID="SelectedDateLiteral" runat="server"></asp:Literal>
        
        <br />
       
        <asp:RadioButtonList ID="rblShiftSelect" runat="server">
            <asp:ListItem>Morning</asp:ListItem>
            <asp:ListItem>Afternoon</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Literal ID="rblSelectedLiteral" runat="server"></asp:Literal>
        
        <asp:Button ID="btnShiftSelect" runat="server" Text="Select" 
            onclick="btnShiftSelect_Click" /><br />                   
     </asp:Panel>
     
<!-- Next Panel -->
     
    <asp:Panel ID="pnlNumberofVolunteers" runat="server" Visible="False">
        <br />
        Are you scheduling an&nbsp
        <asp:LinkButton ID="lbtnIndividual" runat="server" 
            onclick="lbtnIndividual_Click">individual</asp:LinkButton>or a&nbsp
        <asp:LinkButton ID="lbtnGroup" runat="server" onclick="lbtnGroup_Click">group</asp:LinkButton>?
        
    
    </asp:Panel>
    
<!-- Next Panel -->
     
    <asp:Panel ID="pnlIndividualSchedule" runat="server" Visible="False">
    Enter the Last Name of the Volunteer<br />
        <asp:TextBox ID="txtNameLookup" runat="server"/>
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click" /><br />
        
        <asp:GridView ID="grdIndividual_Entity" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Entity_ID" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
            Visible="False" 
            onselectedindexchanged="grdIndividual_Entity_SelectedIndexChanged" 
            Width="808px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
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
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
        <!-- <asp:RadioButtonList ID="rblCommunityService" runat="server" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList > --> 
        <asp:Button ID="btnCommunity" runat="server" Text="Select" 
            onclick="btnCommunity_Click" />       
    </asp:Panel>
<!-- Next Panel -->
    
    <asp:Panel ID="pnlBinaryField2" runat="server" Visible="False">
        <br /><asp:Label ID="Label2" runat="server" Text="Label">Is this Volunteer 
        a Bean's Cafe client?</asp:Label><br />
        (check the box for yes, leave empty for No)<br /><br />
        <asp:CheckBox ID="cbxClient" runat="server" Text="Yes" Checked="False" /><br />
        <!-- <asp:RadioButtonList ID="rblClient" runat="server" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList > -->
        <asp:Button ID="btnClient" runat="server" Text="Select" 
            onclick="btnClient_Click" />
    </asp:Panel>
<!-- Next Panel -->
    <asp:Panel ID="pnlSelect" runat="server">
    
    
        <asp:GridView ID="grdSelect" runat="server" DataSourceID="srcIndividual" Visible="False">
        </asp:GridView>        
    
        <asp:SqlDataSource ID="srcIndividual" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT [Entity_ID], [Shift_ID], [Community_Service], 
            [is_client] FROM [Volunteer]"
            
            InsertCommand="INSERT [Volunteer] ([Entity_ID],[Shift_ID],[Community_Service],[is_client]) 
               VALUES (@EntID, @ShiftID, @CommServ, @Client)">
                <InsertParameters>
                    <asp:Parameter Name="EntID" Type="Int32" />
                    <asp:Parameter Name="ShiftID" Type="Int32" />
                    <asp:Parameter Name="CommServ" Type="Byte" />
                    <asp:Parameter Name="Client" Type="Byte" />
                </InsertParameters>
            </asp:SqlDataSource>
    </asp:Panel>
    
<!-- Next Panel -->

    <asp:Panel ID="pnlGroupSchedule" runat="server">
    
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" ForeColor="#333333" 
            
            AllowPaging="True" DataKeyNames="Category_ID" Visible="True">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            
            <EditItemTemplate>
            
            </EditItemTemplate>
            
            <InsertItemTemplate>
                
            </InsertItemTemplate>
            
            <ItemTemplate>
                
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
        </asp:FormView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString2 %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Organization_Name, 
            Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Email, 
            Entity.Entity_Phone, Volunteer.Volunteer_Comments, Volunteer.Community_Service,
             Volunteer.Volunteers_Scheduled, Volunteer.is_client, Shift.Shift_Name, Shift.Shift_Date, 
             Entity.Entity_Type FROM Volunteer INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID 
             INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID WHERE (Entity.Entity_Type = 'g')
              AND (Entity.Entity_Organization_Name IS NOT NULL)"></asp:SqlDataSource>
        
        
    
    
    </asp:Panel>

   

</asp:Content>

