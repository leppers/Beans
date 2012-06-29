<%@ Page Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="Donor.aspx.cs"  Inherits="Donor" Title="Donor Information"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:Button ID="btnAddDonor" runat="server" Text="Add Donor" 
        onclick="btnAddDonor_Click" />
    <asp:Button ID="btnSearchDonor" runat="server" Text="Search Donor" 
        onclick="btnSearchDonor_Click" />
    
    <asp:MultiView ID="Donor_MV" runat="server">
     <asp:View ID="viewSearchDonor" runat="server">
       
    
    <h5>Search By: 
    <asp:DropDownList ID="ddlSearchBy" runat="server" 
        OnSelectedIndexChanged="LoadSearchTool" AutoPostBack="True" 
        onload="LoadSearchTool" ontextchanged="LoadSearchTool">
        <asp:ListItem>Select Option</asp:ListItem>
        <asp:ListItem>Lastname</asp:ListItem>
        <asp:ListItem>PhoneNumber</asp:ListItem>
        <asp:ListItem Value="Organization">Organization</asp:ListItem>
    </asp:DropDownList>
    </h5>
 

    <h5>Please Complete Field(s) Below:</h5>
    <asp:Panel ID="PanelLastName" runat="server">
        <h5>Donor Last Name: <asp:TextBox ID="txtDonorLastName" runat="server" />
        <asp:Button ID="btnSearchName" runat="server" Text="Search" 
                onclick="btnSearchName_Click" /></h5>
    </asp:Panel>
    <asp:Panel ID="PanelPhoneNumber" runat="server">
        <h5>Donor Phone Number: &nbsp;<asp:TextBox ID="txtDonorPhoneNumber" runat="server" />
         <asp:Button ID="btnSearchPhone" runat="server" Text="Search" 
                onclick="btnSearchPhone_Click" /></h5>
    </asp:Panel>  
    <asp:Panel ID="PanelOrganization" runat="server">
    
    <h5>Organization&nbsp;<asp:TextBox ID="txtDonorOrg" runat="server" />
     

    <asp:Button ID="btnSearchOrg" runat="server" Text="Search" 
             onclick="btnSearchOrg_Click" /></h5>
    </asp:Panel>
</asp:View>
<asp:View ID="viewSearchResult" runat="server" >
    <asp:GridView ID="gv_Search_Result"  runat="server" AutoGenerateColumns="False" 
       DataKeyNames="Entity_ID" DataSourceID="SqlDataSource2" >
       <Columns>
        <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lBtnSearch" runat="server" CausesValidation="False" 
                        CommandName="Select" onclick="lBtnSearch_Click" Text="Select"></asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="Entity_ID" HeaderText="Donor ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
            <asp:BoundField DataField="Entity_Organization_Name" 
                HeaderText="Organization" 
                SortExpression="Entity_Organization_Name" />
            <asp:BoundField DataField="Entity_Contact_FName" 
                HeaderText="FirstName" SortExpression="Entity_Contact_FName" />
            <asp:BoundField DataField="Entity_Contact_MName" 
                HeaderText="MiddleName" SortExpression="Entity_Contact_MName" />
            <asp:BoundField DataField="Entity_Contact_LName" 
                HeaderText="LastName" SortExpression="Entity_Contact_LName" />
            <asp:BoundField DataField="Entity_Phone" HeaderText="Phone Number" 
                SortExpression="Entity_Phone" />
        </Columns>
       
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>"/>
</asp:View>
  

