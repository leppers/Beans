<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="inventory-items.aspx.cs" Inherits="inventory_items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h5>Manange Inventory Items</h5>

    <asp:GridView ID="GV_Item" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" DataKeyNames="Item_ID" 
    DataSourceID="ItemDataSource" ShowFooter="True" 
        CellSpacing="1" Width="700px" onrowediting="btnEdit_RowEditing" 
        onrowupdating="btnUpdate_RowUpdating" AllowPaging="True" PageSize="20" 
        onrowdeleting="btnDelete_Click" >
        
        <Columns>
            
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" ></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" 
                        CommandName="Update"  Text="Update" ></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" 
                        OnClientClick = "return confirm('Are you sure you want to delete?');" 
                       ></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                  &nbsp;<asp:LinkButton ID="lnkbtnAdd" runat="server" CausesValidation="False" 
                        CommandName="Insert" Text="Add" onclick="lnkbtnAdd_Click" />
                </FooterTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item ID" InsertVisible="False" Visible="false" 
                SortExpression="Item_ID">
                <EditItemTemplate>
                    <asp:Label ID="lblEditItemID" runat="server" Text='<%# Eval("Item_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("Item_ID") %>' CommandName="Select"></asp:LinkButton>
                </ItemTemplate>
                 <FooterTemplate>
                  
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Name" SortExpression="Item_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditItemName" runat="server" Text='<%# Bind("Item_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Label2" runat="server" Text='<%# Eval("Item_Name") %>' CommandName="Select"> </asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtItemName" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Description" 
                SortExpression="Item_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditItemDesc" runat="server" 
                        Text='<%# Bind("Item_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Item_Description") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="txtItemDesc" runat="server"  />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Name" SortExpression="Category_Name">
                <EditItemTemplate>
                    <asp:DropdownList ID="ddlEditCategory" runat="server"
                        DataSourceID="CategoryDataSource" DataTextField="Category_Name" 
                        DataValueField="Category_ID" AppendDataBoundItems="True"  >
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="CategoryDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                        SelectCommand="SELECT [Category_ID], [Category_Name] FROM [Category]">
                    </asp:SqlDataSource>
                    <asp:Label ID="Required" runat="server" Text="Required" Visible="false" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Category_Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                
                    <asp:DropdownList ID="ddlCategory" runat="server" 
                        DataSourceID="CategoryDataSource" DataTextField="Category_Name" 
                        DataValueField="Category_ID"  />
                    <asp:SqlDataSource ID="CategoryDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                        SelectCommand="SELECT [Category_ID], [Category_Name] FROM [Category]">
                    </asp:SqlDataSource>
                </FooterTemplate>
            </asp:TemplateField>
         
        </Columns>
     
       
     </asp:GridView>
    

    <asp:SqlDataSource ID="ItemDataSource" runat="server" 
        ConflictDetection="OverwriteChanges" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
        DeleteCommand="DELETE FROM [Inventory_Item] WHERE [Item_ID] = @original_Item_ID " 
        InsertCommand="INSERT INTO [Inventory_Item] ([Item_Name], [Item_Description], [Category_ID]) VALUES (@Item_Name, @Item_Description, @Category_ID)" 
        
        SelectCommand="SELECT Inventory_Item.Item_ID, Inventory_Item.Item_Name, Inventory_Item.Item_Description, Category.Category_Name FROM Inventory_Item INNER JOIN Category ON Inventory_Item.Category_ID = Category.Category_ID" 
        >
        <DeleteParameters>
            <asp:Parameter Name="original_Item_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_Description" Type="String" />
            <asp:Parameter Name="Category_ID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    
