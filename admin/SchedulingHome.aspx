<%@ Page Title="Scheduling Home" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="SchedulingHome.aspx.cs" Inherits="SchedulingHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <asp:Panel ID="pnlCalendar" runat="server">
     
    <h2>View Schedule</h2><br /><br />
    
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
     
    <asp:Panel ID="pnlView" runat="server" Visible="False">
    
        <asp:GridView ID="grdSchedule" runat="server" DataSourceID="srcSchedule" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
            GridLines="None" DataKeyNames="Entity_ID" 
            onselectedindexchanged="grdSchedule_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Organization_Name" HeaderText="Organization Name" 
                    SortExpression="Entity_Organization_Name" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="First Name" SortExpression="Entity_Contact_FName" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_LName" 
                    HeaderText="Last Name" SortExpression="Entity_Contact_LName" >
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
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        
        <asp:DetailsView ID="dtlSchedule" runat="server" OnItemUpdated="dtlScheduleUpdated"
            onItemDeleted="dtlScheduleDeleted" Height="50px" Width="416px" DataSourceID="SqlDataSource2"
            AutoGenerateRows="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="Entity_ID,Shift_ID" ForeColor="Black" 
            GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <Fields>
                <asp:TemplateField HeaderText="# of Volunteers Scheduled">
                    <EditItemTemplate>
                    <asp:TextBox id ="txtVolunteers_Scheduled" Text='<%# Bind ("Volunteers_Scheduled") %>'
                    runat="server" MaxLength="4" />
                        <asp:CompareValidator ID="cmprNum_Scheduled" runat="server" ErrorMessage="(Must Be a Number)" 
                            ControlToValidate="txtVolunteers_Scheduled" Display="Dynamic" Operator="DataTypeCheck" Type="Integer" SetFocusOnError="True"></asp:CompareValidator>
                    </EditItemTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <EditItemTemplate>
                    <asp:TextBox id ="txtVolunteer_Comments" Text='<%# Bind ("Volunteer_Comments") %>'
                    runat="server" MaxLength="50" />                        
                    </EditItemTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Volunteer ID">
                    <EditItemTemplate>
                        <asp:Label ID="lblEntity_ID" runat="server" Text='<%# Bind ("Entity_ID") %>'></asp:Label>
                    </EditItemTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Shift ID">
                    <EditItemTemplate>
                        <asp:Label ID="lblShiftID" runat="server" Text='<%# Bind ("Shift_ID") %>'></asp:Label>
                    </EditItemTemplate>                    
                </asp:TemplateField>
                
                
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        
        <asp:SqlDataSource ID="srcSchedule" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            DeleteCommand="DELETE FROM [Volunteer] WHERE [Entity_ID] = @Entity_ID AND [Shift_ID] = @Shift_ID" 
            InsertCommand="INSERT INTO [Volunteer] ([Volunteers_Scheduled], [Volunteer_Comments], [Entity_ID], [Shift_ID]) VALUES (@Volunteers_Scheduled, @Volunteer_Comments, @Entity_ID, @Shift_ID)" 
            SelectCommand="SELECT [Volunteers_Scheduled], [Volunteer_Comments], [Entity_ID], [Shift_ID] FROM [Volunteer] WHERE ([Entity_ID] = @Entity_ID) ORDER BY [Shift_ID], [Entity_ID]" 
            
            
            UpdateCommand="UPDATE [Volunteer] SET [Volunteers_Scheduled] = @Volunteers_Scheduled, [Volunteer_Comments] = @Volunteer_Comments WHERE [Entity_ID] = @Entity_ID AND [Shift_ID] = @Shift_ID">
            <SelectParameters>   
                <asp:ControlParameter ControlID="grdSchedule" Name="Entity_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            
            <DeleteParameters>
                <asp:Parameter Name="Entity_ID" Type="Int32" />
                <asp:Parameter Name="Shift_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Volunteers_Scheduled" Type="Int32" />
                <asp:Parameter Name="Volunteer_Comments" Type="String" />
                <asp:Parameter Name="Entity_ID" Type="Int32" />
                <asp:Parameter Name="Shift_ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Volunteers_Scheduled" Type="Int32" />
                <asp:Parameter Name="Volunteer_Comments" Type="String" />
                <asp:Parameter Name="Entity_ID" Type="Int32" />
                <asp:Parameter Name="Shift_ID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource> 
    
    </asp:Panel>
    
    
    
    <asp:Panel ID="pnlUpdated" runat="server" Visible="False">
        <h2>Update Successful</h2><br />
        Click 
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="SchedulingHome.aspx">here</asp:HyperLink>
        &nbsp to View Schedule<br />
    </asp:Panel>
    
    
    <asp:Panel ID="pnlDeleted" runat="server" Visible="False">
        <h2>Scheduled Volunteer has been Deleted</h2><br />
        Click 
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="SchedulingHome.aspx">here</asp:HyperLink>
        &nbsp to View Schedule<br />
    
    </asp:Panel>
    
    
    
    
    <asp:Panel ID="pnlNew" runat="server">
    
     <h2>New Scheduling</h2>    
    Do you want to schedule a
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="GroupScheduling.aspx">Group &nbsp</asp:HyperLink>
    or an
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="IndivScheduling.aspx">Individual</asp:HyperLink>?
   </asp:Panel>
</asp:Content>

