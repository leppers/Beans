<%@ Page Language="C#" MasterPageFile="~/MasterPages/Inventory.master" AutoEventWireup="true" CodeFile="GVPIC.aspx.cs" EnableEventValidation="false" Inherits="PIC" Title="Physical Inventory Count" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
<Services>
<asp:ServiceReference Path="CascadingDropDown.asmx" />
</Services>
</asp:ScriptManager>
    <h1>Bean's Inventory System</h1>
    Welcome! <asp:Label ID="userName" runat="server" Text="Kevin Browning" /> <br />
    <asp:Button ID="btnAddInventory" runat="server" Text="Add PIC" 
        onclick="btnAddInventory_Click" />
    <asp:Button ID="btnSearchInventory" runat="server" Text="Search PIC" 
        onclick="btnSearchInventory_Click" />
            <asp:Label ID="lblInvalidInventory" runat="server" Text="" Visible="false" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="viewAddInventory" runat="server">
            <asp:ValidationSummary 
            ID="InventoryValidation" 
            runat="server"
            EnableClientScript="true" 
            DisplayMode="BulletList"
            HeaderText="Please enter a value in in the following fields:" 
            ValidationGroup="Inventory" />
           <table border="Solid">
               <tr>
                    <th><h5>Employee Name
                     <asp:RequiredFieldValidator 
                            ID="EmployeeNameValidator" 
                            runat="server" 
                            ErrorMessage="Employee Name" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic"
                            ControlToValidate="ddlEmployeeID" ValidationGroup="Inventory" />
                    </h5></th>
                    <th><h5>Date/Time</h5></th>
                </tr>
                <tr>
                        <td><asp:DropDownList 
                            ID="ddlEmployeeID" 
                            name="ddlEmployeeID" 
                            runat="server" 
                            ValidationGroup="Inventory" />
                    </td>
                    <td><asp:TextBox ID="txtDateTime" runat="server" /></td>
                    
                </tr>
           </table>
           
              <asp:Button 
                ID="btnCreateInventory" runat="server" Text="Create" 
                onclick="btnCreateInventory_Click" ValidationGroup="Inventory" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" 
                onclick="btnCancel_Click" />
            <br />
        </asp:View>
        <asp:View ID="addinventoryItem" runat="server">
        <br />
           <h5>Employee ID: <asp:Label ID="lblEmployeeName" runat="server" Text="" ForeColor="Black" /> &nbsp;|&nbsp;
           Date: <asp:Label ID="lblDateTime" runat="server" Text=""/></h5>
            
            <!-- Start Repeater -->
            <asp:GridView runat="server" ID="LineItemGridView" AutoGenerateColumns="False" 
                DataSourceID="GVLineItemDataSource" >
            <Columns>
            <asp:TemplateField>
            <ItemTemplate>
                <asp:Label runat="server" ID="lblGVItemID" Text='<%# ((inventoryItem)Container.DataItem).ItemID  %>' />
            </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            </asp:GridView>
           
            <asp:Repeater ID="LineItemRepeater" runat="server">
            <HeaderTemplate>
            <h3>Current Items</h3>
            <asp:Table ID="tblAddItemHeader" runat="server" GridLines="Vertical" Height="32px" Width="700px">
               <asp:TableRow ID="tblRowHeader" runat="server">
                    <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" Text="ItemID" Width="153px" />
                    <asp:TableHeaderCell ID="TableHeaderCell5" runat="server" Text="Item Type" Width="154px" />
                    <asp:TableHeaderCell ID="TableHeaderCell9" runat="server" Text="Description" Width="154px" />
                     <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" Text="Location" Width="153px"/>
                    <asp:TableHeaderCell ID="TableHeaderCell6" runat="server" Text="Quantity" Width="154px" />
                   
                </asp:TableRow>
               </asp:Table>
            </HeaderTemplate>
            <ItemTemplate>          
           <asp:Table ID="tblAddItemTemplate" runat="server" Width="700px">
             <asp:TableRow ID="tblRow1" runat="server" Width="700px">
                    <asp:TableCell ID="TableCell1" runat="server" Width="153px">
                        <asp:TextBox ID="txtItemID" runat="server" Text='<%# ((inventoryItem)Container.DataItem).ItemID  %>' ReadOnly="true" />
                 </asp:TableCell><asp:TableCell ID="TableCell2" runat="server">
                    <asp:TextBox ID="txtItemType" runat="server" Text='<%# ((inventoryItem)Container.DataItem).UnitID %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell6" runat="server">
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# ((inventoryItem)Container.DataItem).ItemDescription  %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell4" runat="server">
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# ((inventoryItem)Container.DataItem).LocationID  %>' ReadOnly="true" />
                </asp:TableCell><asp:TableCell ID="TableCell3" runat="server">
                    <asp:TextBox ID="txtItemWeight" runat="server" Text='<%# ((inventoryItem)Container.DataItem).ItemQty  %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell5" runat="server">  
                     <asp:Button ID="btnDeleteItem" runat="server" Text=" Delete " onclick="btnDeleteItem_Click"  />
                </asp:TableCell></asp:TableRow></asp:Table></ItemTemplate></asp:Repeater><!-- End Repeater --><br />
           <!-- Add Item Section -->
            <asp:ValidationSummary 
            ID="InventoryItemSummary" 
            runat="server"
            EnableClientScript="true" 
            DisplayMode="BulletList"
            HeaderText="Please enter a value in in the following fields:" 
            ValidationGroup="InventoryItem" />
           <h3>Add Item</h3><table border="Solid">
                    <tr><th>Item <asp:RequiredFieldValidator 
                            ID="AddItemTypeValidator" 
                            runat="server" 
                            ErrorMessage="Item Type" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="ddlAddItemType" 
                            ValidationGroup="InventoryItem" />
                            
                     </th><th>Unit <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" 
                            runat="server" 
                            ErrorMessage="Unit Type" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="ddlAddUnit" 
                            ValidationGroup="InventoryItem" />
                            
                     </th><th>Description </th><th>Location <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator1" 
                            runat="server" 
                            ErrorMessage="Location" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="ddlAddLocation" 
                            ValidationGroup="InventoryItem" />
                         </th><th>Quantity <asp:RequiredFieldValidator 
                            ID="AddItemQuantityValidator" 
                            runat="server" 
                            ErrorMessage="Quantity" 
                             Text="*"
                            InitialValue="" 
                            Display="Dynamic" 
                            ControlToValidate="txtAddItemQuantity" 
                            ValidationGroup="InventoryItem" />
                            </th></tr>
                 <asp:Label 
                 ID="txtAddItemID" 
                 runat="server" Visible="false" />
                <tr><td>
                                      
            <asp:DropDownList 
                ID="ddlAddItemType" runat="server"
                ValidationGroup="InventoryItem"/>
             
                   
                </td>
                     
                <td>
                <asp:DropDownList 
                ID="ddlAddUnit" runat="server"
                ValidationGroup="InventoryItem"/>
                
                </td>
            <td>
            <asp:TextBox ID="txtAddItemDescription" runat="server" ValidationGroup="InventoryItem" EnableViewState="False" />
            </td>
             <td>
                                      
            <asp:DropDownList 
                ID="ddlAddLocation" runat="server" 
                DataSourceID="SqlLocationDataSource" DataTextField="Location_Name" 
                DataValueField="Location_ID"  Width="150px" AppendDataBoundItems="True" 
                ValidationGroup="InventoryItem" EnableViewState="False" />
                </td>
                <td>
            <asp:TextBox ID="txtAddItemQuantity" runat="server" ValidationGroup="InventoryItem" EnableViewState="False" />
           </td><td>
            <asp:Button 
                ID="btnAddItem" runat="server" Text=" Add " onclick="btnAddItem_Click" 
                ValidationGroup="InventoryItem"  />
                 </td></tr></table>
                <br />
               
                
                <asp:SqlDataSource ID="SqlLocationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>"
               SelectCommand="SELECT [Location_Name], [Location_ID] FROM [Location]" />
               
 
            <asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click"/>
                <asp:Button ID="btnCancel2" runat="server"  onclick="btnCancel_Click"
                Text="Cancel" CommandName="Cancel" />
                
                <cc1:CascadingDropDown ID="cddItemType" runat="server" 
                TargetControlID="ddlAddItemType" ServiceMethod="GetItems" 
                LoadingText="Loading..." PromptText="Please Select Item" ServicePath="CascadingDropDown.asmx" Category="Item" />
                
                <cc1:CascadingDropDown 
                ID="cddItemUnit" runat="server"
                LoadingText="Populating..." 
                Category="Unit" 
                ParentControlID="ddlAddItemType" 
                PromptText="Please Select Unit" 
                TargetControlID="ddlAddUnit" 
                ServiceMethod="GetUnits" 
                ServicePath="~/CascadingDropDown.asmx" /></asp:View>
           
                
           <asp:View ID="FinishView" runat="server">
            <asp:GridView ID="GVInventoryFinish" 
                runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="PIC_ID" DataSourceID="SqlDataSource3">
                <Columns>
                <asp:BoundField 
                        DataField="Employee_FName" HeaderText="Employee_FName" 
                        SortExpression="Employee_FName" /><asp:BoundField 
                        DataField="Employee_LName" HeaderText="Employee_LName" 
                        SortExpression="Employee_LName" /><asp:BoundField 
                        DataField="PIC_Date" HeaderText="PIC_Date" 
                        SortExpression="PIC_Date" /><asp:BoundField 
                        DataField="PIC_ID" HeaderText="PIC_ID" 
                        SortExpression="PIC_ID" InsertVisible="False" ReadOnly="True" /><asp:BoundField DataField="Employee_ID" 
                        HeaderText="Employee_ID" SortExpression="Employee_ID" /></Columns></asp:GridView>
        <br />
    
        
        <asp:GridView ID="gvLineItem" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="PIC_Item_ID,PIC_ID" DataSourceID="SqlDataSource5" 
                AllowSorting="True"><Columns><asp:BoundField 
                        DataField="PIC_Item_ID" HeaderText="PIC_Item_ID" 
                        ReadOnly="True" SortExpression="PIC_Item_ID" /><asp:BoundField 
                        DataField="PIC_ID" HeaderText="PIC_ID" ReadOnly="True" 
                        SortExpression="PIC_ID" /><asp:BoundField DataField="Item_Name" 
                        HeaderText="Item_Name" SortExpression="Item_Name" /><asp:BoundField 
                        DataField="Unit_Name" HeaderText="Unit_Name" 
                        SortExpression="Unit_Name" /><asp:BoundField DataField="Item_Desc" 
                        HeaderText="Item_Desc" SortExpression="Item_Desc" /><asp:BoundField 
                        DataField="Location_Name" HeaderText="Location_Name" 
                        SortExpression="Location_Name" /><asp:BoundField 
                        DataField="PIC_Item_Quantity" HeaderText="PIC_Item_Quantity" 
                        SortExpression="PIC_Item_Quantity" /></Columns></asp:GridView><asp:SqlDataSource 
                ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                
                
                SelectCommand="SELECT PIC_LineItem.PIC_Item_ID, PIC_LineItem.PIC_ID, Inventory_Item.Item_Name, Unit.Unit_Name, PIC_LineItem.Item_Desc, Location.Location_Name, PIC_LineItem.PIC_Item_Quantity FROM PIC_LineItem INNER JOIN Unit ON PIC_LineItem.Unit_ID = Unit.Unit_ID INNER JOIN Inventory_Item ON Unit.Item_ID = Inventory_Item.Item_ID INNER JOIN Location ON PIC_LineItem.Location_ID = Location.Location_ID WHERE (PIC_LineItem.PIC_ID = @InventoryID)"><SelectParameters><asp:ControlParameter 
                        ControlID="hfInventoryID" Name="InventoryID" PropertyName="Value" /></SelectParameters></asp:SqlDataSource><h5><asp:LinkButton 
                    ID="lnkPrint" runat="server" Text="Print" onclick="lnkPrint_Click" />&nbsp;&nbsp;|&nbsp;&nbsp; <asp:LinkButton ID="lnkClose" runat="server" Text="Close" /></h5>
  
                
                <br />
                <asp:SqlDataSource 
                ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                SelectCommand="SELECT Employee.Employee_FName, Employee.Employee_LName, PIC.PIC_Date, PIC.PIC_ID, PIC.Employee_ID FROM Employee INNER JOIN PIC ON Employee.Employee_ID = PIC.Employee_ID WHERE (PIC.PIC_ID = @PIC_ID)"><SelectParameters>
                <asp:ControlParameter 
                        ControlID="hfInventoryID" Name="PIC_ID" PropertyName="Value" /></SelectParameters>
                        </asp:SqlDataSource>
                        </asp:View>
           </asp:MultiView>
            <asp:HiddenField ID="hfInventoryID" runat="server" />
</asp:Content>

