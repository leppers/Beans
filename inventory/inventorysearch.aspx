<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Inventory.master" AutoEventWireup="true" CodeFile="inventorysearch.aspx.cs" Inherits="inventorysearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div class="inner">

<h1>Search Inventory</h1>
<h5>Search By: 
    <asp:DropDownList ID="ddlSearchBy" runat="server" 
        OnSelectedIndexChanged="LoadSearchTool" AutoPostBack="True" 
        onload="LoadSearchTool" ontextchanged="LoadSearchToolChange">
        <asp:ListItem>Select Option</asp:ListItem>
      
        <asp:ListItem>Lastname</asp:ListItem>
       
        <asp:ListItem Value="DateRange">Date Range</asp:ListItem>
    </asp:DropDownList>
</h5>
   

<h5>Please Complete Field(s) Below:</h5>
    <asp:Panel ID="PanelLastName" runat="server">
        <h5>Donor Last Name: <asp:DropDownList 
                            ID="ddlEmployeeID" 
                            name="ddlEmployeeID" 
                            runat="server" DataSourceID="SqlDataSource2" 
                DataTextField="Employee_LName" DataValueField="Employee_ID"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                SelectCommand="SELECT [Employee_LName], [Employee_ID] FROM [Employee]">
            </asp:SqlDataSource>
        <asp:Button ID="btnSearchName" runat="server" Text="Search" 
                onclick="btnSearchName_Click" /></h5>
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
    
  
   <asp:Panel runat="server" ID="QueryPanel" Visible="False">
   
         <asp:GridView ID="gv_inventoryResults" runat="server" AllowSorting="True" 
             AutoGenerateColumns="False" DataKeyNames="PIC_ID" DataSourceID="SqlDataSource1" 
             Width="700px">
             <Columns>
                 <asp:TemplateField ShowHeader="False">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                             CommandName="Select" OnClick="LinkButton1_Click" Text="Select"></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="PIC_ID" HeaderText="ID" InsertVisible="False" 
                     ReadOnly="True" SortExpression="PIC_ID" />
                 <asp:BoundField DataField="Employee_FName" HeaderText="FirstName" 
                     SortExpression="Employee_FName" />
                 <asp:BoundField DataField="Employee_LName" HeaderText="LastName" 
                     SortExpression="Employee_LName" />
                 <asp:BoundField DataField="PIC_Date" HeaderText="Date Entered" 
                     SortExpression="PIC_Date" />
             </Columns>
             <EmptyDataTemplate>
                 <h5>No Match Found.</h5>
             </EmptyDataTemplate>
         </asp:GridView>
   
   
   <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" >
   
         </asp:SqlDataSource>
         </asp:Panel>
       <asp:Panel runat="server" ID="LineItempanel" Visible="False">
         <br />
         <asp:GridView ID="gvLineItem" runat="server" AllowSorting="True" 
             AutoGenerateColumns="False" DataKeyNames="PIC_Item_ID,PIC_ID" 
             DataSourceID="SqlDataSource5" Width="700px">
             <Columns>
                 <asp:BoundField DataField="PIC_ID" HeaderText="ID" InsertVisible="False" 
                     ReadOnly="True" SortExpression="PIC_ID" />
                 <asp:BoundField DataField="PIC_Item_ID" HeaderText="Line Item" ReadOnly="True" 
                     SortExpression="PIC_Item_ID" />
                 <asp:BoundField DataField="Item_Name" HeaderText="Item Name" 
                     SortExpression="Item_Name" />
                 <asp:BoundField DataField="Unit_Name" HeaderText="Unit" 
                     SortExpression="Unit_Name" />
                 <asp:BoundField DataField="Item_Desc" HeaderText="Description" 
                     SortExpression="Item_Desc" />
                 <asp:BoundField DataField="Location_Name" HeaderText="Location" 
                     SortExpression="Location_Name" />
                 <asp:BoundField DataField="PIC_Item_Quantity" HeaderText="Quantity" 
                     SortExpression="PIC_Item_Quantity" />
             </Columns>
             <EmptyDataTemplate>
                <h5>No Items Found</h5>
             </EmptyDataTemplate>
         </asp:GridView>
           <h5>
               <asp:LinkButton ID="lnkPrint" runat="server" onclick="lnkPrint_Click" 
                   Text="Print" />
           </h5>
         <br />
         <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
             SelectCommand="SELECT PIC_LineItem.PIC_Item_ID, PIC_LineItem.PIC_ID, Inventory_Item.Item_Name, Unit.Unit_Name, PIC_LineItem.Item_Desc, Location.Location_Name, PIC_LineItem.PIC_Item_Quantity FROM PIC_LineItem INNER JOIN Unit ON PIC_LineItem.Unit_ID = Unit.Unit_ID INNER JOIN Inventory_Item ON Unit.Item_ID = Inventory_Item.Item_ID INNER JOIN Location ON PIC_LineItem.Location_ID = Location.Location_ID WHERE (PIC_LineItem.PIC_ID = @PIC_ID)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="gv_inventoryResults" Name="PIC_ID" 
                     PropertyName="SelectedValue" />
             </SelectParameters>
         </asp:SqlDataSource>
       
        </asp:Panel>


   


</div>
</asp:Content>

