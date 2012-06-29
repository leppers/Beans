using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration.Provider;



public partial class users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       /* CreateUserWizard1.FindControl("RoleList");
        RoleList.DataSource = Roles.GetRolesForUser(User.Identity.Name);
        RoleList.DataBind();*/


    }
    // Activate event fires when user hits "next" in the CreateUserWizard
    public void AssignUserToRoles_Activate(object sender, EventArgs e)
    {


        // Databind list of roles in the role manager system to listbox
        AvailableRoles.DataSource = Roles.GetAllRoles(); ;
        AvailableRoles.DataBind();
    }


    // Deactivate event fires when user hits "next" in the CreateUserWizard 
    public void AssignUserToRoles_Deactivate(object sender, EventArgs e)
    {


        // Add user to all selected roles from the roles listbox
        for (int i = 0; i < AvailableRoles.Items.Count; i++)
        {
            if (AvailableRoles.Items[i].Selected == true)
                Roles.AddUserToRole(CreateUserWizard1.UserName, AvailableRoles.Items[i].Value);
        }
    }


    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
