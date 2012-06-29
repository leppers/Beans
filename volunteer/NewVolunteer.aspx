<%@ Page Title="New Volunteer" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="NewVolunteer.aspx.cs" Inherits="NewVolunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
   
    
    <h2>New Volunteer</h2><br />
    <asp:Panel ID="Panel1" runat="server">
    To enter a new Volunteer complete the form below<br />
    and then click "Add New"<br />
    
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
            DataSourceID="srcEntity" ForeColor="#333333" DefaultMode="Insert"
            OnItemInserted="FormView1Inserted" Width="576px" >
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        
        <EditItemTemplate>
            
            Organization Name:
            <asp:TextBox ID="Entity_Organization_NameTextBox" runat="server" 
                Text='<%# Bind("Entity_Organization_Name") %>' />
            <br />
            First Name:
            <asp:TextBox ID="Entity_Contact_FNameTextBox" runat="server" 
                Text='<%# Bind("Entity_Contact_FName") %>' />
            <br />
            Middle Name:
            <asp:TextBox ID="Entity_Contact_MNameTextBox" runat="server" 
                Text='<%# Bind("Entity_Contact_MName") %>' />
            <br />
            Last Name:
            <asp:TextBox ID="Entity_Contact_LNameTextBox" runat="server" 
                Text='<%# Bind("Entity_Contact_LName") %>' />
            <br />
            Address1:
            <asp:TextBox ID="Entity_Address1TextBox" runat="server" 
                Text='<%# Bind("Entity_Address1") %>' />
            <br />
            Address2:
            <asp:TextBox ID="Entity_Address2TextBox" runat="server" 
                Text='<%# Bind("Entity_Address2") %>' />
            <br />
            City:
            <asp:TextBox ID="Entity_CityTextBox" runat="server" 
                Text='<%# Bind("Entity_City") %>' />
            <br />
            State:
            <asp:TextBox ID="Entity_StateTextBox" runat="server" 
                Text='<%# Bind("Entity_State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="Entity_ZipCodeTextBox" runat="server" 
                Text='<%# Bind("Entity_ZipCode") %>' />
            <br />
            Email:
            <asp:TextBox ID="Entity_EmailTextBox" runat="server" 
                Text='<%# Bind("Entity_Email") %>' />           
                
            <br />
            Phone:
            <asp:TextBox ID="Entity_PhoneTextBox" runat="server" 
                Text='<%# Bind("Entity_Phone") %>' />
            <br />
            Type:
            <asp:TextBox ID="Entity_TypeTextBox" runat="server" 
                Text='<%# Bind("Entity_Type") %>' />
            <br />(Enter "i" for "Individual" or "g" for group)<br />
            Support Type:
            <asp:TextBox ID="Entity_Support_TypeTextBox" runat="server" 
                Text='<%# Bind("Entity_Support_Type") %>' />
            <br />(Enter "v" for "Volunteer", "d" for "Donor", or "b" for "Both")<br />
            
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" OnClientClick="return confirm('Send Information to the Database?');"/>
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        
        <InsertItemTemplate>
            
            <table>
	<tr>
		<td>Organization Name:</td>
		<td>
			<asp:TextBox ID="Entity_Organization_NameTextBox" runat="server" 
                		Text='<%# Bind("Entity_Organization_Name") %>' MaxLength="50" 
                		 Height="20px" Width="120px" />
                </td>
	
		<td>
		<asp:RegularExpressionValidator ID="regExpOrgName" runat="server" ErrorMessage="(Invalid Entry)" 
                ControlToValidate="Entity_Organization_NameTextBox" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                 SetFocusOnError="True" Display="Dynamic" />
		</td>
	</tr>
	<tr>
		<td>First Name:</td>
		<td>
			<asp:TextBox ID="Entity_Contact_FNameTextBox" runat="server" MaxLength="50" 
                Text='<%# Bind("Entity_Contact_FName") %>' Height="20px" Width="120px" /></td>
			<td><asp:Image ID="imgRequired11" runat="server" ImageUrl="images/Red_Star.gif"
				 Height="15px" Width="15px" AlternateText="Required" />
		</td>
  		
		<td>
			<asp:RequiredFieldValidator ID="reqFirstName" runat="server" 
                ControlToValidate="Entity_Contact_FNameTextBox" ErrorMessage="(Required)" SetFocusOnError="True" Display="Dynamic" />   
            <asp:RegularExpressionValidator ID="regExpFirstName" runat="server" ErrorMessage="(Invalid Entry)" 
                ControlToValidate="Entity_Contact_FNameTextBox" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                 SetFocusOnError="True" Display="Dynamic" />
		</td>

	</tr>
	<tr>
		<td>Middle Name:</td>
		<td>
			<asp:TextBox ID="Entity_Contact_MNameTextBox" runat="server" MaxLength="50" 
                Text='<%# Bind("Entity_Contact_MName") %>' Height="20px" Width="120px" />
                
		</td>
		<td>
			<asp:RegularExpressionValidator ID="regExpMName" runat="server" ErrorMessage="(Invalid Entry)" 
                ControlToValidate="Entity_Contact_MNameTextBox" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                 SetFocusOnError="True" Display="Dynamic" />
		</td>

	</tr>
	<tr>
		<td>Last Name:</td>
		<td>
			<asp:TextBox ID="Entity_Contact_LNameTextBox" runat="server" MaxLength="50" Text='<%# Bind("Entity_Contact_LName") %>' 
                CausesValidation="True" Height="20px" Width="120px"></asp:TextBox></td>
			<td></td><asp:Image ID="imgRequired2" runat="server" ImageUrl="images/Red_Star.gif" Height="15px" Width="15px" AlternateText="Required" />  
		</td>
		<td>
			<asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="(Required)" ControlToValidate="Entity_Contact_LNameTextBox" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
         
            <asp:RegularExpressionValidator ID="regExpLastName" runat="server" ErrorMessage="(Invalid Entry)" ControlToValidate="Entity_Contact_LNameTextBox" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" SetFocusOnError="True" Display="Dynamic" />                 
		</td>
	</tr>

	<tr>
		<td>Address1:</td>
		<td>
			<asp:TextBox ID="Entity_Address1TextBox" runat="server" 
                Text='<%# Bind("Entity_Address1") %>' MaxLength="50" Height="20px" Width="120px" />
		</td>

	</tr>
	<tr>
		<td>Address2:</td>
		<td>
			<asp:TextBox ID="Entity_Address2TextBox" runat="server" 
                Text='<%# Bind("Entity_Address2") %>' MaxLength="50" Height="20px" Width="120px" />
		</td>

	</tr>
	<tr>
		<td>City:</td>
		<td>
			<asp:TextBox ID="Entity_CityTextBox" runat="server" 
                Text='<%# Bind("Entity_City") %>' MaxLength="50" Height="20px" Width="120px" />
		</td>

	</tr>
	<tr>
		<td>State:</td>
		<td>
			<asp:TextBox ID="Entity_StateTextBox" runat="server" 
                Text='<%# Bind("Entity_State") %>' MaxLength="50" Height="20px" Width="40px" />
		</td>

	</tr>

	<tr>
		<td>Zip Code</td>
		<td>
			<asp:TextBox ID="Entity_ZipCodeTextBox" runat="server" 
                Text='<%# Bind("Entity_ZipCode") %>' MaxLength="5" Height="20px" Width="60px" />
		</td>
		<td>
			 <asp:RegularExpressionValidator ID="regExpZipcode" runat="server" ErrorMessage="(Invalid Zipcode)" 
            ControlToValidate="Entity_ZipCodeTextBox" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" SetFocusOnError="True" Display="Dynamic" />
		</td>
	</tr>
	<tr>
		<td>Email:</td>
		<td>
			<asp:TextBox ID="Entity_EmailTextBox" runat="server" 
                Text='<%# Bind("Entity_Email") %>' MaxLength="50" Height="20px" Width="120px" />
		</td>
			
		<td>
			<asp:RegularExpressionValidator ID="regExpEmail" runat="server" ErrorMessage="(Invalid Email)"
                 ControlToValidate="Entity_EmailTextBox" SetFocusOnError="True" 
                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w)*\.\w+([-.]]\w)*" Display="Dynamic" />
		</td>

	</tr>
	<tr>
		<td>Phone:</td>
		<td>
			<asp:TextBox ID="Entity_PhoneTextBox" runat="server" 
                Text='<%# Bind("Entity_Phone") %>' MaxLength="10" Height="20px" Width="120px" />
		</td>

	</tr>
	<tr>
		<td>Type:</td>
		<td>
			<asp:TextBox ID="Entity_TypeTextBox" runat="server" CausesValidation="True" 
                MaxLength="50" Text='<%# Bind("Entity_Type") %>' Height="20px" 
                Width="30px" />
			<asp:Image ID="imgRequired3" runat="server" ImageUrl="images/Red_Star.gif" Height="15px" Width="15px" AlternateText="Required" />     
		</td>
		<td>
			<asp:RequiredFieldValidator ID="reqEntType" runat="server" 
                ControlToValidate="Entity_TypeTextBox" ErrorMessage="(Required)" Display="Dynamic"></asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="regExpType" runat="server" ErrorMessage="(Must be I or G)" 
                ControlToValidate="Entity_TypeTextBox" ValidationExpression="^[i,g,I,G]{1}$"
                 SetFocusOnError="True" Display="Dynamic" />
		</td>

	</tr>
	<tr><td>(Enter &quot;i&quot; for &quot;Individual&quot; or &quot;g&quot; for group)</td></tr>

	<tr>
		<td>Support Type:</td>

		<td>
			<asp:TextBox ID="Entity_Support_TypeTextBox" runat="server" 
                Text='<%# Bind("Entity_Support_Type") %>' CausesValidation="True" 
                MaxLength="50" Height="20px" Width="30px" />
			<asp:Image ID="imgRequired4" runat="server" ImageUrl="images/Red_Star.gif" Height="15px" Width="15px" AlternateText="Required" />  
		</td>
		<td>
			<asp:RequiredFieldValidator ID="reqSuppType" runat="server" ErrorMessage="(Required)" 
                ControlToValidate="Entity_Support_TypeTextBox" Display="Dynamic" />
             <asp:RegularExpressionValidator ID="regExpSupportType" runat="server" ErrorMessage="(Must be V, D, or B)" 
                ControlToValidate="Entity_Support_TypeTextBox" ValidationExpression="^[b,d,v,B,D,V]{1}$"
                 SetFocusOnError="True" Display="Dynamic" />   
		</td>	

	</tr>
	<tr><td>(Enter "v" for "Volunteer", "d" for "Donor", or "b" for "Both")</td></tr>

