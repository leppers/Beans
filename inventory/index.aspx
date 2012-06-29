<%@ Page Language="C#" MasterPageFile="~/MasterPages/Inventory.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="inventory_index" Title="Donation Items" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
  <div id="inventory">    
        <div id="inventoryLeftCol">
        <asp:ImageButton ID="fruit_btn" 
            runat="server" 
            ImageUrl="~/images/fruit_btn.gif" 
            AlternateText="Fruit"
            ToolTip="Fruit" 
            ImageAlign="Middle"
            Style="padding-top:10px;" onclick="fruit_btn_Click" />
        <br />
        <br />
        
        <asp:ImageButton ID="vege_btn" 
            runat="server" 
            ImageUrl="~/images/vege_btn.gif"
            AlternateText="Vegetable"
            ImageAlign="Middle" 
            ToolTip="Vegetables"
            Style="padding-top:10px;" onclick="vege_btn_Click" />
            <br /><br />
        
        <asp:ImageButton ID="meat_btn" 
            runat="server" 
            ImageUrl="~/images/meat_btn.gif" 
            AlternateText="Meat" 
            ImageAlign="Middle"
            ToolTip="Meats"
            Style="padding-top:10px;" onclick="meat_btn_Click" />
        <br /><br />
        
        <asp:ImageButton ID="dairy_btn" 
            runat="server" 
            ImageUrl="~/images/dairy_btn.gif" 
            AlternateText="Dairy" 
            ImageAlign="Middle"
            ToolTip="Dairy"
            Style="padding-top:10px;" onclick="dairy_btn_Click" />
        <br /><br />
       
        <asp:ImageButton ID="grain_btn" 
            runat="server" 
            ImageUrl="~/images/grain_btn.gif" 
            AlternateText="Grain" 
            ToolTip="Grains"
            Style="padding-top:10px;" onclick="grain_btn_Click"/>
        <br /><br />
        
        <asp:ImageButton ID="clothes_btn" 
            runat="server" 
            ImageUrl="~/images/clothes_btn.gif" 
            AlternateText="Clothes" 
            ImageAlign="Middle"
            ToolTip="Clothing"
            Style="padding-top:10px;" onclick="clothes_btn_Click" />
        <br /><br />
        
        <asp:ImageButton ID="misc_btn" 
            runat="server" 
            ImageUrl="~/images/misc_btn.gif" 
            AlternateText="Misc" 
            ImageAlign="Middle"
            ToolTip="Miscellaneous"
            Style="padding-top:10px;" onclick="misc_btn_Click" />
            <br /><br />
            </div>
         <div id="inventoryRightCol">
             <asp:TextBox ID="TextBox1" runat="server">Description</asp:TextBox>
              <asp:TextBox ID="TextBox2" runat="server">Weight</asp:TextBox>
               <asp:TextBox ID="TextBox3" runat="server">Value</asp:TextBox>
             <asp:Button ID="Button1" runat="server" Text="Button" />
             
        </div>
    </div>  
</asp:Content>


