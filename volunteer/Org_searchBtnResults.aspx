<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="Org_searchBtnResults.aspx.cs" Inherits="Org_lookup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
    

    <h2>Search By Organization</h2><br />
        <asp:Label ID="Label1" runat="server" Text="Label">Please Select the Organization you are with:
        </asp:Label><br />
        
        <asp:DropDownList ID="ddlOrganization" runat="server" 
            DataSourceID="LinqDataSource1" DataTextField="Entity_Organization_Name" 
            DataValueField="Entity_ID">
        </asp:DropDownList>
        
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="VolunteerDatabaseDataContext" 
            Select="new (Entity_ID, Entity_Organization_Name)" 
        TableName="Entities" 
            Where="Entity_Organization_Name != @Entity_Organization_Name">
            <WhereParameters>
                <asp:Parameter DefaultValue="" Name="Entity_Organization_Name" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
            
        <br />
        <asp:Button ID="selectBtn" runat="server" Text="Select" 
        onclick="selectBtn_Click" />
        
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False">
            Enter the number of workers you are clocking in for
        </asp:Label><br />
        <asp:DetailsView ID="dtlOrg" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        
        
        <asp:GridView ID="grd_NamebyOrg" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Entity_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" onselectedindexchanged="grd_NamebyOrg_SelectedIndexChanged" 
            Visible="False">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Clock In" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Entity_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
                <asp:BoundField DataField="Entity_Organization_Name" 
                    HeaderText="Entity_Organization_Name" 
                    SortExpression="Entity_Organization_Name" />
                <asp:BoundField DataField="Volunteers_Scheduled" 
                    HeaderText="Volunteers_Scheduled" SortExpression="Volunteers_Scheduled" />
                <asp:BoundField DataField="Shift_Name" HeaderText="Shift_Name" 
                    SortExpression="Shift_Name" />
                <asp:BoundField DataField="Shift_Date" HeaderText="Shift_Date" 
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
        ProviderName="<%$ ConnectionStrings:Beans_DB_v5ConnectionString.ProviderName %>" 
        ></asp:SqlDataSource> 
        
    
        <br /><br />
        
    <!-- <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        
        SelectCommand="SELECT Entity.Entity_Organization_Name, Volunteer.Volunteers_Scheduled, 
            Volunteer.Volunteers_Worked, Shift.Shift_Name, Shift.Shift_Date FROM Shift 
            INNER JOIN Volunteer ON Shift.Shift_ID = Volunteer.Shift_ID INNER JOIN Entity 
            ON Volunteer.Entity_ID = Entity.Entity_ID WHERE Entity.Entity_ID=@Entity_ID AND Entity.Entity_Organization_Name IS NOT NULL" 
                        
        
            InsertCommand="INSERT INTO Volunteer(Entity_ID, Shift_ID, Clock_In, Volunteers_Worked)
                 VALUES (@Entity_ID, @Shift_ID, @Clock_In, @Volunteers_Worked)" 
                 
            UpdateCommand="UPDATE SET Entity_ID= @Entity_ID, Shift_ID=@Shift_ID, Clock-In=@Clock_In, Volunteers_Worked=@Volunteers_Worked" InsertCommandType="Text">
        
            
        <SelectParameters>
            <asp:ControlParameter
                Name="Entity_ID" ControlID="grd_NamebyOrg"
                PropertyName='SelectedDataKey("Entity_ID")' />
        </SelectParameters>
        
        <InsertParameters>
            <asp:Parameter Name="Entity_ID" />
            <asp:Parameter Name="Shift_ID" />
            <asp:Parameter Name="Clock_In" Type="DateTime" />
            <asp:Parameter Name="Volunteers_Worked" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="Entity_ID" />
            <asp:Parameter Name="Shift_ID" />
            <asp:Parameter Name="Clock_In" Type="DateTime" />
            <asp:Parameter Name="Volunteers_Worked" />
        </UpdateParameters>
        
    </asp:SqlDataSource> -->
        
        
        <asp:LinkButton ID="lbtnGoBack" runat="server" PostBackUrl="~/volunteer.aspx">
        Go Back</asp:LinkButton>
    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <br />
        <h2>You have Clocked In</h2>
    </asp:Panel>
</asp:Content>


