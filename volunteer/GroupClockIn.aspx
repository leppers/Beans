<%@ Page Title="Group Clock In" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="GroupClockIn.aspx.cs" Inherits="GroupClockIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
    

    <h2>Search By Organization</h2><br />
        <asp:Label ID="Label1" runat="server" Text="Label">Please Select the Organization you are with: </asp:Label><br />
        
        <asp:DropDownList ID="ddlOrganization" runat="server" 
            DataSourceID="LinqDataSource1" DataTextField="Entity_Organization_Name" 
            DataValueField="Entity_ID">
        </asp:DropDownList>
        
            </asp:Label><asp:Literal ID="TodayLiteral" runat="server" Visible="False" />
            
            <asp:Button ID="selectBtn" runat="server" Text="Select" 
        onclick="selectBtn_Click" />
        
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="VolunteerDatabaseDataContext" 
            Select="new (Entity_Organization_Name, Entity_ID)" TableName="Entities" 
            
            Where="Entity_Organization_Name != @Entity_Organization_Name &amp;&amp; Entity_Type == @Entity_Type" > 
            
            <WhereParameters>
                <asp:Parameter DefaultValue="NULL" Name="Entity_Organization_Name" 
                    Type="String" />
                
                <asp:Parameter DefaultValue="g" Name="Entity_Type" Type="String" />
                
            </WhereParameters>
            
        </asp:LinqDataSource>
        
        <asp:GridView ID="grdNamebyOrg" runat="server" DataSourceID="srcGrdNamebyOrg" 
            AutoGenerateColumns="False" DataKeyNames="Entity_ID" 
            onselectedindexchanged="grdNamebyOrg_SelectedIndexChanged" CellPadding="4" 
            ForeColor="#333333" GridLines="None" Width="604px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Volunteer ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Entity_Organization_Name" 
                    HeaderText="Organization Name" 
                    SortExpression="Entity_Organization_Name" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Volunteers_Scheduled" 
                    HeaderText="Number Scheduled" SortExpression="Volunteers_Scheduled" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Shift_Name" HeaderText="Shift" 
                    SortExpression="Shift_Name" >
                <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Shift_Date" HeaderText="Date" 
                    SortExpression="Shift_Date" >
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
        
        
        <asp:SqlDataSource ID="srcGrdNamebyOrg" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Organization_Name, 
            Volunteer.Volunteers_Scheduled, Shift.Shift_Name, Shift.Shift_Date FROM Entity 
            INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift 
            ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Entity.Entity_ID = @orgName) AND 
            (Shift.Shift_Date = @today)" 
            UpdateCommand="UPDATE Volunteer SET Entity_ID =@Entity_ID, Clock_In = @ClockinTime, 
            Volunteers_Worked = @NumWorked WHERE (Entity_ID = @Entity_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlOrganization" Name="orgName" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TodayLiteral" Name="today" 
                    PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Entity_ID" />
                <asp:Parameter Name="ClockinTime" />
                <asp:Parameter Name="NumWorked" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <br />
        
        <asp:Label ID="lblNumWorkers" runat="server" 
            Text="Enter the number of workers you are clocking in" Visible="False"/><br />
        <asp:TextBox ID="txtNumWorkers" runat="server" MaxLength="4" 
            CausesValidation="True" Visible="False"/>
        <asp:RegularExpressionValidator ID="regExpNumWork" runat="server" 
            ErrorMessage="(Must be a number)" ControlToValidate="txtNumWorkers" 
            ValidationExpression="^[1-9s]{1,4}$" Display="Dynamic"></asp:RegularExpressionValidator>      
        <asp:CompareValidator ID="cmprTextbox" runat="server" ErrorMessage="(Must be a number)"
             ControlToValidate="txtNumWorkers" Type="Integer" SetFocusOnError="True" 
            Operator="DataTypeCheck" Display="Dynamic"/><br />
             
        <asp:Button ID="btnClockIn" runat="server" Text="Clock In" 
            onclick="btnClockIn_Click" Visible="False" /><br /> <br />    
    
        
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Default.aspx">Go Back</asp:HyperLink>
    
    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <br />
        <h2>You have Clocked In</h2>
    </asp:Panel>
</asp:Content>


