<%@ Page Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="Donation" Title="Donation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="donation_id" 
        DataSourceID="SqlDataSource2" Width="790px">
        <EditItemTemplate>
            donation_id:
            <asp:Label ID="donation_idLabel1" runat="server" 
                Text='<%# Eval("donation_id") %>' />
            <br />
            employee_id:
            <asp:TextBox ID="employee_idTextBox" runat="server" 
                Text='<%# Bind("employee_id") %>' />
            <br />
            donor_id:
            <asp:TextBox ID="donor_idTextBox" runat="server" 
                Text='<%# Bind("donor_id") %>' />
            <br />
            datetime:
            <asp:TextBox ID="datetimeTextBox" runat="server" 
                Text='<%# Bind("datetime") %>' />
            <br />
            recipient_id:
            <asp:TextBox ID="recipient_idTextBox" runat="server" 
                Text='<%# Bind("recipient_id") %>' />
            <br />
            totalweight:
            <asp:TextBox ID="totalweightTextBox" runat="server" 
                Text='<%# Bind("totalweight") %>' />
            <br />
            totalvalue:
            <asp:TextBox ID="totalvalueTextBox" runat="server" 
                Text='<%# Bind("totalvalue") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            employee_id:<asp:TextBox ID="employee_idTextBox" runat="server" 
                Text='<%# Bind("employee_id") %>' />
            &nbsp;donor_id:
            <asp:TextBox ID="donor_idTextBox" runat="server" 
                Text='<%# Bind("donor_id") %>' />
            &nbsp;datetime:
            <asp:TextBox ID="datetimeTextBox" runat="server" 
                Text='<%# Bind("datetime") %>' />
            &nbsp;recipient_id:
            <asp:TextBox ID="recipient_idTextBox" runat="server" 
                Text='<%# Bind("recipient_id") %>' />
            &nbsp;totalweight:
            <asp:TextBox ID="totalweightTextBox" runat="server" 
                Text='<%# Bind("totalweight") %>' />
            &nbsp;totalvalue:
            <asp:TextBox ID="totalvalueTextBox" runat="server" 
                Text='<%# Bind("totalvalue") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            donation_id:
            <asp:Label ID="donation_idLabel" runat="server" 
                Text='<%# Eval("donation_id") %>' />
            <br />
            employee_id:
            <asp:Label ID="employee_idLabel" runat="server" 
                Text='<%# Bind("employee_id") %>' />
            <br />
            donor_id:
            <asp:Label ID="donor_idLabel" runat="server" Text='<%# Bind("donor_id") %>' />
            <br />
            datetime:
            <asp:Label ID="datetimeLabel" runat="server" Text='<%# Bind("datetime") %>' />
            <br />
            recipient_id:
            <asp:Label ID="recipient_idLabel" runat="server" 
                Text='<%# Bind("recipient_id") %>' />
            <br />
            totalweight:
            <asp:Label ID="totalweightLabel" runat="server" 
                Text='<%# Bind("totalweight") %>' />
            <br />
            totalvalue:
            <asp:Label ID="totalvalueLabel" runat="server" 
                Text='<%# Bind("totalvalue") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>

    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [donation_table] WHERE [donation_id] = @donation_id" 
        InsertCommand="INSERT INTO [donation_table] ([employee_id], [donor_id], [datetime], [recipient_id], [totalweight], [totalvalue]) VALUES (@employee_id, @donor_id, @datetime, @recipient_id, @totalweight, @totalvalue)" 
        SelectCommand="SELECT * FROM [donation_table]" 
        UpdateCommand="UPDATE [donation_table] SET [employee_id] = @employee_id, [donor_id] = @donor_id, [datetime] = @datetime, [recipient_id] = @recipient_id, [totalweight] = @totalweight, [totalvalue] = @totalvalue WHERE [donation_id] = @donation_id">
        <DeleteParameters>
            <asp:Parameter Name="donation_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="employee_id" Type="Int32" />
            <asp:Parameter Name="donor_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="datetime" />
            <asp:Parameter Name="recipient_id" Type="Int32" />
            <asp:Parameter Name="totalweight" Type="Decimal" />
            <asp:Parameter Name="totalvalue" Type="Decimal" />
            <asp:Parameter Name="donation_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="employee_id" Type="Int32" />
            <asp:Parameter Name="donor_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="datetime" />
            <asp:Parameter Name="recipient_id" Type="Int32" />
            <asp:Parameter Name="totalweight" Type="Decimal" />
            <asp:Parameter Name="totalvalue" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>

    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="item_id,donation_id" DataSourceID="SqlDataSource1" 
        RowHeaderColumn="item_id" ShowFooter="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [donation_item_table] WHERE [item_id] = @item_id AND [donation_id] = @donation_id" 
        InsertCommand="INSERT INTO [donation_item_table] ([donation_id], [item_type], [item_description], [item_weight], [item_value]) VALUES (@donation_id, @item_type, @item_description, @item_weight, @item_value)" 
        SelectCommand="SELECT * FROM [donation_item_table] WHERE ([donation_id] = @donation_id)" 
        
        UpdateCommand="UPDATE [donation_item_table] SET [item_type] = @item_type, [item_description] = @item_description, [item_weight] = @item_weight, [item_value] = @item_value WHERE [item_id] = @item_id AND [donation_id] = @donation_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="FormView1" Name="donation_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="item_id" Type="Int32" />
            <asp:Parameter Name="donation_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="item_type" Type="String" />
            <asp:Parameter Name="item_description" Type="String" />
            <asp:Parameter Name="item_weight" Type="Decimal" />
            <asp:Parameter Name="item_value" Type="Decimal" />
            <asp:Parameter Name="item_id" Type="Int32" />
            <asp:Parameter Name="donation_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="donation_id" Type="Int32" />
            <asp:Parameter Name="item_type" Type="String" />
            <asp:Parameter Name="item_description" Type="String" />
            <asp:Parameter Name="item_weight" Type="Decimal" />
            <asp:Parameter Name="item_value" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

