<%@ Page Language="C#" MasterPageFile="~/MasterPages/Inventory.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="inventory.aspx.cs" Inherits="inventory" Title="Add/Remove Inventory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div class="inner">
    <cc1:Accordion ID="Accordion" runat="server"
    HeaderCssClass="accordionHeader"
    HeaderSelectedCssClass="accordionHeaderSelected"
    ContentCssClass="accordionContent"
    AutoSize="None"
    FadeTransitions="true"
    RequireOpenedPane="false"
    SuppressHeaderPostbacks="true">
    <Panes>
    <cc1:AccordionPane ID="ACCPaneAddItem" runat="server">
    <Header><h5>Add Item</h5></Header>
    <Content>
      
    </Content>
    </cc1:AccordionPane>
    <cc1:AccordionPane ID="ACCPaneRemoveItem" runat="server">
    <Header><h5>Remove Item</h5></Header>
    <Content>
    Remove Item From Inventory
    </Content>
    </cc1:AccordionPane>
    </Panes>
    </cc1:Accordion>
    
    <asp:FormView ID="FVAddItem" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="Item_ID" DataSourceID="SQLDSAdd" GridLines="Both">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <EditItemTemplate>
            Item_ID:
            <asp:Label ID="Item_IDLabel1" runat="server" Text='<%# Eval("Item_ID") %>' />
            <br />
            Item_Name:
            <asp:TextBox ID="Item_NameTextBox" runat="server" 
                Text='<%# Bind("Item_Name") %>' />
            <br />
            Item_Description:
            <asp:TextBox ID="Item_DescriptionTextBox" runat="server" 
                Text='<%# Bind("Item_Description") %>' />
            <br />
            Category_Name:
            <asp:DropDownList ID="DropDownList1" runat="server"
                DataTextField="Category_Name" DataValueField="Category_ID" 
                DataSource='<%# Eval("Category_Name") %>'>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Item_Name:
            <asp:TextBox ID="Item_NameTextBox" runat="server" 
                Text='<%# Bind("Item_Name") %>' />
            <br />
            Item_Description:
            <asp:TextBox ID="Item_DescriptionTextBox" runat="server" 
                Text='<%# Bind("Item_Description") %>' />
            <br />
            Category_Name:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SQLDSAdd" 
                DataTextField="Category_Name" DataValueField="Category_ID" 
                DataSource='<%# Eval("Category_Name") %>'>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Item_ID:
            <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
            <br />
            Item_Name:
            <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Bind("Item_Name") %>' />
            <br />
            Item_Description:
            <asp:Label ID="Item_DescriptionLabel" runat="server" 
                Text='<%# Bind("Item_Description") %>' />
            <br />
            Category_Name:
            <asp:Label ID="Category_NameLabel" runat="server" 
                Text='<%# Bind("Category_Name") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    </asp:FormView>
    <asp:SqlDataSource ID="SQLDSAdd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
        DeleteCommand="DELETE FROM [Inventory_Item] WHERE [Item_ID] = @Item_ID" 
        InsertCommand="INSERT INTO [Inventory_Item] ([Category_ID], [Item_Name], [Item_Description]) VALUES (@Category_ID, @Item_Name, @Item_Description)" 
        SelectCommand="SELECT Inventory_Item.Item_ID, Inventory_Item.Item_Name, Inventory_Item.Item_Description, Category.Category_Name FROM Inventory_Item INNER JOIN Category ON Inventory_Item.Category_ID = Category.Category_ID" 
        UpdateCommand="UPDATE [Inventory_Item] SET [Category_ID] = @Category_ID, [Item_Name] = @Item_Name, [Item_Description] = @Item_Description WHERE [Item_ID] = @Item_ID">
        <DeleteParameters>
            <asp:Parameter Name="Item_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Category_ID" Type="Int32" />
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_Description" Type="String" />
            <asp:Parameter Name="Item_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Category_ID" Type="Int32" />
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_Description" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>


