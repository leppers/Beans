<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="VolunteerEdit.aspx.cs" Inherits="VolunteerEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
    
    <h2>Volunteer Maintenance</h2><br />
    
    Enter Volunteer's Last Name in the box Provided<br />
    
    <asp:TextBox ID="txtEntityLastName" runat="server" MaxLength="50"/>
    
    <asp:Button ID="btnSearch" runat="server" Text="Search" 
        onclick="btnSearch_Click" /><br /><br />
        
    
    <asp:GridView ID="grdEntity" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Entity_ID" DataSourceID="srcLinq_grdEntity" 
        onselectedindexchanged="grdEntity_SelectedIndexChanged" Visible="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" ForeColor="Black" GridLines="None" Width="684px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Entity_ID" HeaderText="Volunteer ID" ReadOnly="True" 
                SortExpression="Entity_ID" >
            <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Entity_Organization_Name" 
                HeaderText="Organization Name" ReadOnly="True" 
                SortExpression="Entity_Organization_Name" >
            <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Entity_Contact_LName" 
                HeaderText="Last Name" ReadOnly="True" 
                SortExpression="Entity_Contact_LName" >
            <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Entity_Contact_FName" 
                HeaderText="First Name" ReadOnly="True" 
                SortExpression="Entity_Contact_FName" >
            <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Entity_Contact_MName" 
                HeaderText="Middle Name" ReadOnly="True" 
                SortExpression="Entity_Contact_MName" >
            <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Entity_Phone" HeaderText="Phone" 
                ReadOnly="True" SortExpression="Entity_Phone" >
            <HeaderStyle BorderWidth="2px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    <!-- Adding a new Volunteer? Click <asp:LinkButton ID="lbtnNew" runat="server" CausesValidation="False" 
                CommandName="New" Text="Here" /> -->
    
    
    
    <asp:LinqDataSource ID="srcLinq_grdEntity" runat="server" 
        ContextTypeName="VolunteerDatabaseDataContext" 
        Select="new (Entity_ID, Entity_Organization_Name, Entity_Contact_FName, Entity_Contact_MName, Entity_Contact_LName, Entity_Phone)" 
        TableName="Entities" Where="Entity_Contact_LName == @Entity_Contact_LName">
        <WhereParameters>
            <asp:ControlParameter ControlID="txtEntityLastName" Name="Entity_Contact_LName" 
                PropertyName="Text" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    
        <asp:FormView ID="frmEntity" runat="server" DataSourceID="srcSQL_Entity" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="Entity_ID" ForeColor="Black" GridLines="Vertical"
            OnItemUpdated="frmEntityUpdated" OnItemDeleted="frmEntityDeleted" 
            Width="441px" >
        
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            
       <EditItemTemplate>
            
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
            
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" ForeColor="Black" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                ForeColor="Black" />
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
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
                OnClientClick="return confirm('Are you sure?');" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#663300" Font-Bold="True" ForeColor="White" />
        
        </asp:FormView>
    
    
    
        <asp:SqlDataSource ID="srcSQL_Entity" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            DeleteCommand="DELETE FROM [Entity] WHERE [Entity_ID] = @Entity_ID" 
            InsertCommand="INSERT INTO [Entity] ([Entity_Organization_Name], [Entity_Contact_FName], [Entity_Contact_MName], [Entity_Contact_LName], [Entity_Address1], [Entity_Address2], [Entity_City], [Entity_State], [Entity_ZipCode], [Entity_Email], [Entity_Phone], [Entity_Type], [Entity_Support_Type]) VALUES (@Entity_Organization_Name, @Entity_Contact_FName, @Entity_Contact_MName, @Entity_Contact_LName, @Entity_Address1, @Entity_Address2, @Entity_City, @Entity_State, @Entity_ZipCode, @Entity_Email, @Entity_Phone, @Entity_Type, @Entity_Support_Type)" 
            SelectCommand="SELECT * FROM [Entity] WHERE ([Entity_ID] = @Entity_ID)" 
            UpdateCommand="UPDATE [Entity] SET [Entity_Organization_Name] = @Entity_Organization_Name, [Entity_Contact_FName] = @Entity_Contact_FName, [Entity_Contact_MName] = @Entity_Contact_MName, [Entity_Contact_LName] = @Entity_Contact_LName, [Entity_Address1] = @Entity_Address1, [Entity_Address2] = @Entity_Address2, [Entity_City] = @Entity_City, [Entity_State] = @Entity_State, [Entity_ZipCode] = @Entity_ZipCode, [Entity_Email] = @Entity_Email, [Entity_Phone] = @Entity_Phone, [Entity_Type] = @Entity_Type, [Entity_Support_Type] = @Entity_Support_Type WHERE [Entity_ID] = @Entity_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="grdEntity" Name="Entity_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Entity_ID" Type="Int32" />
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
                <asp:Parameter Name="Entity_ID" Type="Int32" />
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
        
    </asp:Panel>
    
    <asp:Panel ID="pnlUpdated" runat="server" Visible="False">
        <h2>Volunteer has been successfully updated</h2><br />
        Click&nbsp<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="VolunteerEdit.aspx">here</asp:HyperLink>
        &nbsp to edit more Volunteers
    </asp:Panel> 
    
    <asp:Panel ID="pnlDeleted" runat="server" Visible="False">
        <h2>Volunteer has been successfully deleted</h2><br />
        Click&nbsp<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="VolunteerEdit.aspx">here</asp:HyperLink>
        &nbsp to edit more Volunteers
    </asp:Panel>       
                
    
</asp:Content>

