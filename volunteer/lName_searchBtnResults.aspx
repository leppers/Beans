<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="lName_searchBtnResults.aspx.cs" Inherits="lName_searchBtnResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <h2>Search By Last Name</h2><br />Please enter your Last Name:<br />
        <asp:TextBox ID="lastNameSearch_bx" runat="server"></asp:TextBox>
        <asp:Button ID="lName_searchBtn" runat="server" Text="Search" onclick="lName_searchBtn_Click" 
              />
        <br />
        
        <asp:GridView ID="grdLname" runat="server" DataSourceID="SqlDataSource1" 
            Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None" 
        AllowPaging="True" onselectedindexchanged="grdLname_SelectedIndexChanged" 
        AutoGenerateColumns="False" DataKeyNames="Entity_Contact_LName">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Entity_Contact_LName" 
                    HeaderText="Last Name" ReadOnly="True" 
                    SortExpression="Entity_Contact_LName" />
                <asp:BoundField DataField="Entity_Contact_FName" 
                    HeaderText="First Name" ReadOnly="True" 
                    SortExpression="Entity_Contact_FName" />
                <asp:BoundField DataField="Entity_Contact_MName" 
                    HeaderText="Middle Name" ReadOnly="True" 
                    SortExpression="Entity_Contact_MName" />
                <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                    ReadOnly="True" SortExpression="Entity_Phone" />
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
        ProviderName="<%$ ConnectionStrings:Beans_DB_v5ConnectionString.ProviderName %>"></asp:SqlDataSource>
        
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        DataSourceID="SqlDataSource2" AutoGenerateRows="False" Visible="False" 
        DefaultMode="Insert" CellPadding="4" ForeColor="#333333" GridLines="None" 
        DataKeyNames="Entity_ID">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="Entity_ID" 
                HeaderText="ID" ReadOnly="True" 
                SortExpression="Entity_ID" InsertVisible="False" />
            <asp:BoundField DataField="Entity_Contact_FName" 
                HeaderText="First Name" 
                SortExpression="Entity_Contact_FName" />
            <asp:BoundField DataField="Entity_Contact_MName" 
                HeaderText="Middle Name" 
                SortExpression="Entity_Contact_MName" />
            <asp:BoundField DataField="Entity_Contact_LName" 
                HeaderText="Last Name" SortExpression="Entity_Contact_LName" />
            <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                SortExpression="Entity_Phone" />
            <asp:CommandField InsertText="Clock In" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:DetailsView>
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        DeleteCommand="DELETE FROM [Entity] WHERE [Entity_ID] = @Entity_ID" 
        InsertCommand="INSERT INTO [Entity] ([Entity_Contact_FName], [Entity_Contact_MName], [Entity_Contact_LName], [Entity_Phone]) VALUES (@Entity_Contact_FName, @Entity_Contact_MName, @Entity_Contact_LName, @Entity_Phone)" 
        SelectCommand="SELECT [Entity_ID], [Entity_Contact_FName], [Entity_Contact_MName], [Entity_Contact_LName], [Entity_Phone] FROM [Entity] WHERE ([Entity_Contact_LName] = @Entity_Contact_LName)" 
        UpdateCommand="UPDATE [Entity] SET [Entity_Contact_FName] = @Entity_Contact_FName, [Entity_Contact_MName] = @Entity_Contact_MName, [Entity_Contact_LName] = @Entity_Contact_LName, [Entity_Phone] = @Entity_Phone WHERE [Entity_ID] = @Entity_ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="grdLname" Name="Entity_Contact_LName" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Entity_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Entity_Contact_FName" Type="String" />
            <asp:Parameter Name="Entity_Contact_MName" Type="String" />
            <asp:Parameter Name="Entity_Contact_LName" Type="String" />
            <asp:Parameter Name="Entity_Phone" Type="String" />
            <asp:Parameter Name="Entity_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Entity_Contact_FName" Type="String" />
            <asp:Parameter Name="Entity_Contact_MName" Type="String" />
            <asp:Parameter Name="Entity_Contact_LName" Type="String" />
            <asp:Parameter Name="Entity_Phone" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
        
        <asp:LinkButton ID="lbtnGoBack" runat="server" onclick="lbtnGoBack_Click">Go Back</asp:LinkButton>
    




</asp:Content>

