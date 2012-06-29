<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h5>Manage Categories</h5>
    <asp:GridView ID="GV_Category" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" DataKeyNames="Category_ID" 
    DataSourceID="CategoryDataSource" ShowFooter="True" 
        CellSpacing="1" Width="700px">
        
        <Columns>
        


            <asp:CommandField ShowEditButton="True" />
        


            <asp:TemplateField ShowHeader="False">
               
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick = "return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                &nbsp;<asp:LinkButton ID="lnkbtnAdd" runat="server" Text="Add" 
                        CausesValidation="true" onclick="lnkbtnAdd_Click" ValidationGroup="AddCategory" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category ID" InsertVisible="False" 
                SortExpression="Category_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category_ID") %>'></asp:Label>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Name" SortExpression="Category_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Category_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category_Name") %>'></asp:Label>
                </ItemTemplate>
                 <FooterTemplate>
           <asp:TextBox ID="txtCategoryName" runat="server" Text='<%# Bind("Category_Name") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="(Required)" Display="Dynamic" ValidationGroup="AddCategory" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Description" 
                SortExpression="Category_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="Textbox2" runat="server" 
                        Text='<%# Bind("Category_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Category_Description") %>'></asp:Label>
                </ItemTemplate>
                 <FooterTemplate>
                     
               <asp:TextBox ID="txtCategoryDesc" runat="server" 
                        Text='<%# Bind("Category_Description") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryDesc" ErrorMessage="(Required)" Display="Dynamic" ValidationGroup="AddCategory" />
                </FooterTemplate>
            </asp:TemplateField>
         
        </Columns>
     
       
     </asp:GridView>
    
<asp:SqlDataSource ID="CategoryDataSource" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
    DeleteCommand="DELETE FROM [Category] WHERE [Category_ID] = @original_Category_ID AND [Category_Name] = @original_Category_Name AND (([Category_Description] = @original_Category_Description) OR ([Category_Description] IS NULL AND @original_Category_Description IS NULL))" 
    InsertCommand="INSERT INTO [Category] ([Category_Name], [Category_Description]) VALUES (@Category_Name, @Category_Description)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [Category]" 
    UpdateCommand="UPDATE [Category] SET [Category_Name] = @Category_Name, [Category_Description] = @Category_Description WHERE [Category_ID] = @original_Category_ID AND [Category_Name] = @original_Category_Name AND (([Category_Description] = @original_Category_Description) OR ([Category_Description] IS NULL AND @original_Category_Description IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Category_ID" Type="Int32" />
        <asp:Parameter Name="original_Category_Name" Type="String" />
        <asp:Parameter Name="original_Category_Description" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Category_Name" Type="String" />
        <asp:Parameter Name="Category_Description" Type="String" />
        <asp:Parameter Name="original_Category_ID" Type="Int32" />
        <asp:Parameter Name="original_Category_Name" Type="String" />
        <asp:Parameter Name="original_Category_Description" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Category_Name" Type="String" />
        <asp:Parameter Name="Category_Description" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
    <br />
</asp:Content>