<asp:View ID="viewDonor" runat="server" > 
    <asp:FormView ID="DonorFormView" runat="server"
        DataKeyNames="entity_id" DataSourceID="SqlDataSource1" 
        Width="900px" AllowPaging="True" >
        <EditItemTemplate>
            <h3>Donor Number:
            <asp:Label ID="entity_idLabel1" runat="server" 
                Text='<%# Eval("Entity_ID") %>' /></h3>
            <h5>First Name:
            <asp:TextBox ID="entity_firstnameTextBox" runat="server" 
                Text='<%# Bind("Entity_Contact_FName") %>' MaxLength="50" />
                <asp:RequiredFieldValidator 
                ID="FirstNameValidation"
                    runat="server" 
                    ErrorMessage="(Required)" 
                    Display="Dynamic" 
                    ControlToValidate="entity_firstnameTextBox" />&nbsp;&nbsp;&nbsp;
                    Middle Initial:
                    <asp:TextBox ID="entity_middlenameTextBox" 
                    runat="server" MaxLength="50" Width="20px"
                Text='<%# Bind("Entity_Contact_MName") %>' />
               &nbsp;&nbsp;&nbsp;
                     Last Name:
                <asp:TextBox ID="entity_lastnameTextBox" runat="server" MaxLength="50"
                    Text='<%# Bind("Entity_Contact_LName") %>' Width="176px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="(Required)" Display="Dynamic" ControlToValidate="entity_firstnameTextBox" />
            </h5>
            
            <h5>Organization:
            <asp:TextBox ID="orgaizationTextBox" runat="server" 
                Text='<%# Bind("Entity_Organization_Name") %>' MaxLength="50" Width="200px" /></h5>
            <h5>Contact Information</h5>
            <h5>Address Line 1:
            <asp:TextBox ID="address1TextBox" runat="server" 
                Text='<%# Bind("Entity_Address1") %>' Width="300px" MaxLength="50" /></h5>
         
            <h5>Address Line 2:
            <asp:TextBox ID="address2TextBox" runat="server" 
                Text='<%# Bind("Entity_Address2") %>' Width="300px" MaxLength="50" /></h5>
           
            <h5>City:
            <asp:TextBox ID="cityTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_City") %>' 
                    Width="189px" />&nbsp;&nbsp; State:
                <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("Entity_State") %>' 
                    Width="126px" />
            </h5>
          
            <h5>ZipCode:
            <asp:TextBox ID="zipcodeTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_ZipCode") %>' 
                    Width="88px" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server"
                    ErrorMessage="Invalid ZipCode Format" 
                    ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" 
                    ControlToValidate="zipcodeTextBox" 
                    Display="Dynamic" />
                    </h5>
            
            <h5>Email:
            <asp:TextBox ID="emailTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_Email") %>' 
                    Width="300px" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                        runat="server" ErrorMessage="Format(john@example.com)" 
                        ControlToValidate="emailTextBox" Display="Dynamic"  
                        ValidationExpression="(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})" EnableClientScript="True" Enabled="True" />
                        </h5>
          
            <h5>Phone Number:
            <asp:TextBox ID="phoneNumberTextBox" runat="server" 
                Text='<%# Bind("Entity_Phone") %>' MaxLength="10" />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                    runat="server"
                    ErrorMessage="Invalid Phone Number Format" 
                    ValidationExpression="^\d{10}$" 
                    ControlToValidate="phoneNumberTextBox" 
                    Display="Dynamic" />
                    (Ex. 9075551234)
               
              
                    
                   
            
            </h5>
            <br />
            
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             
        </EditItemTemplate>
        <InsertItemTemplate>
            <h3>Donor Number:
            <asp:Label ID="entity_idLabel1" runat="server" 
                Text='<%# Eval("Entity_ID") %>' /></h3>
            <h5>First Name:
            <asp:TextBox ID="entity_firstnameTextBox" runat="server" 
                Text='<%# Bind("Entity_Contact_FName") %>' MaxLength="50" />
                <asp:RequiredFieldValidator ID="FirstNameValidation"
                    runat="server" ErrorMessage="(Required)" Display="Dynamic" 
                    ControlToValidate="entity_firstnameTextBox" />
                    &nbsp;&nbsp;&nbsp; Middle Initial:
                    <asp:TextBox ID="entity_middlenameTextBox" MaxLength="50" Width="20px" runat="server" 
                Text='<%# Bind("Entity_Contact_MName") %>' />
                
                    &nbsp;&nbsp;&nbsp; Last Name:
                <asp:TextBox ID="entity_lastnameTextBox" MaxLength="50" runat="server" 
                    Text='<%# Bind("Entity_Contact_LName") %>' Width="176px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                    runat="server" ErrorMessage="(Required)" Display="Dynamic" 
                    ControlToValidate="entity_lastnameTextBox" />
            </h5>
            
            <h5>Organization:
            <asp:TextBox ID="orgaizationTextBox" MaxLength="50" runat="server" 
                Text='<%# Bind("Entity_Organization_Name") %>' Width="200px" /></h5>
            <h5>Contact Information</h5>
            <h5>Address Line 1:
            <asp:TextBox ID="address1TextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Entity_Address1") %>' Width="300px" /></h5>
         
            <h5>Address Line 2:
            <asp:TextBox ID="address2TextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Entity_Address2") %>' Width="300px" /></h5>
           
            <h5>City:
            <asp:TextBox ID="cityTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_City") %>'  
                    Width="189px" />&nbsp;&nbsp; State:
                <asp:TextBox ID="stateTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_State") %>' 
                    Width="126px" />
            </h5>
          
            <h5>ZipCode:
            <asp:TextBox ID="zipcodeTextBox" runat="server" MaxLength="10" Text='<%# Bind("Entity_ZipCode") %>' 
                    Width="88px" />
                     <asp:RegularExpressionValidator ID="ZipCodeValidator" 
                    runat="server"
                    ErrorMessage="Invalid ZipCode Format" 
                    ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" 
                    ControlToValidate="zipcodeTextBox" 
                    Display="Dynamic" />
                    </h5>
            
            <h5>Email:
            <asp:TextBox ID="emailTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_Email") %>' 
                    Width="300px" /><asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                        runat="server" ErrorMessage="Format(john@example.com)" 
                        ControlToValidate="emailTextBox" Display="Dynamic"  
                        ValidationExpression="(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})" /></h5>
          
            <h5>Phone Number:
            <asp:TextBox ID="phoneNumberTextBox" MaxLength="10" runat="server" 
                Text='<%# Bind("Entity_Phone") %>' />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server"
                    ErrorMessage="Invalid Phone Number Format" 
                    ValidationExpression="^\d{10}$" 
                    ControlToValidate="phoneNumberTextBox" 
                    Display="Dynamic" />
                    (Ex. 9075551234)
                            
          
            </h5>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <h3>Donor Number:
            <asp:Label ID="entity_idLabel1" runat="server" 
                Text='<%# Eval("Entity_ID") %>' ForeColor="Black" /></h3>
            <h5>First Name:
            <asp:Label ID="entity_firstnameLabel" runat="server" 
                Text='<%# Bind("Entity_Contact_FName") %>' ForeColor="Black" />&nbsp;&nbsp;&nbsp; Middle Initial:
                 <asp:Label ID="entity_middlenameLabel" runat="server" 
                Text='<%# Bind("Entity_Contact_MName") %>' ForeColor="Black" />&nbsp;&nbsp;&nbsp; Last Name:
                <asp:Label ID="entity_lastnameLabel" runat="server" 
                    Text='<%# Bind("Entity_Contact_LName") %>' Width="176px" ForeColor="Black" />
            </h5>
            
            <h5>Organization:
            <asp:Label ID="orgaizationLabel" runat="server" 
                Text='<%# Bind("Entity_Organization_Name") %>' Width="200px" ForeColor="Black" /></h5>
            <h5>Contact Information</h5>
            <h5>Address Line 1:
            <asp:Label ID="address1Label" runat="server" 
                Text='<%# Bind("Entity_Address1") %>' Width="300px" ForeColor="Black" /></h5>
         
            <h5>Address Line 2:
            <asp:Label ID="address2Label" runat="server" 
                Text='<%# Bind("Entity_Address2") %>' Width="300px" ForeColor="Black" /></h5>
           
            <h5>City:
            <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("Entity_City") %>' 
                    Width="189px"  ForeColor="Black" />&nbsp;&nbsp; State:
            <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("Entity_State") %>' 
                    Width="126px" ForeColor="Black" />
            </h5>
          
            <h5>ZipCode:
            <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Bind("Entity_ZipCode") %>' 
                    Width="88px" ForeColor="Black" /></h5>
            
            <h5>Email:
            <asp:Label ID="emailLabel" runat="server" ForeColor="Black" Text='<%# Bind("Entity_Email") %>' 
                    Width="300px" /></h5>
          
            <h5>Phone Number:
            <asp:Label ID="phoneNumberLabel" runat="server"  ForeColor="Black"
                Text='<%# Bind("Entity_Phone") %>' />&nbsp; &nbsp;
                 </h5>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" onclick="EditButton_Click" />
            
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    </asp:View>
    </asp:MultiView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
       
        InsertCommand="INSERT INTO Entity(Entity_Organization_Name, Entity_Contact_FName, Entity_Contact_MName, Entity_Contact_LName, Entity_Address1, Entity_Address2, Entity_City, Entity_State, Entity_ZipCode, Entity_Email, Entity_Phone, Entity_Type, Entity_Support_Type) VALUES (@Entity_Organization_Name, @Entity_Contact_FName, @Entity_Contact_MName, @Entity_Contact_LName, @Entity_Address1, @Entity_Address2, @Entity_City, @Entity_State, @Entity_ZipCode, @Entity_Email, @Entity_Phone, 'i', 'd')" 
        SelectCommand = "SELECT Entity_ID, Entity_Organization_Name, Entity_Contact_FName, Entity_Contact_MName, Entity_Contact_LName, Entity_Address1, Entity_Address2, Entity_City, Entity_State, Entity_ZipCode, Entity_Email, Entity_Phone, Entity_Type, Entity_Support_Type FROM Entity WHERE (Entity_ID = @Entity_ID)"
      
    
        UpdateCommand="UPDATE Entity SET Entity_Organization_Name = @Entity_Organization_Name, Entity_Contact_FName = @Entity_Contact_FName, Entity_Contact_MName = @Entity_Contact_MName, Entity_Contact_LName = @Entity_Contact_LName, Entity_Address1 = @Entity_Address1, Entity_Address2 = @Entity_Address2, Entity_City = @Entity_City, Entity_State = @Entity_State, Entity_ZipCode = @Entity_ZipCode, Entity_Email = @Entity_Email, Entity_Phone = @Entity_Phone WHERE (Entity_ID = @original_Entity_ID) AND (Entity_Organization_Name = @original_Entity_Organization_Name OR Entity_Organization_Name IS NULL AND @original_Entity_Organization_Name IS NULL) AND (Entity_Contact_FName = @original_Entity_Contact_FName) AND (Entity_Contact_MName = @original_Entity_Contact_MName OR Entity_Contact_MName IS NULL AND @original_Entity_Contact_MName IS NULL) AND (Entity_Contact_LName = @original_Entity_Contact_LName) AND (Entity_Address1 = @original_Entity_Address1 OR Entity_Address1 IS NULL AND @original_Entity_Address1 IS NULL) AND (Entity_Address2 = @original_Entity_Address2 OR Entity_Address2 IS NULL AND @original_Entity_Address2 IS NULL) AND (Entity_City = @original_Entity_City OR Entity_City IS NULL AND @original_Entity_City IS NULL) AND (Entity_State = @original_Entity_State OR Entity_State IS NULL AND @original_Entity_State IS NULL) AND (Entity_ZipCode = @original_Entity_ZipCode OR Entity_ZipCode IS NULL AND @original_Entity_ZipCode IS NULL) AND (Entity_Email = @original_Entity_Email OR Entity_Email IS NULL AND @original_Entity_Email IS NULL) AND (Entity_Phone = @original_Entity_Phone OR Entity_Phone IS NULL AND @original_Entity_Phone IS NULL)" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original_{0}">
       
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

        </InsertParameters>
        <SelectParameters>
                 <asp:ControlParameter ControlID="gv_Search_Result" Name="Entity_ID" 
            PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

