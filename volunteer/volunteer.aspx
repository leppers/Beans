<%@ Page Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="volunteer.aspx.cs" Inherits="volunteer" Title="Volunteer Single Column" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div class="inner">
    <asp:Panel ID="Home_Panel" runat="server">
        <h2>Clock-In [Individual]</h2>
        <br/>Enter Your Volunteer ID Number Below<br />
        <asp:TextBox ID="Ent_ID_bx" runat="server"/>
        <asp:Button ID="Clock_INbtn" runat="server" Text="Clock-In" 
            onclick="Clock_INbtn_Click" />
        <br /><br />
        Don't know your Volunteer ID Number?
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Click Here</asp:LinkButton>
    
    </asp:Panel>

    <asp:Panel ID="Lookup_Panel" runat="server" Visible="False">
            <h2>Volunteer Search</h2><br />
    
            Search By:<br />
            <asp:DropDownList ID="ddlSearchSelection" runat="server" 
                            AutoPostBack="True">
                        <asp:ListItem>Select Option</asp:ListItem>
                        <asp:ListItem>Organization</asp:ListItem>
                        <asp:ListItem>Lastname</asp:ListItem>
                        <asp:ListItem>PhoneNumber</asp:ListItem>
            </asp:DropDownList>
    
    <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />
    </asp:Panel> 
    
    <asp:Panel ID="ClockIn_Panel" runat="server">
    
        <!--<asp:GridView ID="grdIDNum" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" DataSourceID="LinqDataSource1">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        
        <asp:LinqDataSource ID="LinqDataSource1" 
                    runat="server" 
                    ContextTypeName="VolunteerDatabaseDataContext" 
                    TableName="Entities"
                    Where="Entity_ID == @VolID"
                    Select="new (Entity_ID, Entity_Contact_LName, Entity_Contact_FName, Entity_Contact_MName, Entity_Phone)">
                    <whereparameters>
                        <asp:controlparameter
                            Name="VolID"
                            ControlID="Ent_ID_bx"                            
                            Type="Int16" />
                            
                    </whereparameters>
        </asp:LinqDataSource> -->
    </asp:Panel>
</div>
</asp:Content>

