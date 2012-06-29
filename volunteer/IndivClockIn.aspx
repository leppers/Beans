<%@ Page Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="IndivClockIn.aspx.cs" Inherits="IndivClockIn" Title="Individual Clock In" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div class="inner">


    <asp:Panel ID="pnlHome" runat="server">
        <h2>Were you Scheduled to work today?</h2>
        
        <br />
        
        <asp:LinkButton ID="lbtnYes" runat="server" onclick="lbtnYes_Click">Yes</asp:LinkButton>
         <asp:HyperLink ID="hlnkNO" runat="server" NavigateUrl="WalkinVolunteer.aspx">No</asp:HyperLink>
    </asp:Panel>

    <asp:Panel ID="pnlSearch" runat="server" Visible="False">
            <h2>Clock-In [Individual] Volunteer Search</h2><br />
    
            Search By:<br />
            <asp:DropDownList ID="ddlSearchSelection" runat="server" 
                            AutoPostBack="True">
                        <asp:ListItem>Select Option</asp:ListItem>                        
                        <asp:ListItem>Lastname</asp:ListItem>
                        <asp:ListItem>PhoneNumber</asp:ListItem>
            </asp:DropDownList>
    
        <asp:Button ID="btnSelectLookup" runat="server" Text="Search" onclick="btnSelectLookup_Click" />
    
    </asp:Panel>
    
    
    
<!-- Next Panel -->     
    
    <asp:Panel ID="pnlNameLookup" runat="server" Visible="False">
        
        <h2>Name Lookup</h2><br />
        Enter your LAST Name into the box below<br />
        <asp:TextBox ID="txtNameLookup" runat="server" MaxLength="50" CausesValidation="True" />
            
        <asp:Button ID="btnNameSearch" runat="server" Text="Search" 
            onclick="btnNameSearch_Click" /><br />
            
            <asp:RegularExpressionValidator ID="regExpNameLookup" runat="server" ErrorMessage="(Invalid Entry)" 
                ControlToValidate="txtNameLookup" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                 SetFocusOnError="True" Display="Dynamic" />
        
        <asp:GridView ID="grdLastName" runat="server" DataSourceID="srcName" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Width="799px" DataKeyNames="Entity_ID" Visible="False" 
            onselectedindexchanged="grdLastName_SelectedIndexChanged">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField SelectText="Clock In" ShowSelectButton="True" />
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
        
        
        <asp:SqlDataSource ID="srcName" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Contact_LName, Entity.Entity_Contact_FName,
                 Entity.Entity_Contact_MName, Entity.Entity_Phone FROM Entity INNER JOIN Volunteer ON 
                 Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID
                  WHERE (Entity.Entity_Contact_LName LIKE '%' + @txtName + '%')" 
            
            UpdateCommand="UPDATE Volunteer SET Entity_ID = @Entity_ID, Clock_In = @ClockInTime 
                WHERE (Entity_ID = @Entity_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNameLookup" Name="txtName" 
                    PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Entity_ID" />
                <asp:Parameter Name="ClockInTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <br />
        <br />
        Don't see your Name in the list? Click
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="WalkinVolunteer.aspx">here</asp:HyperLink>
    
    </asp:Panel>
    
    
    
    
<!--   Next Panel -->



    <asp:Panel ID="pnlNumberLookup" runat="server" Visible="False">
        <h2>Phone Number Lookup</h2><br />
        Enter your phone number into the box below<br />
        <asp:TextBox ID="txtPhoneLookup" runat="server" MaxLength="10" />            
        <asp:Button ID="btnPhoneSearch" runat="server" Text="Search" 
            onclick="btnPhoneSearch_Click" /><br />

                 
        
        <asp:GridView ID="grdPhone" runat="server" DataSourceID="srcPhone" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Visible="False" 
            onselectedindexchanged="grdPhone_SelectedIndexChanged" 
            DataKeyNames="Entity_ID">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Entity_ID" ReadOnly="True" 
                    SortExpression="Entity_ID" InsertVisible="False" />
                <asp:BoundField DataField="Entity_Contact_LName" 
                    HeaderText="Entity_Contact_LName" 
                    SortExpression="Entity_Contact_LName" />
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="Entity_Contact_FName" 
                    SortExpression="Entity_Contact_FName" />
                <asp:BoundField DataField="Entity_Contact_MName" 
                    HeaderText="Entity_Contact_MName" 
                    SortExpression="Entity_Contact_MName" />
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
        
        <asp:SqlDataSource ID="srcPhone" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Contact_LName, Entity.Entity_Contact_FName, Entity.Entity_Contact_MName, Entity.Entity_Phone FROM Volunteer INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Entity.Entity_Phone = @txtPhone)" 
            
            UpdateCommand="UPDATE Volunteer SET Entity_ID =@Entity_ID, Clock_In = @ClockInTime WHERE (Entity_ID = @Entity_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtPhoneLookup" Name="txtPhone" 
                    PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Entity_ID" />
                <asp:Parameter Name="ClockInTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        
        
        
        Don't see your phone number in the list? Click
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="WalkinVolunteer.aspx">here</asp:HyperLink>
    
    </asp:Panel>
        
    
    
    
    <asp:Panel ID="pnlClockin" runat="server" Visible="False">
        <h2>You Have Clocked In</h2>
    
    
    </asp:Panel>  
    
    
</div>
</asp:Content>

