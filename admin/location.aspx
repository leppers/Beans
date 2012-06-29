<%@ Page Title="" Language="C#" MasterPageFile="MasterPages/Admin.master" AutoEventWireup="true" CodeFile="location.aspx.cs" Inherits="location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h5>Manage Categories</h5>
    <asp:GridView ID="GV_Location" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" DataKeyNames="Location_ID" 
    DataSourceID="LocationDataSource" ShowFooter="True" 
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
                        CausesValidation="true" onclick="lnkbtnAdd_Click" ValidationGroup="AddLocation" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location ID" InsertVisible="False" 
                SortExpression="Location_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Location_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location_ID") %>'></asp:Label>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location Name" SortExpression="Location_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Location_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Location_Name") %>'></asp:Label>
                </ItemTemplate>
                 <FooterTemplate>
           <asp:TextBox ID="txtLocationName" runat="server" Text='<%# Bind("Location_Name") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocationName" ErrorMessage="(Required)"
                 Display="Dynamic" ValidationGroup="AddLocation" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location Description" 
                SortExpression="Location_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="Textbox2" runat="server" 
                        Text='<%# Bind("Location_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Location_Description") %>'></asp:Label>
                </ItemTemplate>
                 <FooterTemplate>
                     
               <asp:TextBox ID="txtLocationDesc" runat="server" 
                        Text='<%# Bind("Location_Description") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLocationDesc" ErrorMessage="(Required)" Display="Dynamic" ValidationGroup="AddLocation" />
                </FooterTemplate>
            </asp:TemplateField>
         
        </Columns>
     
       
     </asp:GridView>
    
<asp:SqlDataSource ID="LocationDataSource" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
    DeleteCommand="DELETE FROM [Location] WHERE [Location_ID] = @original_Location_ID AND [Location_Name] = @original_Location_Name AND (([Location_Description] = @original_Location_Description) OR ([Location_Description] IS NULL AND @original_Location_Description IS NULL))" 
    InsertCommand="INSERT INTO [Location] ([Location_Name], [Location_Description]) VALUES (@Location_Name, @Location_Description)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [Location]" 
    
    UpdateCommand="UPDATE [Location] SET [Location_Name] = @Location_Name, [Location_Description] = @Location_Description WHERE [Location_ID] = @original_Location_ID AND [Location_Name] = @original_Location_Name AND (([Location_Description] = @original_Location_Description) OR ([Location_Description] IS NULL AND @original_Location_Description IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Location_ID" Type="Int32" />
        <asp:Parameter Name="original_Location_Name" Type="String" />
        <asp:Parameter Name="original_Location_Description" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Location_Name" Type="String" />
        <asp:Parameter Name="Location_Description" Type="String" />
        <asp:Parameter Name="original_Location_ID" Type="Int32" />
        <asp:Parameter Name="original_Location_Name" Type="String" />
        <asp:Parameter Name="original_Location_Description" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Location_Name" Type="String" />
        <asp:Parameter Name="Location_Description" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
    <br />
</asp:Content>

