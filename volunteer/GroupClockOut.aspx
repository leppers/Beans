<%@ Page Title="Group Clock Out" Language="C#" MasterPageFile="~/MasterPages/Volunteer.master" AutoEventWireup="true" CodeFile="GroupClockOut.aspx.cs" Inherits="GroupClockOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    

    <h2>Volunteer Clock-Out</h2><br />
        <!-- <asp:DropDownList ID="ddlEntities" runat="server" 
         DataSourceID="src_ddlClockout" DataTextField="Entity_Organization_Name" 
            DataValueField="Entity_ID">
        </asp:DropDownList>
    
        <asp:Button ID="btnSelect" runat="server" Text="Select" 
            onclick="btnSelect_Click" />
            <br />
    
     <asp:SqlDataSource ID="src_ddlClockout" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
        SelectCommand="SELECT Entity.Entity_Organization_Name, Entity.Entity_ID,
             Volunteer.Clock_Out, Volunteer.Clock_In FROM Entity INNER JOIN 
             Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift
              ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Volunteer.Clock_In IS NOT NULL)
               AND (Volunteer.Clock_Out IS NULL)"></asp:SqlDataSource> -->
               
        <asp:GridView ID="grdWorkList" runat="server" DataSourceID="srcWorkList" 
         AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Entity_ID" 
         ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grdWorkList_SelectedIndexChanged" Visible="True" 
            Width="423px">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Clock Out" />
                <asp:BoundField DataField="Entity_ID" HeaderText="Volunteer ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Entity_ID" />
                <asp:BoundField DataField="Entity_Organization_Name" 
                    HeaderText="Organization Name" 
                    SortExpression="Entity_Organization_Name" />
                <asp:BoundField DataField="Shift_Name" HeaderText="Shift" 
                    SortExpression="Shift_Name" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView> 
    
         
        <asp:SqlDataSource ID="srcWorkList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Beans_DB_v5ConnectionString %>" 
            SelectCommand="SELECT Entity.Entity_ID, Entity.Entity_Organization_Name, 
                Shift.Shift_Name FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = 
                Volunteer.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID" 
                
            UpdateCommand="UPDATE Volunteer SET Clock_Out = @ClockOut WHERE (Entity_ID = @Entity_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlEntities" Name="ddlSelected" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ClockOut" />
                <asp:Parameter Name="Entity_ID" />                
            </UpdateParameters>
        </asp:SqlDataSource>
        
      </asp:Panel>  
      
      
      
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <h2>You have clocked out</h2><br /> 
        <h2>Thankyou for your time</h2>
        
        
    </asp:Panel>
      
</asp:Content>

