<%@ Page Language="C#" MasterPageFile="~/MasterPages/Inventory.master" AutoEventWireup="true" CodeFile="PIC.aspx.cs" EnableEventValidation="false" Inherits="PIC" Title="Physical Inventory Count" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
<Services>
<asp:ServiceReference Path="CascadingDropDown.asmx" />
</Services>
</asp:ScriptManager>
<script type="text/javascript">
//    function pageLoad() {
//        var foo = $find("ctl00_ContentPlaceHolder_ddlAddUnit");
//        var so = $find("ctl00_ContentPlaceHolder_txtAddItemType");
//    foo._contextKey = so.value;
//}

    function TextChanged(textbox) {
        var ds = $find("cascade");
    ds._contextKey = textbox.value;
     ds._onParentChange(null, false);

  
}
</script>
    <div class="inner">
    <h1>Bean's Inventory System</h1>
   
    <asp:Button ID="btnAddInventory" runat="server" Text="Add Inventory Count" 
        onclick="btnAddInventory_Click" />
    <asp:Button ID="btnSearchInventory" runat="server" Text="Search Inventory Count" 
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
                    <td><asp:Label ID="txtDateTime" runat="server" /></td>
                    
                </tr>
           </table>
           
        <br />
            
            <!-- Start Repeater -->
            <asp:Repeater ID="LineItemRepeater" runat="server">
            <HeaderTemplate>
            <h3>Current Items</h3>
            <asp:Table ID="tblAddItemHeader" runat="server" GridLines="Vertical" Height="32px" Width="700px" BorderStyle="Solid">
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
           <asp:Table ID="tblAddItemTemplate" runat="server" Width="800px" BorderStyle="Solid" GridLines="Horizontal">
             <asp:TableRow ID="tblRow1" runat="server" Width="700px">
                    <asp:TableCell ID="TableCell1" runat="server" Width="150px">
                        <asp:Label ID="txtItemID" runat="server" Text='<%# ((inventoryItem)Container.DataItem).ItemName  %>' ReadOnly="true" />
                 </asp:TableCell><asp:TableCell ID="TableCell2" Width="150px" runat="server">
                    <asp:Label ID="txtItemType" runat="server" Text='<%# ((inventoryItem)Container.DataItem).UnitName %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell6" Width="150px" runat="server">
                    <asp:Label ID="txtDescription" runat="server" Text='<%# ((inventoryItem)Container.DataItem).ItemDescription  %>' ReadOnly="true"/>
                </asp:TableCell><asp:TableCell ID="TableCell4" Width="150px" runat="server">
                        <asp:Label ID="TextBox1" runat="server" Text='<%# ((inventoryItem)Container.DataItem).LocationName  %>' ReadOnly="true" />
                </asp:TableCell><asp:TableCell ID="TableCell3" Width="100px" runat="server">
                    <asp:Label ID="txtItemWeight" runat="server" Text='<%# ((inventoryItem)Container.DataItem).ItemQty  %>' ReadOnly="true"/>
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
                            ControlToValidate="txtAddItemType" 
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
                            <asp:RegularExpressionValidator ID="ItemQtyNumberOnly"
                            runat="server" ErrorMessage="Whole Number Only" Text="*"
                            Display="Dynamic" ValidationGroup="InventoryItem"
                            ControlToValidate="txtAddItemQuantity" ValidationExpression="^\d{1,5}$" />
                            </th></tr>
                 <asp:Label 
                 ID="txtAddItemID" 
                 runat="server" Visible="false" />
                <tr><td>
                
            <asp:TextBox ID="txtAddItemType" runat="server" onchange="TextChanged(this)" />
            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" 
                runat="server"
                ServiceMethod="GetItemInfo" 
                ServicePath="~/CascadingDropDown.asmx"
                TargetControlID="txtAddItemType"
                MinimumPrefixLength="1">
            </cc1:AutoCompleteExtender>
    
            <!--<asp:DropDownList 
                ID="ddlAddItemType" 
                runat="server"
                ValidationGroup="InventoryItem" 
                Visible="false"/>
            <cc1:CascadingDropDown ID="cddItemType" 
                runat="server" 
                TargetControlID="ddlAddItemType" 
                ServiceMethod="GetItems" 
                LoadingText="Loading..." 
                PromptText="Please Select Item" 
                ServicePath="CascadingDropDown.asmx" 
                Category="Item" /> -->
                </td>
    
                <td>
            <asp:DropDownList 
                ID="ddlAddUnit" runat="server"
                ValidationGroup="InventoryItem"/>
            <cc1:CascadingDropDown 
                ID="cddItemUnit" runat="server"
                LoadingText="Populating..." 
                Category="Unit" 
                 
                
                TargetControlID="ddlAddUnit" 
                ServiceMethod="GetUnits" 
                ServicePath="~/CascadingDropDown.asmx"  UseContextKey="True" BehaviorID="cascade" />
                
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
               SelectCommand="SELECT [Location_Name], [Location_ID] FROM [Location] ORDER BY [Location_Name]" />
               
 
            <asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click"/>
                <asp:Button ID="btnCancel2" runat="server"  onclick="btnCancel_Click"
                Text="Cancel" CommandName="Cancel" />
                
