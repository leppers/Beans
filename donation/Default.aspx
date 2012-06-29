<%@ Page Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="donation_Default" Title="Donation Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<h1>Bean's Donation System</h1>
      <asp:Button ID="btnAddDonation" runat="server" Text="Add Donation" 
        onclick="btnAddDonation_Click" />
    <asp:Button ID="btnSearchDonation" runat="server" Text="Search Donation" 
        onclick="btnSearchDonation_Click" />
    <asp:Button ID="btnManageDonors" runat="server" Text="Manage Donors" 
        onclick="btnManageDonors_Click" />
        <br />
        <asp:Label ID="lblInvalidDonation" runat="server" Text="" Visible="false" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="viewAddDonation" runat="server">
            <asp:ValidationSummary 
            ID="DonationValidation" 
            runat="server"
            EnableClientScript="true" 
            DisplayMode="BulletList"
            HeaderText="Please enter a value in in the following fields:" 
            ValidationGroup="Donation" />
           <table border="Solid">
               <tr>
                <th><h5>Donor Name
                  <asp:RequiredFieldValidator 
                            ID="DonorNameValidator" 
                            runat="server" 
                            ErrorMessage="Donor Name" 
                            Display="Dynamic"
                            Text="*"
                            InitialValue="" 
                            ControlToValidate="ddlDonorID" ValidationGroup="DonationItem" /></h5>
                             </th>
                  <th><h5>Action
                            <asp:RequiredFieldValidator 
                            ID="ActionValidator" 
                            runat="server" 
                            ErrorMessage="Action Required" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="ddlAction" ValidationGroup="DonationItem" />
                            </h5></th>
                   
                   <th><h5>Employee Name
                     <asp:RequiredFieldValidator 
                            ID="EmployeeNameValidator" 
                            runat="server" 
                            ErrorMessage="Employee Name" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic"
                            ControlToValidate="ddlEmployeeID" ValidationGroup="DonationItem" />
                    </h5></th>
                    <th><h5>Date/Time</h5></th>
                </tr>
                <tr>
                    <td><asp:DropDownList 
                            ID="ddlDonorID" 
                            name="ddlDonorID" 
                            runat="server" 
                            ValidationGroup="DonationItem" />
                       
                    </td>
                    <td><asp:DropDownList 
                             ID="ddlAction" 
                             name="ddlAction" 
                             runat="server" 
                             ValidationGroup="DonationItem" AutoPostBack="True" >
                        <asp:ListItem>In</asp:ListItem>
                        <asp:ListItem>Out</asp:ListItem>
                        <asp:ListItem>Waste</asp:ListItem>
                        </asp:DropDownList>
                    </td>                   
                    <td><asp:DropDownList 
                            ID="ddlEmployeeID" 
                            name="ddlEmployeeID" 
                            runat="server" 
                            ValidationGroup="DonationItem" />
                    </td>
                    <td><asp:Label ID="txtDateTime" runat="server" BackColor="InactiveCaption" /></td>
                    
                </tr>
           </table>

            <br />
           
           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DBConnectionString %>" 
                SelectCommand="SELECT [Entity_ID], [Contact_FName], [Contact_LName] FROM [Entity]">
            </asp:SqlDataSource>
      
             
            <!-- Start Repeater -->
            <asp:Repeater ID="LineItemRepeater" runat="server">
            <HeaderTemplate>
            <h3>Current Items</h3>
            <asp:Table ID="tblAddItemHeader" runat="server" GridLines="Vertical" Height="32px" Width="700px" BorderStyle="Solid" BorderColor="#CCCCCC" BorderWidth="1">
               <asp:TableRow ID="tblRowHeader" runat="server">
                    <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" Text="ItemID" Width="153px" />
                    <asp:TableHeaderCell ID="TableHeaderCell5" runat="server" Text="Item Type" Width="154px" />
                    <asp:TableHeaderCell ID="TableHeaderCell9" runat="server" Text="Description" Width="154px" />
                    <asp:TableHeaderCell ID="TableHeaderCell6" runat="server" Text="Weight" Width="154px" />
                   
                </asp:TableRow>
               </asp:Table>
            </HeaderTemplate>
            <ItemTemplate>          
           <asp:Table ID="tblAddItemTemplate" runat="server" Width="800px" GridLines="Both" BorderStyle="Solid" BorderWidth="1" BorderColor="#CCCCCC">
             <asp:TableRow ID="tblRow1" runat="server">
                    <asp:TableCell ID="TableCell1" runat="server">
                        <asp:Label ID="txtItemID" runat="server" Width="150px" Text='<%# ((DonationItem)Container.DataItem).ItemID  %>' ReadOnly="true" />
                </asp:TableCell><asp:TableCell ID="TableCell2" runat="server">
                    <asp:Label ID="txtItemType" runat="server" Width="150px" Text='<%# ((DonationItem)Container.DataItem).CategoryName  %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell6" runat="server">
                    <asp:Label ID="txtDescription" runat="server" Width="150px" Text='<%# ((DonationItem)Container.DataItem).ItemDescription  %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell3" runat="server">
                    <asp:Label ID="txtItemWeight" runat="server" Width="150px" Text='<%# ((DonationItem)Container.DataItem).ItemWeight  %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell5" runat="server">  
                     <asp:Button ID="btnDeleteItem" runat="server" Text=" Delete " onclick="btnDeleteItem_Click"  />
                </asp:TableCell></asp:TableRow></asp:Table></ItemTemplate></asp:Repeater><!-- End Repeater --><br />
           <!-- Add Item Section -->
            <asp:ValidationSummary 
            ID="DonationItemSummary" 
            runat="server"
            EnableClientScript="true" 
            DisplayMode="BulletList"
            HeaderText="Please enter a value in in the following fields:" 
            ValidationGroup="DonationItem" />
           <h3>Add Item</h3><table border="Solid">
                    <tr><th>Category <asp:RequiredFieldValidator 
                            ID="AddItemTypeValidator" 
                            runat="server" 
                            ErrorMessage="Item Type" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="ddlAddItemType" 
                            ValidationGroup="DonationItem" />
                     </th><th>Description <asp:RequiredFieldValidator 
                            ID="AddItemDescriptionValidator" 
                            runat="server" 
                            ErrorMessage="Item Description" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="txtAddItemDescription" 
                            ValidationGroup="DonationItem" />
                         </th><th>Weight <asp:RequiredFieldValidator 
                            ID="AddItemWeightValidator" 
                            runat="server" 
                            ErrorMessage="Weight" 
                            Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="txtAddItemWeight" 
                            ValidationGroup="DonationItem" />
                             <asp:RangeValidator ID="RangeValidator1" 
                             runat="server" 
                             ErrorMessage="Number Between 0 - 1000" 
                            Text="*"
                            
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="txtAddItemWeight" 
                            ValidationGroup="DonationItem" 
                            MaximumValue="1000" 
                            MinimumValue="0" 
                            Type="Double" />
                            
                            </th></tr>
                 <asp:Label 
                 ID="txtAddItemID" 
                 runat="server" Visible="false" />
                <tr><td>
                                      
            <asp:DropDownList 
                ID="ddlAddItemType" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Category_Name" 
                DataValueField="Category_ID"  Width="150px" AppendDataBoundItems="True" 
                ValidationGroup="DonationItem" EnableViewState="False" />
                </td><td>
            <asp:TextBox ID="txtAddItemDescription" runat="server" ValidationGroup="DonationItem" EnableViewState="False" />
            </td><td>
            <asp:TextBox ID="txtAddItemWeight" runat="server" ValidationGroup="DonationItem" EnableViewState="False" />
           lbs</td><td>
            <asp:Button 
                ID="btnAddItem" runat="server" Text=" Add " onclick="btnAddItem_Click" 
                ValidationGroup="DonationItem"  />
                 </td></tr></table>
                <asp:SqlDataSource ID="SqlDataSource2" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
                SelectCommand="SELECT [Category_Name], [Category_ID] FROM [Category]" />
               <br />
               
 
            <asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click"/>
                <asp:Button ID="btnCancel2" runat="server"  onclick="btnCancel_Click"
                Text="Cancel" CommandName="Cancel" />
     
           
           
                
           </asp:View>
           
                
           <asp:View ID="FinishView" runat="server">
            <asp:GridView ID="GVDonationFinish"  Width="700px"
                runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="Donation_ID" DataSourceID="SqlDataSource3">
                <Columns>
                <asp:BoundField 
                        DataField="Donation_ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Donation_ID" />
                <asp:BoundField 
                        DataField="Donation_DateTime" HeaderText="DateTime" 
                        SortExpression="Donation_DateTime" />
                <asp:BoundField 
                        DataField="Entity_Contact_FName" HeaderText="FirstName" 
                        SortExpression="Entity_Contact_FName" />
                <asp:BoundField 
                        DataField="Entity_Contact_LName" HeaderText="LastName" 
                        SortExpression="Entity_Contact_LName" />
                <asp:BoundField DataField="Donation_Action" 
                        HeaderText="Action" SortExpression="Donation_Action" />
                <asp:BoundField DataField="Employee_FName" 
                        HeaderText="Emp FirstName" SortExpression="Employee_FName" />
                <asp:BoundField 
                        DataField="Employee_LName" HeaderText="Emp LastName" 
                        SortExpression="Employee_LName" /></Columns></asp:GridView>
        <br />
    
        
        <asp:GridView ID="gvLineItem" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="DonLin_ID,Donation_ID" Width="700px" 
                DataSourceID="SqlDataSource5" AllowSorting="True"><Columns><asp:BoundField 
                        DataField="DonLin_ID" HeaderText="Item ID" 
                        ReadOnly="True" SortExpression="DonLin_ID" />
                        <asp:BoundField 
                        DataField="Donation_ID" HeaderText="Donation ID" ReadOnly="True" 
                        SortExpression="Donation_ID" />
                        <asp:BoundField 
                        DataField="Category_Name" HeaderText="Category Name" 
                        SortExpression="Category_Name" />
                        <asp:BoundField 
                        DataField="Item_Description" HeaderText="Item Description" 
                        SortExpression="Item_Description" />
                        <asp:BoundField DataField="DonLin_Weight" 
                        HeaderText="Weight" SortExpression="DonLin_Weight" />
                        </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource 
                ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
                
                SelectCommand="SELECT DonLin.DonLin_ID, DonLin.Donation_ID, DonLin.DonLin_Weight, DonLin.Item_Description, Category.Category_Name FROM DonLin INNER JOIN Category ON DonLin.Category_ID = Category.Category_ID WHERE (DonLin.Donation_ID = @Donation_ID)"><SelectParameters><asp:ControlParameter 
                        ControlID="hfDonationID" Name="Donation_ID" PropertyName="Value" 
                        Type="Int32" /></SelectParameters></asp:SqlDataSource>
                        <h5>
                      
                        <asp:LinkButton 
                    ID="lnkPrint" runat="server" Text="Print" onclick="lnkPrint_Click" />&nbsp;&nbsp;|&nbsp;&nbsp; <asp:LinkButton ID="lnkClose" runat="server" Text="Close" OnClick="lnkClose_Click" /></h5>
  
                
                <br />
                <asp:SqlDataSource 
                ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
                
                
                SelectCommand="SELECT Donation.Donation_ID, Donation.Donation_DateTime, Donation.Donation_Action, Employee.Employee_FName, Employee.Employee_LName, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName FROM Donation INNER JOIN Employee ON Donation.Employee_ID = Employee.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE (Donation.Donation_ID = @Donation_ID)"><SelectParameters>
                <asp:ControlParameter 
                        ControlID="hfDonationID" Name="Donation_ID" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:View>
           </asp:MultiView>
            <asp:HiddenField ID="hfDonationID" runat="server" />
            <br />
         </asp:Content>