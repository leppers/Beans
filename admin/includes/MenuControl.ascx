<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuControl.ascx.cs" Inherits="includes_MenuControl" %>
<ul id="nav" class="dropdown dropdown-linear">
	<li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/Default.aspx" >Home</asp:HyperLink></li>
	<li><span class="dir">Admin</span>
	    <ul>
		    <li><asp:HyperLink  ID="HyperLink3" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/category.aspx">Category</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink5" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/inventory-items.aspx">Items/Units</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink15" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/location.aspx">Locations</asp:HyperLink></li>
		    <li><asp:HyperLink  ID="HyperLink6" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/employee.aspx">Employees</asp:HyperLink></li>
	   		<li><asp:HyperLink  ID="HyperLink17" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/adminreporting.aspx">Reports</asp:HyperLink></li>
	    </ul>
    </li>
	<li><span class="dir">Donation</span>
		<ul>
			<li><asp:HyperLink ID="lnkAddDonation" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/donation/Default.aspx">Add Donation</asp:HyperLink></li>
			<li><asp:HyperLink ID="lnkAddDonor" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/donation/Donor.aspx">Add Donor</asp:HyperLink></li>
			<li><asp:HyperLink ID="lnkSearchDonor" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/donation/Donor.aspx">Search Donor</asp:HyperLink></li>
			<li><asp:HyperLink ID="lnkSearchDonation" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/donation/DonationSearch.aspx">Donation Search</asp:HyperLink></li>
		</ul>
	</li>
	<li><span class="dir">Inventory</span>
		<ul>
			<li><asp:HyperLink  ID="HyperLink2" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/inventory/pic.aspx">Physical Inventory</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink14" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/inventory/inventorysearch.aspx">Inventory Search</asp:HyperLink></li>
			
		</ul>
	</li>
	<li><span class="dir">Volunteer</span>
		<ul>
			<li><asp:HyperLink  ID="HyperLink4" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/volunteer/Default.aspx">Clock-In/Out</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink12" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/volunteer/Calendar.aspx">Calendar</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink13" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/VolunteerEdit.aspx">New Volunteer</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink10" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/SchedulingHome.aspx">Scheduling</asp:HyperLink></li>
		 </ul>
	</li>
	<li><span class="dir">Users</span>
	    <ul>
		    <li><asp:HyperLink  ID="HyperLink7" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/users.aspx">Create Users</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink8" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/deleteuser.aspx">Delete Users</asp:HyperLink></li>
			<li><asp:HyperLink  ID="HyperLink9" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/RecoverPassword.aspx">Password Reset</asp:HyperLink></li>
		    <li><asp:HyperLink  ID="HyperLink18" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/admin/changepassword.aspx">Change Password</asp:HyperLink></li>
	    </ul>
    </li>
<li><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="http://www.kbitsystems.com/beans/documentation.aspx" >Documentation</asp:HyperLink></li>
</ul>

