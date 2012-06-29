<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_pic.aspx.cs" Inherits="print_receipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Receipt</title>
    <link href="App_Themes/green-Theme/print-style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
        <div id="header-left">
        <asp:Image ID="logo" runat="server" ImageUrl="~/images/beans.JPG" 
            Height="100px" Width="100px" /> 
            </div>
        <div id="header-right">
        <h1>Bean's Cafe, Inc<br />
       P.O. Box 100940 <br />
        Anchorage, AK <br />
        99510-0940<br /> 
        Phone:(907)274-9595</h1>
        </div>
    </div>
    
    <div id="donation">
    <h1>Inventory Count # <asp:Label ID="lblPICID" runat="server" /></h1>
    <h1>Physical Inventory Count</h1>
        <asp:GridView ID="GVInventoryFinish" 
                runat="server" AllowSorting="False" AutoGenerateColumns="False" 
                DataKeyNames="PIC_ID" DataSourceID="SqlDataSource2" Width="600px">
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
            
            
            SelectCommand="SELECT Employee.Employee_FName, Employee.Employee_LName, PIC.PIC_Date, PIC.PIC_ID FROM Employee INNER JOIN PIC ON Employee.Employee_ID = PIC.Employee_ID WHERE (PIC.PIC_ID = @PICID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="PICID" QueryStringField="PICID" />
                    </SelectParameters>
            </asp:SqlDataSource>
            
            <h1>Items Inventoried</h1>
           
       <asp:GridView ID="gvLineItem" runat="server" AutoGenerateColumns="False" Width="600px" 
                DataKeyNames="PIC_Item_ID,PIC_ID" DataSourceID="SqlDataSource5">
              <Columns>
                <asp:BoundField 
                        DataField="PIC_Item_ID" HeaderText="Line Item" 
                        ReadOnly="True" SortExpression="PIC_Item_ID" />
                 <asp:BoundField DataField="Item_Name" 
                        HeaderText="Item Name" SortExpression="Item_Name" />
                 <asp:BoundField 
                        DataField="Unit_Name" HeaderText="Unit" 
                        SortExpression="Unit_Name" />
                 <asp:BoundField 
                        DataField="Location_Name" HeaderText="Location" 
                        SortExpression="Location_Name" />
                 <asp:BoundField 
                        DataField="PIC_Item_Quantity" HeaderText="Quantity" 
                        SortExpression="PIC_Item_Quantity" />
                        </Columns>
                        </asp:GridView><asp:SqlDataSource 
                ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4.1ConnectionString %>" 
                
                
            
            SelectCommand="SELECT PIC_LineItem.PIC_Item_ID, PIC_LineItem.PIC_ID, Unit.Unit_Name, Inventory_Item.Item_Name, Location.Location_Name, PIC_LineItem.PIC_Item_Quantity FROM PIC_LineItem INNER JOIN Unit ON PIC_LineItem.Unit_ID = Unit.Unit_ID INNER JOIN Location ON PIC_LineItem.Location_ID = Location.Location_ID INNER JOIN Inventory_Item ON Unit.Item_ID = Inventory_Item.Item_ID WHERE (PIC_LineItem.PIC_ID = @PICID)">
                <SelectParameters>
                <asp:QueryStringParameter Name="PICID" QueryStringField="PICID" />
                    </SelectParameters>
                        </asp:SqlDataSource>
    </div>
    <div id="footer">
    <asp:LinkButton ID="lnkClose" runat="server" Text="Close" 
            onclick="lnkClose_Click" />
    </div>
    </form>
</body>
</html>
