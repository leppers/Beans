<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="New_Volunteer.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h1>Volunteer Maintenence</h1>
    <div class="inner">
        <asp:FormView 
            ID="FormView1"
            runat="server" 
            AllowPaging="True" 
            CellPadding="4" ForeColor="#333333" Width="787px" 
            DataSourceID="SqlDataSource1" Height="178px" 
            PagerSettings-Mode="NextPrevious">
            
            <PagerSettings LastPageText="" NextPageText="Next" PageButtonCount="2" 
                PreviousPageText="Previous" FirstPageText="" Mode="NextPrevious" />
            
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            
            <ItemTemplate>
                Volunteer ID Number:
                <asp:Label ID="Entity_IDLabel1" runat="server" 
                    Text='<%# Bind("Entity_ID") %>' />
                <br />
                Organization Name:
                <asp:Label ID="Entity_Organization_NameLabel" runat="server" 
                    Text='<%# Bind("Entity_Organization_Name") %>' />
                <br />
                First Name:
                <asp:Label ID="Entity_Contact_FNameLabel" runat="server" 
                    Text='<%# Bind("Entity_Contact_FName") %>' />
                
                
                Middle Name:
                <asp:Label ID="Entity_Contact_MNameLabel" runat="server" 
                    Text='<%# Bind("Entity_Contact_MName") %>' />
                
                
                Last Name:
                <asp:Label ID="Entity_Contact_LNameLabel" runat="server" 
                    Text='<%# Bind("Entity_Contact_LName") %>' />
                <br />
                Address1:
                <asp:Label ID="Entity_Address1Label" runat="server" 
                    Text='<%# Bind("Entity_Address1") %>' />
                <br />
                
                Address2:
                <asp:Label ID="Entity_Address2Label" runat="server" 
                    Text='<%# Bind("Entity_Address2") %>' />
                
                <br />
                City:
                <asp:Label ID="Entity_CityLabel" runat="server" 
                    Text='<%# Bind("Entity_City") %>' />
                
                
                State:
                <asp:Label ID="Entity_StateLabel" runat="server" 
                    Text='<%# Bind("Entity_State") %>' />
                
                
                ZipCode:
                <asp:Label ID="Entity_ZipCodeLabel" runat="server" 
                    Text='<%# Bind("Entity_ZipCode") %>' />
                <br />
                Email:
                <asp:Label ID="Entity_EmailLabel" runat="server" 
                    Text='<%# Bind("Entity_Email") %>' />
                
                
                Phone:
                <asp:Label ID="Entity_PhoneLabel" runat="server" 
                    Text='<%# Bind("Entity_Phone") %>' />
                <br />
                Entity_Type:
                <asp:Label ID="Entity_TypeLabel" runat="server" 
                    Text='<%# Bind("Entity_Type") %>' />
                
                
                Entity_Support_Type:
                <asp:Label ID="Entity_Support_TypeLabel" runat="server" 
                    Text='<%# Bind("Entity_Support_Type") %>' />
                <br />
                
            
            <EditItemTemplate>
                Volunteer ID Number:
                <asp:Label ID="Edit_Ent_IDLabel1" runat="server" 
                    Text='<%# Bind("Entity_ID") %>' />
                <br />
                Organization Name:
                <asp:TextBox ID="Edit_Ent_Organization_NameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Organization_Name") %>' />
                <br />
                First Name:
                <asp:TextBox ID="Edit_Ent_Contact_FNameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Contact_FName") %>' />
                
                
                Middle Name:
                <asp:TextBox ID="Edit_Ent_Contact_MNameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Contact_MName") %>' />
                
                Last Name:
                <asp:TextBox ID="Edit_Ent_Contact_LNameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Contact_LName") %>' />
                <br />
                
                Address1:
                <asp:TextBox ID="Edit_Ent_Address1TextBox" runat="server" 
                    Text='<%# Bind("Entity_Address1") %>' />
                <br />
                
                Address2:
                <asp:TextBox ID="Edit_Ent_Address2TextBox" runat="server" 
                    Text='<%# Bind("Entity_Address2") %>' />
                <br />
                City:
                <asp:TextBox ID="Edit_Ent_CityTextBox" runat="server" 
                    Text='<%# Bind("Entity_City") %>' />
                
                
                State:
                <asp:TextBox ID="Edit_Ent_StateTextBox" runat="server" 
                    Text='<%# Bind("Entity_State") %>' />
                
                
                ZipCode:
                <asp:TextBox ID="Edit_Ent_ZipCodeTextBox" runat="server" 
                    Text='<%# Bind("Entity_ZipCode") %>' />
                <br />
                Email:
                <asp:TextBox ID="Edit_Ent_EmailTextBox" runat="server" 
                    Text='<%# Bind("Entity_Email") %>' />
                
                
                Phone:
                <asp:TextBox ID="Edit_Ent_PhoneTextBox" runat="server" 
                    Text='<%# Bind("Entity_Phone") %>' />
                <br />
                Entity_Type:
                <asp:TextBox ID="Edit_Ent_TypeTextBox" runat="server" 
                    Text='<%# Bind("Entity_Type") %>' />
                
                
                
                Entity_Support_Type:
                <asp:TextBox ID="Edit_Ent_Support_TypeTextBox" runat="server" 
                    Text='<%# Bind("Entity_Support_Type") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            
            
            
            <InsertItemTemplate>
                Organization Name:
                <asp:TextBox ID="New_Ent_Organization_NameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Organization_Name") %>' />
                <br />
                First Name:
                <asp:TextBox ID="New_Ent_Contact_FNameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Contact_FName") %>' />
                
                
                Middle Name:
                <asp:TextBox ID="New_Ent_Contact_MNameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Contact_MName") %>' />
                
                Last Name:
                <asp:TextBox ID="New_Ent_Contact_LNameTextBox" runat="server" 
                    Text='<%# Bind("Entity_Contact_LName") %>' />
                <br />
                Address1:
                <asp:TextBox ID="New_Ent_Address1TextBox" runat="server" 
                    Text='<%# Bind("Entity_Address1") %>' />
                <br />
                
                Address2:
                <asp:TextBox ID="New_Ent_Address2TextBox" runat="server" 
                    Text='<%# Bind("Entity_Address2") %>' />
                <br />
                City:
                <asp:TextBox ID="New_Ent_CityTextBox" runat="server" 
                    Text='<%# Bind("Entity_City") %>' />
                
                
                State:
                <asp:TextBox ID="New_Ent_StateTextBox" runat="server" 
                    Text='<%# Bind("Entity_State") %>' />
                
                
                ZipCode:
                <asp:TextBox ID="New_Ent_ZipCodeTextBox" runat="server" 
                    Text='<%# Bind("Entity_ZipCode") %>' />
                <br />
                Email:
                <asp:TextBox ID="New_Ent_EmailTextBox" runat="server" 
                    Text='<%# Bind("Entity_Email") %>' />
                
                
                Phone:
                <asp:TextBox ID="New_Ent_PhoneTextBox" runat="server" 
                    Text='<%# Bind("Entity_Phone") %>' />
                <br />
                Entity_Type:
                <asp:TextBox ID="New_Ent_TypeTextBox" runat="server" 
                    Text='<%# Bind("Entity_Type") %>' />
                
                
                
                Entity_Support_Type:
                <asp:TextBox ID="New_Ent_Support_TypeTextBox" runat="server" 
                    Text='<%# Bind("Entity_Support_Type") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    
            </InsertItemTemplate>
            
            
            
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            </ItemTemplate>
        </asp:FormView>
        
        
      
        
        
        
        <asp:SqlDataSource ID="SqlDataSource1" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString2 %>" 
            
            SelectCommand="SELECT * FROM [Entity] ORDER BY [Entity_ID], [Entity_Contact_LName], [Entity_Contact_FName]"
             
             runat="server" 
            
            ProviderName="<%$ ConnectionStrings:Beans_DB_v4ConnectionString.ProviderName %>" 
            
            UpdateCommand="UPDATE [Entity] SET [Entity_Organization_Name] = @Entity_Organization_Name, [Entity_Contact_FName] = @Entity_Contact_FName, [Entity_Contact_MName] = @Entity_Contact_MName, [Entity_Contact_LName] = @Entity_Contact_LName, [Entity_Address1] = @Entity_Address1, [Entity_Address2] = @Entity_Address2, [Entity_City] = @Entity_City, [Entity_State] = @Entity_State, [Entity_ZipCode] = @Entity_ZipCode, [Entity_Email] = @Entity_Email, [Entity_Phone] = @Entity_Phone, [Entity_Type] = @Entity_Type, [Entity_Support_Type] = @Entity_Support_Type WHERE [Entity_ID] = @original_Entity_ID AND (([Entity_Organization_Name] = @original_Entity_Organization_Name) OR ([Entity_Organization_Name] IS NULL AND @original_Entity_Organization_Name IS NULL)) AND [Entity_Contact_FName] = @original_Entity_Contact_FName AND (([Entity_Contact_MName] = @original_Entity_Contact_MName) OR ([Entity_Contact_MName] IS NULL AND @original_Entity_Contact_MName IS NULL)) AND [Entity_Contact_LName] = @original_Entity_Contact_LName AND (([Entity_Address1] = @original_Entity_Address1) OR ([Entity_Address1] IS NULL AND @original_Entity_Address1 IS NULL)) AND (([Entity_Address2] = @original_Entity_Address2) OR ([Entity_Address2] IS NULL AND @original_Entity_Address2 IS NULL)) AND (([Entity_City] = @original_Entity_City) OR ([Entity_City] IS NULL AND @original_Entity_City IS NULL)) AND (([Entity_State] = @original_Entity_State) OR ([Entity_State] IS NULL AND @original_Entity_State IS NULL)) AND (([Entity_ZipCode] = @original_Entity_ZipCode) OR ([Entity_ZipCode] IS NULL AND @original_Entity_ZipCode IS NULL)) AND (([Entity_Email] = @original_Entity_Email) OR ([Entity_Email] IS NULL AND @original_Entity_Email IS NULL)) AND (([Entity_Phone] = @original_Entity_Phone) OR ([Entity_Phone] IS NULL AND @original_Entity_Phone IS NULL)) AND [Entity_Type] = @original_Entity_Type AND [Entity_Support_Type] = @original_Entity_Support_Type" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [Entity] WHERE [Entity_ID] = @original_Entity_ID AND (([Entity_Organization_Name] = @original_Entity_Organization_Name) OR ([Entity_Organization_Name] IS NULL AND @original_Entity_Organization_Name IS NULL)) AND [Entity_Contact_FName] = @original_Entity_Contact_FName AND (([Entity_Contact_MName] = @original_Entity_Contact_MName) OR ([Entity_Contact_MName] IS NULL AND @original_Entity_Contact_MName IS NULL)) AND [Entity_Contact_LName] = @original_Entity_Contact_LName AND (([Entity_Address1] = @original_Entity_Address1) OR ([Entity_Address1] IS NULL AND @original_Entity_Address1 IS NULL)) AND (([Entity_Address2] = @original_Entity_Address2) OR ([Entity_Address2] IS NULL AND @original_Entity_Address2 IS NULL)) AND (([Entity_City] = @original_Entity_City) OR ([Entity_City] IS NULL AND @original_Entity_City IS NULL)) AND (([Entity_State] = @original_Entity_State) OR ([Entity_State] IS NULL AND @original_Entity_State IS NULL)) AND (([Entity_ZipCode] = @original_Entity_ZipCode) OR ([Entity_ZipCode] IS NULL AND @original_Entity_ZipCode IS NULL)) AND (([Entity_Email] = @original_Entity_Email) OR ([Entity_Email] IS NULL AND @original_Entity_Email IS NULL)) AND (([Entity_Phone] = @original_Entity_Phone) OR ([Entity_Phone] IS NULL AND @original_Entity_Phone IS NULL)) AND [Entity_Type] = @original_Entity_Type AND [Entity_Support_Type] = @original_Entity_Support_Type" 
            InsertCommand="INSERT INTO [Entity] ([Entity_Organization_Name], [Entity_Contact_FName], [Entity_Contact_MName], [Entity_Contact_LName], [Entity_Address1], [Entity_Address2], [Entity_City], [Entity_State], [Entity_ZipCode], [Entity_Email], [Entity_Phone], [Entity_Type], [Entity_Support_Type]) VALUES (@Entity_Organization_Name, @Entity_Contact_FName, @Entity_Contact_MName, @Entity_Contact_LName, @Entity_Address1, @Entity_Address2, @Entity_City, @Entity_State, @Entity_ZipCode, @Entity_Email, @Entity_Phone, @Entity_Type, @Entity_Support_Type)" 
            OldValuesParameterFormatString="original_{0}" >
            <DeleteParameters>
                <asp:Parameter Name="original_Entity_ID" Type="Int32" />
                <asp:Parameter Name="original_Entity_Organization_Name" Type="String" />
                <asp:Parameter Name="original_Entity_Contact_FName" Type="String" />
                <asp:Parameter Name="original_Entity_Contact_MName" Type="String" />
                <asp:Parameter Name="original_Entity_Contact_LName" Type="String" />
                <asp:Parameter Name="original_Entity_Address1" Type="String" />
                <asp:Parameter Name="original_Entity_Address2" Type="String" />
                <asp:Parameter Name="original_Entity_City" Type="String" />
                <asp:Parameter Name="original_Entity_State" Type="String" />
                <asp:Parameter Name="original_Entity_ZipCode" Type="String" />
                <asp:Parameter Name="original_Entity_Email" Type="String" />
                <asp:Parameter Name="original_Entity_Phone" Type="String" />
                <asp:Parameter Name="original_Entity_Type" Type="String" />
                <asp:Parameter Name="original_Entity_Support_Type" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Entity_Organization_Name" Type="String" />
                <asp:Parameter Name="Entity_Contact_FName" Type="String" />
                <asp:Parameter Name="Entity_Contact_MName" Type="String" />
                <asp:Parameter Name="Entity_Contact_LName" Type="String" />
                <asp:Parameter Name="Entity_Address1" Type="String" />
                <asp:Parameter Name="Entity_Address2" Type="String" />
                <asp:Parameter Name="Entity_City" Type="String" />
                <asp:Parameter Name="Entity_State" Type="String" />
                <asp:Parameter Name="Entity_ZipCode" Type="String" />
                <asp:Parameter Name="Entity_Email" Type="String" />
                <asp:Parameter Name="Entity_Phone" Type="String" />
                <asp:Parameter Name="Entity_Type" Type="String" />
                <asp:Parameter Name="Entity_Support_Type" Type="String" />
                <asp:Parameter Name="original_Entity_ID" Type="Int32" />
                <asp:Parameter Name="original_Entity_Organization_Name" Type="String" />
                <asp:Parameter Name="original_Entity_Contact_FName" Type="String" />
                <asp:Parameter Name="original_Entity_Contact_MName" Type="String" />
                <asp:Parameter Name="original_Entity_Contact_LName" Type="String" />
                <asp:Parameter Name="original_Entity_Address1" Type="String" />
                <asp:Parameter Name="original_Entity_Address2" Type="String" />
                <asp:Parameter Name="original_Entity_City" Type="String" />
                <asp:Parameter Name="original_Entity_State" Type="String" />
                <asp:Parameter Name="original_Entity_ZipCode" Type="String" />
                <asp:Parameter Name="original_Entity_Email" Type="String" />
                <asp:Parameter Name="original_Entity_Phone" Type="String" />
                <asp:Parameter Name="original_Entity_Type" Type="String" />
                <asp:Parameter Name="original_Entity_Support_Type" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Entity_Organization_Name" Type="String" />
                <asp:Parameter Name="Entity_Contact_FName" Type="String" />
                <asp:Parameter Name="Entity_Contact_MName" Type="String" />
                <asp:Parameter Name="Entity_Contact_LName" Type="String" />
                <asp:Parameter Name="Entity_Address1" Type="String" />
                <asp:Parameter Name="Entity_Address2" Type="String" />
                <asp:Parameter Name="Entity_City" Type="String" />
                <asp:Parameter Name="Entity_State" Type="String" />
                <asp:Parameter Name="Entity_ZipCode" Type="String" />
                <asp:Parameter Name="Entity_Email" Type="String" />
                <asp:Parameter Name="Entity_Phone" Type="String" />
                <asp:Parameter Name="Entity_Type" Type="String" />
                <asp:Parameter Name="Entity_Support_Type" Type="String" />
            </InsertParameters>
            
        </asp:SqlDataSource>
        
        
      
        
        
        
    </div>
        
</asp:Content>