</asp:View>
           
                
           <asp:View ID="FinishView" runat="server">
            <asp:GridView ID="GVInventoryFinish" 
                runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="PIC_ID" DataSourceID="SqlDataSource3" Width="700px">
                <Columns>
                <asp:BoundField 
                        DataField="PIC_ID" HeaderText="ID" 
                        SortExpression="PIC_ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField 
                        DataField="Employee_FName" HeaderText="FirstName" 
                        SortExpression="Employee_FName" />
                <asp:BoundField 
                        DataField="Employee_LName" HeaderText="LastName" 
                        SortExpression="Employee_LName" />
                <asp:BoundField 
                        DataField="PIC_Date" HeaderText="Date Entered" 
                        SortExpression="PIC_Date" />
                </Columns></asp:GridView>
        <br />
    
        
        <asp:GridView ID="gvLineItem" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="PIC_Item_ID,PIC_ID" DataSourceID="SqlDataSource5" 
                AllowSorting="True" Width="700px">
                <Columns>
                <asp:BoundField 
                        DataField="PIC_Item_ID" HeaderText="Line Item" 
                        ReadOnly="True" SortExpression="PIC_Item_ID" />
                 <asp:BoundField DataField="Item_Name" 
                        HeaderText="Item Name" SortExpression="Item_Name" />
                 <asp:BoundField 
                        DataField="Unit_Name" HeaderText="Unit" 
                        SortExpression="Unit_Name" />
                 <asp:BoundField DataField="Item_Desc" 
                        HeaderText="Description" SortExpression="Item_Desc" />
                 <asp:BoundField 
                        DataField="Location_Name" HeaderText="Location" 
                        SortExpression="Location_Name" />
                 <asp:BoundField 
                        DataField="PIC_Item_Quantity" HeaderText="Quantity" 
                        SortExpression="PIC_Item_Quantity" />
                        </Columns>
                 </asp:GridView>
                        <asp:SqlDataSource 
                ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                
                
                SelectCommand="SELECT PIC_LineItem.PIC_Item_ID, PIC_LineItem.PIC_ID, Inventory_Item.Item_Name, Unit.Unit_Name, PIC_LineItem.Item_Desc, Location.Location_Name, PIC_LineItem.PIC_Item_Quantity FROM PIC_LineItem INNER JOIN Unit ON PIC_LineItem.Unit_ID = Unit.Unit_ID INNER JOIN Inventory_Item ON Unit.Item_ID = Inventory_Item.Item_ID INNER JOIN Location ON PIC_LineItem.Location_ID = Location.Location_ID WHERE (PIC_LineItem.PIC_ID = @InventoryID)"><SelectParameters><asp:ControlParameter 
                        ControlID="hfInventoryID" Name="InventoryID" PropertyName="Value" />
                        </SelectParameters></asp:SqlDataSource>
                        <h5><asp:LinkButton ID="lnkPrint" runat="server" Text="Print" onclick="lnkPrint_Click" />&nbsp;&nbsp;|&nbsp;&nbsp; <asp:LinkButton 
                    ID="lnkClose" runat="server" Text="Close" onclick="lnkClose_Click" /></h5>
  
                
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
            </div>
</asp:Content>

