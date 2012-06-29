<%@ Page Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="AddDonationItem.aspx.cs" Inherits="AddDonationItem" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="donation_id" 
        DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="donation_id" HeaderText="donation_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="donation_id" />
            <asp:BoundField DataField="employee_id" HeaderText="employee_id" 
                SortExpression="employee_id" />
            <asp:BoundField DataField="donor_id" HeaderText="donor_id" 
                SortExpression="donor_id" />
            <asp:BoundField DataField="datetime" HeaderText="datetime" 
                SortExpression="datetime" />
            <asp:BoundField DataField="recipient_id" HeaderText="recipient_id" 
                SortExpression="recipient_id" />
            <asp:BoundField DataField="totalweight" HeaderText="totalweight" 
                SortExpression="totalweight" />
            <asp:BoundField DataField="totalvalue" HeaderText="totalvalue" 
                SortExpression="totalvalue" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [donation_table] WHERE ([donation_id] = @donation_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="donation_id" QueryStringField="donation_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="item_id,donation_id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="item_id" HeaderText="item_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="item_id" />
            <asp:BoundField DataField="donation_id" HeaderText="donation_id" 
                ReadOnly="True" SortExpression="donation_id" />
            <asp:BoundField DataField="item_type" HeaderText="item_type" 
                SortExpression="item_type" />
            <asp:BoundField DataField="item_weight" HeaderText="item_weight" 
                SortExpression="item_weight" />
            <asp:BoundField DataField="item_value" HeaderText="item_value" 
                SortExpression="item_value" />
        </Columns>
    
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [donation_item_table] WHERE [item_id] = @item_id AND [donation_id] = @donation_id" 
        InsertCommand="INSERT INTO [donation_item_table] ([donation_id], [item_type], [item_weight], [item_value]) VALUES (@donation_id, @item_type, @item_weight, @item_value)" 
        SelectCommand="SELECT * FROM [donation_item_table] WHERE ([donation_id] = @donation_id)" 
        UpdateCommand="UPDATE [donation_item_table] SET [item_type] = @item_type, [item_weight] = @item_weight, [item_value] = @item_value WHERE [item_id] = @item_id AND [donation_id] = @donation_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="donation_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="item_id" Type="Int32" />
            <asp:Parameter Name="donation_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="item_type" Type="String" />
            <asp:Parameter Name="item_weight" Type="Decimal" />
            <asp:Parameter Name="item_value" Type="Decimal" />
            <asp:Parameter Name="item_id" Type="Int32" />
            <asp:Parameter Name="donation_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="donation_id" Type="Int32" />
            <asp:Parameter Name="item_type" Type="String" />
            <asp:Parameter Name="item_weight" Type="Decimal" />
            <asp:Parameter Name="item_value" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

