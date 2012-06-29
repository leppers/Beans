<%@ Page Title="Volunteer Search by Phone" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="WalkInVolunteer_Phone.aspx.cs" Inherits="WalkInVolunteer_Phone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <asp:Panel ID="pnlNumberLookup" runat="server" >
        <h2>Phone Number Lookup</h2><br />
        Enter your phone number into the box below<br />
        <asp:TextBox ID="txtPhoneLookup" runat="server" MaxLength="10" />            
        <asp:Button ID="btnPhoneSearch" runat="server" Text="Search" 
            onclick="btnPhoneSearch_Click" /><br />

                 
        
        <asp:GridView ID="grdPhone" runat="server" DataSourceID="srcPhone" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Visible="False" 
            onselectedindexchanged="grdPhone_SelectedIndexChanged" 
            DataKeyNames="Entity_ID" Width="732px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Volunteer ID" ReadOnly="True" 
                    SortExpression="Entity_ID" InsertVisible="False" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_LName" 
                    HeaderText="Last Name" 
                    SortExpression="Entity_Contact_LName" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="First Name" 
                    SortExpression="Entity_Contact_FName" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Contact_MName" 
                    HeaderText="Middle Name" 
                    SortExpression="Entity_Contact_MName" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                    SortExpression="Entity_Phone" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="srcPhone" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT DISTINCT Entity.Entity_ID, Entity.Entity_Contact_LName, 
                Entity.Entity_Contact_FName, Entity.Entity_Contact_MName, Entity.Entity_Phone
                 FROM Volunteer INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID
                  INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE 
                  (Entity.Entity_Phone = @txtPhone)">            
            <SelectParameters>
                <asp:ControlParameter ControlID="txtPhoneLookup" Name="txtPhone" 
                    PropertyName="Text" />
            </SelectParameters>
            
        </asp:SqlDataSource>
        
        
        
        
        Don't see your phone number in the list? Click
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="NewVolunteer.aspx">here</asp:HyperLink>
    
    </asp:Panel>
    
    <asp:Panel ID="pnlShift" runat="server" Visible="False">
    Click select for the shift you are clocking in for<br />
      <asp:Literal ID="TodayLiteral" runat="server" Visible="False" />
      <asp:Literal ID="ShiftNameLiteral" runat="server" Visible="False"></asp:Literal>
            
            
    <asp:GridView ID="grdShift" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Shift_ID" DataSourceID="srcShift" CellPadding="4" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grdShift_SelectedIndexChanged" Width="455px">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Shift_ID" HeaderText=" " 
                InsertVisible="False" ReadOnly="True" SortExpression="Shift_ID" />
            <asp:BoundField DataField="Shift_Name" HeaderText="Shift" 
                SortExpression="Shift_Name" />
            <asp:BoundField DataField="Shift_Date" HeaderText="Date" 
                SortExpression="Shift_Date" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="srcShift" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        SelectCommand="SELECT [Shift_ID], [Shift_Name], [Shift_Date] FROM [Shift] WHERE (([Shift_Date] = @Shift_Date) AND ([Shift_Name] = @Shift_Name))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TodayLiteral" Name="Shift_Date" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="ShiftNameLiteral" Name="Shift_Name" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    
    
 
   </asp:Panel> 
    
    
    
     <asp:Panel ID="pnlFields" runat="server" Visible="False">
    
        Are you serving a Community Service requirement?<br />
        (Check Yes if you are, leave unchecked if NO)<br />
        <asp:CheckBox ID="chkbxCommServ" runat="server" /><asp:Label ID="lblYes1" runat="server"
            Text="Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
        <asp:LinkButton ID="lbtnCommServ" runat="server" onclick="lbtnCommServ_Click">Next</asp:LinkButton><br />
        
        <asp:Label ID="lblClient" runat="server" Text="Are you a Bean's Cafe Client?" Visible="False" /><br />
        <asp:Label ID="lblClient2" runat="server" Text="(Check the box for Yes, leave empty for No)" Visible="False" /><br />
        
        <asp:CheckBox ID="chkbxClient" runat="server" Visible="False" /><asp:Label ID="lblYes2"
            runat="server" Text="Yes" Visible="False" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:LinkButton ID="lbtnClient" runat="server" Visible="False" 
            onclick="lbtnClient_Click">Next</asp:LinkButton><br />
        
        <asp:Button ID="btnClockIn" runat="server" Text="Clock In" 
            onclick="btnClockIn_Click" Visible="False" />
    
    
    </asp:Panel>
      
     <asp:Panel ID="Panel2" runat="server" Visible="False">
        <br />
        <h2>You have Clocked In</h2>
    </asp:Panel>  
    
</asp:Content>

