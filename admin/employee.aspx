<%@ Page Title="Employee" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="employee.aspx.cs" Inherits="employee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h1>Employee Management</h1>
    <br />
    <asp:GridView ID="GV_Employee" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" Width="700px"
        DataSourceID="GV_EmployeeDataSource" DataKeyNames="Employee_ID">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" onclick="LinkButton1_Click" Text="Select"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Employee_FName" HeaderText="FirstName" 
                SortExpression="Employee_FName" />
            <asp:BoundField DataField="Employee_LName" HeaderText="LastName" 
                SortExpression="Employee_LName" />
            <asp:BoundField DataField="Employee_JobTitle" HeaderText="JobTitle" 
                SortExpression="Employee_JobTitle" />
        </Columns>
        <EmptyDataTemplate>
            No Employee Data Found
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="GV_EmployeeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        
        SelectCommand="SELECT [Employee_FName], [Employee_LName], [Employee_JobTitle], [Employee_ID] FROM [Employee] ORDER BY [Employee_LName]">
    </asp:SqlDataSource>
    <asp:FormView ID="FV_Employee" runat="server" DataKeyNames="Employee_ID" 
        DataSourceID="FV_EmployeeDataSource" Width="800px" DefaultMode="Insert">
        <EditItemTemplate>
        <table>
            <tr><td><h5>Employee ID:</h5></td>
           
           <td><asp:Label ID="Employee_IDLabel1" runat="server" 
                Text='<%# Eval("Employee_ID") %>' /></td></tr>
         
             <tr><td><h5>*FirstName:</h5></td>
            <td><asp:TextBox ID="Employee_FNameTextBox" runat="server" MaxLength="30"  
                Text='<%# Bind("Employee_FName") %>' />
                <asp:RequiredFieldValidator 
                ID="FirstNameValidation"
                    runat="server" 
                    ErrorMessage="(Required)" 
                    Display="Dynamic" 
                    ControlToValidate="Employee_FNameTextBox" />
            </td>
            
            <td><h5>*LastName:</h5></td>
            <td><asp:TextBox ID="Employee_LNameTextBox" runat="server" MaxLength="30"
                Text='<%# Bind("Employee_LName") %>' />
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator2"
                    runat="server" 
                    ErrorMessage="(Required)" 
                    Display="Dynamic" 
                    ControlToValidate="Employee_LNameTextBox" />
            </td></tr>
           
            <tr><td><h5>JobTitle:</h5></td>
            <td><asp:TextBox ID="Employee_JobTitleTextBox" runat="server" MaxLength="40"
                Text='<%# Bind("Employee_JobTitle") %>' Width="250px" /></td></tr>
            
           <tr><td><h5>HireDate:</h5></td>
           <td><asp:TextBox ID="Employee_HireDateTextBox" runat="server" 
                Text='<%# Bind("Employee_HireDate") %>' /><asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                    runat="server" ErrorMessage="Invalid Date Format (MM/DD/YYYY)" 
                    ValidationExpression="^([1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"
                    Display="Dynamic" ControlToValidate="Employee_HireDateTextBox" /></td>
        
            <td><h5>PhoneNumber:</h5></td>
            <td><asp:TextBox ID="Employee_PhoneTextBox" runat="server" MaxLength="10"
                Text='<%# Bind("Employee_Phone") %>' />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                    runat="server"
                    ErrorMessage="Invalid Phone Number Format" 
                    ValidationExpression="^\d{10}$" 
                    ControlToValidate="Employee_PhoneTextBox" 
                    Display="Dynamic" />    
            </td></tr>
          
            
            <tr><td><h5>Address Line 1:</td>
            <td><asp:TextBox ID="Employee_Address1TextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Employee_Address1") %>' Width="250px" /></h5></td></tr>
         
            <tr><td><h5>Address Line 2:</td>
            <td><asp:TextBox ID="Employee_Address2TextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Employee_Address2") %>' Width="250px" /></h5></td></tr>
         
            <tr><td><h5>City:</h5></td>
            <td><asp:TextBox ID="Employee_CityTextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Employee_City") %>' /></td>
        
            <td><h5>State:</h5></td>
            <td><asp:TextBox ID="Employee_StateTextBox" runat="server" MaxLength="2"
                Text='<%# Bind("Employee_State") %>' /></td></tr>
        
            <tr><td><h5>ZipCode:</h5></td>
            <td><asp:TextBox ID="Employee_ZipCodeTextBox" runat="server"
                Text='<%# Bind("Employee_ZipCode") %>' />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server"
                    ErrorMessage="Invalid ZipCode Format" 
                    ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" 
                    ControlToValidate="Employee_ZipCodeTextBox" 
                    Display="Dynamic" />    
            </td></tr>
          
            </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
        <h5>Enter New Employee</h5>
        <table>
            <tr><td><h5>Employee ID:</h5></td>
           
           <td><asp:Label ID="Employee_IDLabel1" runat="server" 
                Text='<%# Eval("Employee_ID") %>' /></td></tr>
         
             <tr><td><h5>*FirstName:</h5></td>
            <td><asp:TextBox ID="Employee_FNameTextBox" runat="server" MaxLength="30"  
                Text='<%# Bind("Employee_FName") %>' />
                <asp:RequiredFieldValidator 
                ID="FirstNameValidation"
                    runat="server" 
                    ErrorMessage="(Required)" 
                    Display="Dynamic" 
                    ControlToValidate="Employee_FNameTextBox" />
            </td>
            
            <td><h5>*LastName:</h5></td>
            <td><asp:TextBox ID="Employee_LNameTextBox" runat="server" MaxLength="30"
                Text='<%# Bind("Employee_LName") %>' />
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator2"
                    runat="server" 
                    ErrorMessage="(Required)" 
                    Display="Dynamic" 
                    ControlToValidate="Employee_LNameTextBox" />
            </td></tr>
           
            <tr><td><h5>JobTitle:</h5></td>
            <td><asp:TextBox ID="Employee_JobTitleTextBox" runat="server" MaxLength="40"
                Text='<%# Bind("Employee_JobTitle") %>' Width="250px" /></td></tr>
            
           <tr><td><h5>HireDate:</h5></td>
           <td><asp:TextBox ID="Employee_HireDateTextBox" runat="server" 
                Text='<%# Bind("Employee_HireDate") %>' /><asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                    runat="server" ErrorMessage="Invalid Date Format (MM/DD/YYYY)" 
                    ValidationExpression="^([1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"
                    Display="Dynamic" ControlToValidate="Employee_HireDateTextBox" /></td>
        
            <td><h5>PhoneNumber:</h5></td>
            <td><asp:TextBox ID="Employee_PhoneTextBox" runat="server" MaxLength="10"
                Text='<%# Bind("Employee_Phone") %>' />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                    runat="server"
                    ErrorMessage="Invalid Phone Number Format" 
                    ValidationExpression="^\d{10}$" 
                    ControlToValidate="Employee_PhoneTextBox" 
                    Display="Dynamic" />    
            </td></tr>
          
            
            <tr><td><h5>Address Line 1:</td>
            <td><asp:TextBox ID="Employee_Address1TextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Employee_Address1") %>' Width="250px" /></h5></td></tr>
         
            <tr><td><h5>Address Line 2:</td>
            <td><asp:TextBox ID="Employee_Address2TextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Employee_Address2") %>' Width="250px" /></h5></td></tr>
         
            <tr><td><h5>City:</h5></td>
            <td><asp:TextBox ID="Employee_CityTextBox" runat="server" MaxLength="50"
                Text='<%# Bind("Employee_City") %>' /></td>
        
            <td><h5>State:</h5></td>
            <td><asp:TextBox ID="Employee_StateTextBox" runat="server" MaxLength="2"
                Text='<%# Bind("Employee_State") %>' /></td></tr>
        
            <tr><td><h5>ZipCode:</h5></td>
            <td><asp:TextBox ID="Employee_ZipCodeTextBox" runat="server"
                Text='<%# Bind("Employee_ZipCode") %>' />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server"
                    ErrorMessage="Invalid ZipCode Format" 
                    ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" 
                    ControlToValidate="Employee_ZipCodeTextBox" 
                    Display="Dynamic" />    
            </td></tr>
          
            </table>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
        
        <table>
            
            <tr><td><h5>Employee ID:</h5></td>
           
           <td><asp:Label ID="Employee_IDLabel1" runat="server" 
                Text='<%# Eval("Employee_ID") %>' /></td></tr>
         
             <tr><td><h5>FirstName:</h5></td>
            <td><asp:Label ID="Employee_FNameLabel" runat="server" 
                Text='<%# Bind("Employee_FName") %>' /></td>
            
            <td><h5>LastName:</h5></td>
            <td><asp:Label ID="Employee_LNameLabel" runat="server" 
                Text='<%# Bind("Employee_LName") %>' /></td></tr>
           
            <tr><td><h5>JobTitle:</h5></td>
            <td><asp:Label ID="Employee_JobTitleLabel" runat="server" 
                Text='<%# Bind("Employee_JobTitle") %>' /></td></tr>
            
           <tr><td><h5>HireDate:</h5></td>
           <td><asp:Label ID="Employee_HireDateLabel" runat="server" 
                Text='<%# Bind("Employee_HireDate") %>' /></td>
        
            <td><h5>PhoneNumber:</h5></td>
            <td><asp:Label ID="Employee_PhoneLabel" runat="server" 
                Text='<%# Bind("Employee_Phone") %>' /></td></tr>
          
            
            <tr><td><h5>Address Line 1:</td>
            <td><asp:Label ID="Employee_Address1Label" runat="server" 
                Text='<%# Bind("Employee_Address1") %>' /></h5></td></tr>
         
            <tr><td><h5>Address Line 2:</td>
            <td><asp:Label ID="Employee_Address2Label" runat="server" 
                Text='<%# Bind("Employee_Address2") %>' /></h5></td></tr>
         
            <tr><td><h5>City:</h5></td>
            <td><asp:Label ID="Employee_CityLabel" runat="server" 
                Text='<%# Bind("Employee_City") %>' /></td>
        
            <td><h5>State:</h5></td>
            <td><asp:Label ID="Employee_StateLabel" runat="server" 
                Text='<%# Bind("Employee_State") %>' /></td></tr>
        
            <tr><td><h5>ZipCode:</h5></td>
            <td><asp:Label ID="Employee_ZipCodeLabel" runat="server" 
                Text='<%# Bind("Employee_ZipCode") %>' /></td></tr>
          
            </table>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="FV_EmployeeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        DeleteCommand="DELETE FROM [Employee] WHERE [Employee_ID] = @Employee_ID" 
        InsertCommand="INSERT INTO [Employee] ([Employee_FName], [Employee_LName], [Employee_HireDate], [Employee_Phone], [Employee_JobTitle], [Employee_Address1], [Employee_Address2], [Employee_City], [Employee_State], [Employee_ZipCode]) VALUES (@Employee_FName, @Employee_LName, @Employee_HireDate, @Employee_Phone, @Employee_JobTitle, @Employee_Address1, @Employee_Address2, @Employee_City, @Employee_State, @Employee_ZipCode)" 
        SelectCommand="SELECT * FROM [Employee] WHERE ([Employee_ID] = @Employee_ID)" 
        UpdateCommand="UPDATE [Employee] SET [Employee_FName] = @Employee_FName, [Employee_LName] = @Employee_LName, [Employee_HireDate] = @Employee_HireDate, [Employee_Phone] = @Employee_Phone, [Employee_JobTitle] = @Employee_JobTitle, [Employee_Address1] = @Employee_Address1, [Employee_Address2] = @Employee_Address2, [Employee_City] = @Employee_City, [Employee_State] = @Employee_State, [Employee_ZipCode] = @Employee_ZipCode WHERE [Employee_ID] = @Employee_ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GV_Employee" Name="Employee_ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Employee_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Employee_FName" Type="String" />
            <asp:Parameter Name="Employee_LName" Type="String" />
            <asp:Parameter DbType="Date" Name="Employee_HireDate" />
            <asp:Parameter Name="Employee_Phone" Type="String" />
            <asp:Parameter Name="Employee_JobTitle" Type="String" />
            <asp:Parameter Name="Employee_Address1" Type="String" />
            <asp:Parameter Name="Employee_Address2" Type="String" />
            <asp:Parameter Name="Employee_City" Type="String" />
            <asp:Parameter Name="Employee_State" Type="String" />
            <asp:Parameter Name="Employee_ZipCode" Type="String" />
            <asp:Parameter Name="Employee_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Employee_FName" Type="String" />
            <asp:Parameter Name="Employee_LName" Type="String" />
            <asp:Parameter DbType="Date" Name="Employee_HireDate" />
            <asp:Parameter Name="Employee_Phone" Type="String" />
            <asp:Parameter Name="Employee_JobTitle" Type="String" />
            <asp:Parameter Name="Employee_Address1" Type="String" />
            <asp:Parameter Name="Employee_Address2" Type="String" />
            <asp:Parameter Name="Employee_City" Type="String" />
            <asp:Parameter Name="Employee_State" Type="String" />
            <asp:Parameter Name="Employee_ZipCode" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