<h5>Associated Units</h5>
    <br />
    <asp:Panel ID="UnitPanel" runat="server">
        <asp:GridView ID="GV_Unit" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="Unit_ID" Width="800px"
            DataSourceID="UnitDataSource" AllowPaging="True" ShowFooter="True">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:LinkButton ID="lnkbtnAdd" runat="server" CausesValidation="False" 
                        CommandName="Insert" Text="Add" onclick="lnkbtnAdd_Click1" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Unit_ID" HeaderText="Unit ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Unit_ID" />
                <asp:TemplateField HeaderText="Item Name" SortExpression="Item_Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unit Name" SortExpression="Unit_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Unit_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Unit_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtUnitName" runat="server"  Text='<%# Bind("Unit_Name") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unit Weight" SortExpression="Unit_Weight">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Unit_Weight") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Unit_Weight") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                     <asp:TextBox ID="txtUnitWeight" runat="server" Text='<%# Bind("Unit_Weight") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unit Description" 
                    SortExpression="Unit_Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("Unit_Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Unit_Description") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtUnitDescription" runat="server" 
                            Text='<%# Bind("Unit_Description") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No Units Found For This Item<br />
               <asp:LinkButton ID="lnkbtnAddNewUnit" runat="server" CausesValidation="False" 
                        CommandName="Insert" Text="Add" onclick="lnkBtnPanel_Click" Visible="false" />
                &nbsp;
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:Panel ID="PanelAddUnit" runat="server" Visible="false">
            <asp:FormView ID="FV_AddItem" runat="server" DataKeyNames="Unit_ID" 
                DataSourceID="FormViewSqlDataSource" DefaultMode="Insert" >
               
             
                <InsertItemTemplate>
                <table>
                <tr>
                <th>Item_ID</th><th>Item_Name</th><th>Unit_Name</th><th>Unit_Description</th><th>Unit_Weight</th>
                </tr>
                <tr>
                <td><asp:Label ID="Item_IDTextBox" runat="server" Text='<%# Bind("Item_ID") %>' /></td>
                <td><asp:Label ID="Item_NameTextBox" runat="server" 
                        Text='<%# Bind("Item_Name") %>' /></td>
                
                <td><asp:TextBox ID="Unit_NameTextBox" runat="server" 
                        Text='<%# Bind("Unit_Name") %>' /></td>
                <td><asp:TextBox ID="Unit_DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Unit_Description") %>' /></td>
                <td><asp:TextBox ID="Unit_WeightTextBox" runat="server" 
                        Text='<%# Bind("Unit_Weight") %>' /></td>
                </tr>
                </table>
                 <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Add" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                             
            </asp:FormView>
                
            <asp:SqlDataSource ID="FormViewSqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
              
                
                InsertCommand="INSERT INTO [Unit] ([Item_ID], [Unit_Name], [Unit_Weight], [Unit_Description]) VALUES (@Item_ID, @Unit_Name, @Unit_Weight, @Unit_Description)" 
                SelectCommand="SELECT Inventory_Item.Item_Name, Unit.* FROM Inventory_Item INNER JOIN Unit ON Inventory_Item.Item_ID = Unit.Item_ID Where Unit.Item_ID = @ItemID" >
                <SelectParameters>
                    <asp:ControlParameter ControlID="GV_Item" Name="ItemID" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Item_ID" Type="Int32" />
                    <asp:Parameter Name="Unit_Name" Type="String" />
                    <asp:Parameter Name="Unit_Weight" Type="Double" />
                    <asp:Parameter Name="Unit_Description" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
                
        </asp:Panel>
    
        <asp:SqlDataSource ID="UnitDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
            DeleteCommand="DELETE FROM [Unit] WHERE [Unit_ID] = @Unit_ID" 
            InsertCommand="INSERT INTO [Unit] ([Item_ID], [Unit_Name], [Unit_Weight], [Unit_Description]) VALUES (@Item_ID, @Unit_Name, @Unit_Weight, @Unit_Description)" 
            SelectCommand="SELECT Unit.Unit_ID, Inventory_Item.Item_Name, Unit.Unit_Name, Unit.Unit_Weight, Unit.Unit_Description FROM Unit INNER JOIN Inventory_Item ON Unit.Item_ID = Inventory_Item.Item_ID WHERE (Unit.Item_ID = @Item_ID)" 
            
            UpdateCommand="UPDATE [Unit] SET [Item_ID] = @Item_ID, [Unit_Name] = @Unit_Name, [Unit_Weight] = @Unit_Weight, [Unit_Description] = @Unit_Description WHERE [Unit_ID] = @Unit_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GV_Item" Name="Item_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Unit_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Item_ID" Type="Int32" />
                <asp:Parameter Name="Unit_Name" Type="String" />
                <asp:Parameter Name="Unit_Weight" Type="Double" />
                <asp:Parameter Name="Unit_Description" Type="String" />
                <asp:Parameter Name="Unit_ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Item_ID" Type="Int32" />
                <asp:Parameter Name="Unit_Name" Type="String" />
                <asp:Parameter Name="Unit_Weight" Type="Double" />
                <asp:Parameter Name="Unit_Description" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    
    </asp:Panel>

</asp:Content>

