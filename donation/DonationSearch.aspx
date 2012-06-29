<%@ Page Title="Search Donation" Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="DonationSearch.aspx.cs" Inherits="DonationSearch" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
   
    
<h1>Search Donation</h1>
<h5>Search By: 
    <asp:DropDownList ID="ddlSearchBy" runat="server" 
        OnSelectedIndexChanged="LoadSearchTool" AutoPostBack="True" 
        onload="LoadSearchTool" ontextchanged="LoadSearchTool">
        <asp:ListItem>Select Option</asp:ListItem>
        <asp:ListItem>Organization</asp:ListItem>
        <asp:ListItem>Lastname</asp:ListItem>
        <asp:ListItem>PhoneNumber</asp:ListItem>
        <asp:ListItem Value="DateRange">Date Range</asp:ListItem>
    </asp:DropDownList>
</h5>
 

<h5>Please Complete Field(s) Below:</h5>
    <asp:Panel ID="PanelLastName" runat="server">
        <h5>Donor Last Name: <asp:TextBox ID="txtDonorLastName" runat="server" />
        <asp:Button ID="btnSearchName" runat="server" Text="Search" 
                onclick="btnSearchName_Click" /></h5>
    </asp:Panel>
    <asp:Panel ID="PanelOrganization" runat="server">
        <h5>Donor Organization: &nbsp;<asp:TextBox ID="txtOrganization" runat="server" />
         <asp:Button ID="btnSearchOrg" runat="server" Text="Search" 
                onclick="btnSearchOrg_Click" /></h5>
  </asp:Panel>  
    <asp:Panel ID="PanelPhoneNumber" runat="server">
        <h5>Donor Phone Number: &nbsp;<asp:TextBox ID="txtDonorPhoneNumber" runat="server" />
         <asp:Button ID="btnSearchPhone" runat="server" Text="Search" 
                onclick="btnSearchPhone_Click" /></h5>
  </asp:Panel>  
    <asp:Panel ID="PanelDateRage" runat="server">
    
<h5>Donation Start Date:&nbsp;<asp:TextBox ID="txtDonationStartDate" runat="server" />
    <cc1:CalendarExtender ID="txtDonationDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtDonationStartDate">
    </cc1:CalendarExtender></h5>

 <h5>Donation End Date:&nbsp;<asp:TextBox ID="txtDonationEndDate" runat="server" />
    <cc1:CalendarExtender ID="txtDonationEndDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtDonationEndDate">
    </cc1:CalendarExtender>

<asp:Button ID="btnSearchDate" runat="server" Text="Search" 
         onclick="btnSearchDate_Click" /></h5>
</asp:Panel>
  
    <br />
     <asp:MultiView ID="MV_Search" runat="server">   
  
     <asp:View ID="QueryResultView" runat="server">
    <asp:GridView ID="gv_donation" runat="server" AutoGenerateColumns="False" Width="800px"
        DataKeyNames="Donation_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" onclick="LinkButton1_Click" Text="Select"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Donation_ID" HeaderText="Donation ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="Donation_ID"  />
             <asp:BoundField DataField="Entity_Contact_FName" HeaderText="FirstName" 
                SortExpression="Entity_Contact_FName" />
            <asp:BoundField DataField="Entity_Contact_LName" 
                HeaderText="LastName" SortExpression="Entity_Contact_LName" />
            <asp:BoundField DataField="Entity_Organization_Name" 
                HeaderText="Organization" SortExpression="Entity_Organization_Name" />
            <asp:BoundField DataField="Donation_Action" HeaderText="Action" 
                SortExpression="Donation_Action" />
           
            <asp:BoundField DataField="Employee_FName" HeaderText="Employee FirstName" 
                SortExpression="Employee_FName" />
            <asp:BoundField DataField="Employee_LName" HeaderText="Employee LastName" 
                SortExpression="Employee_LName" />
                <asp:BoundField DataField="Donation_DateTime" HeaderText="DateTime" 
                SortExpression="Donation_DateTime" />
        </Columns>
    </asp:GridView>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" />

       
        </asp:View>
        <asp:View ID="SearchResultView" runat="server">
       <h1>Donation Information</h1>
        <asp:DataList ID="dl_donation" runat="server" DataKeyField="Donation_ID" 
            DataSourceID="SqlDataSource3">
            <ItemTemplate>
            <table width='800px' border='1'>
            <tr>
            <th>Donation ID</th><th>Entity</th><th>DateTime</th><th> Action</th><th>Donation Value</th><th>Employee</th>
            </tr>
            <tr>
             <td> <asp:Label ID="Donation_IDLabel" runat="server" 
                    Text='<%# Eval("Donation_ID") %>' /></td> 
            <td> <asp:Label ID="lblEntityName" runat="server" 
                    Text='<%# Eval("Entity_Contact_FName") + " " + Eval("Entity_Contact_LName")%>' /></td> 
            <td> <asp:Label ID="Donation_DateTimeLabel" runat="server" 
                    Text='<%# Eval("Donation_DateTime") %>' /></td> 
            <td><asp:Label ID="Donation_ActionLabel" runat="server" 
                    Text='<%# Eval("Donation_Action") %>' /></td> 
            <td> <asp:Label ID="Employee_FNameLabel" runat="server" 
                    Text='<%# Eval("Employee_FName") + " " + Eval("Employee_LName")  %>' /></td>     
            </tr>
            </table>
      
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
            SelectCommand="SELECT Employee.Employee_FName, Employee.Employee_LName, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Donation.Donation_DateTime, Donation.Donation_ID, Donation.Donation_Action FROM Employee INNER JOIN Donation ON Employee.Employee_ID = Donation.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE ([Donation_ID] = @Donation_ID)">
            <SelectParameters>
                 <asp:ControlParameter ControlID="gv_donation" Name="Donation_ID" 
            PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
   
  
   
    <br />
    <asp:GridView ID="gv_lineItem" runat="server" AutoGenerateColumns="False" Width="800px"
        DataKeyNames="DonLin_ID,Donation_ID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="DonLin_ID" HeaderText="Item #" ReadOnly="True" 
                SortExpression="DonLin_ID" />
            <asp:BoundField DataField="Donation_ID" HeaderText="Donation ID" 
                ReadOnly="True" SortExpression="Donation_ID" />
            <asp:BoundField DataField="Category_Name" HeaderText="Category" 
                SortExpression="Category_Name" />
            <asp:BoundField DataField="Item_Description" HeaderText="Description" 
                SortExpression="Item_Description" />
            <asp:BoundField DataField="DonLin_Weight" HeaderText="Weight" 
                SortExpression="DonLin_Weight" />
        </Columns>
    </asp:GridView>
   
  
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
        
        SelectCommand="SELECT DonLin.DonLin_ID, DonLin.Donation_ID, Category.Category_Name, DonLin.Item_Description, DonLin.DonLin_Weight FROM DonLin INNER JOIN Category ON DonLin.Category_ID = Category.Category_ID WHERE (DonLin.Donation_ID = @Donation_ID)">
    <SelectParameters>
   
        <asp:ControlParameter ControlID="gv_donation" Name="Donation_ID" 
            PropertyName="SelectedValue" Type="Int32" />
   
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:LinkButton 
                    ID="lnkPrint" runat="server" Text="Print" onclick="lnkPrint_Click" /><br />
       <asp:Button ID="btnNewSearch" runat="server" Text="New Search" 
                onclick="btnNewSearch_Click"/> <asp:Button ID="btnBack" runat="server" Text="Back" CommandName="PrevView" />
        </asp:View>
  </asp:MultiView>
   
</asp:Content>

