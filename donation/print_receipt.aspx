<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_receipt.aspx.cs" Inherits="print_receipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Receipt</title>
    <link href="App_Themes/plum-Theme/print-style.css" rel="stylesheet" type="text/css" />
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
    <h1>Receipt # <asp:Label ID="lblReceiptID" runat="server" /></h1>
    <h1>Donation Information</h1>
        <asp:DataList ID="dl_donation" runat="server" DataKeyField="Donation_ID" 
            DataSourceID="SqlDataSource2">
            <ItemTemplate>
            <table width='600px' border='1'>
            <tr>
            <th>Donation ID</th><th>Entity</th><th>DateTime</th><th> Action</th><th>Employee</th>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
            SelectCommand="SELECT Employee.Employee_FName, Employee.Employee_LName, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Donation.Donation_DateTime, Donation.Donation_ID, Donation.Donation_Action FROM Employee INNER JOIN Donation ON Employee.Employee_ID = Donation.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE ([Donation_ID] = @Donation_ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Donation_ID" QueryStringField="receiptID" 
                    Type="Int32" />
                    </SelectParameters>
            </asp:SqlDataSource>
            
            <h1>Items Donated</h1>
           
       <asp:GridView ID="gvLineItem" runat="server" AutoGenerateColumns="False" Width="600px" 
                DataKeyNames="DonLin_ID,Donation_ID" DataSourceID="SqlDataSource5"><Columns><asp:BoundField 
                        DataField="DonLin_ID" HeaderText="Item #" 
                        ReadOnly="True" SortExpression="DonLin_ID" />
                        <asp:BoundField 
                        DataField="Category_Name" HeaderText="Category" 
                        SortExpression="Category_Name" />
                        <asp:BoundField 
                        DataField="Item_Description" HeaderText="Description" 
                        SortExpression="Item_Description" />
                        <asp:BoundField DataField="DonLin_Weight" 
                        HeaderText="DonLin_Weight" SortExpression="Weight" />
                        </Columns></asp:GridView><asp:SqlDataSource 
                ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Beans_DB_v4ConnectionString %>" 
                
                SelectCommand="SELECT DonLin.DonLin_ID, DonLin.Donation_ID, DonLin.DonLin_Weight, DonLin.Item_Description, Category.Category_Name FROM DonLin INNER JOIN Category ON DonLin.Category_ID = Category.Category_ID WHERE (DonLin.Donation_ID = @Donation_ID)">
                <SelectParameters>
                <asp:QueryStringParameter Name="Donation_ID" QueryStringField="receiptID" 
                    Type="Int32" />
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