</table>
		

		
		

            
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Add New" OnClientClick="return confirm('Send Information to the Database?');"/>
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" PostBackUrl="Default.aspx" />
        </InsertItemTemplate>
        
        <ItemTemplate>
            
            Organization Name:
            <asp:Label ID="Entity_Organization_NameLabel" runat="server" 
                Text='<%# Bind("Entity_Organization_Name") %>' />
            <br />
            First Name:
            <asp:Label ID="Entity_Contact_FNameLabel" runat="server" 
                Text='<%# Bind("Entity_Contact_FName") %>' />
            <br />
            Middle Name:
            <asp:Label ID="Entity_Contact_MNameLabel" runat="server" 
                Text='<%# Bind("Entity_Contact_MName") %>' />
            <br />
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
            <br />
            State:
            <asp:Label ID="Entity_StateLabel" runat="server" 
                Text='<%# Bind("Entity_State") %>' />
            <br />
            ZipCode:
            <asp:Label ID="Entity_ZipCodeLabel" runat="server" 
                Text='<%# Bind("Entity_ZipCode") %>' />
            <br />
            Email:
            <asp:Label ID="Entity_EmailLabel" runat="server" 
                Text='<%# Bind("Entity_Email") %>' />
            <br />
            Phone:
            <asp:Label ID="Entity_PhoneLabel" runat="server" 
                Text='<%# Bind("Entity_Phone") %>' />
            <br />
            Type:
            <asp:Label ID="Entity_TypeLabel" runat="server" 
                Text='<%# Bind("Entity_Type") %>' />
            <br />(Enter "i" for "Individual" or "g" for group)<br />
            Support Type:
            <asp:Label ID="Entity_Support_TypeLabel" runat="server" 
                Text='<%# Bind("Entity_Support_Type") %>' />
            <br />(Enter "v" for "Volunteer", "d" for "Donor", or "b" for "Both")<br />
            
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');"/>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
    </asp:FormView>
    
        <asp:ObjectDataSource ID="srcEntity" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" SelectMethod="Select" TypeName="Entity" 
            UpdateMethod="Update" DataObjectTypeName="Entity">
            <UpdateParameters>
                <asp:Parameter Name="oldEntity" Type="Object" />
                <asp:Parameter Name="newEntity" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>    
    
    

    </asp:Panel>


    <asp:Panel ID="Panel2" runat="server" Font-Italic="False" Visible="False">
        The new Volunteer has been submitted to the database.<br />
        Would you like to add another Volunteer?<br />
        <asp:LinkButton ID="lbtnYes" runat="server" onclick="lbtnYes_Click">YES</asp:LinkButton><asp:LinkButton ID="lbtnNo" runat="server" onclick="lbtnNo_Click">NO</asp:LinkButton></asp:Panel></asp:Content>