using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class deleteuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlUsernames.DataSource = Membership.GetAllUsers();
            ddlUsernames.DataBind();
            ddlUsernames.Items.Insert(0, "--Select--");
        }
        Msg.Text = "";
    }
    public void YesButton_OnClick(object sender, EventArgs args)
    {
        if (ddlUsernames.SelectedItem.Text == "uaaadmin")
        {
            Msg.Text = "Cannot Delete " + ddlUsernames.SelectedItem.Text;
        }
        else
        {


            Membership.DeleteUser(ddlUsernames.SelectedItem.Text, DeleteRelatedData.Checked);

            ddlUsernames.DataSource = Membership.GetAllUsers();
            ddlUsernames.DataBind();
            ddlUsernames.Items.Insert(0, "--Select--");
        }


    }

    public void CancelButton_OnClick(object sender, EventArgs args)
    {
        Response.Redirect("default.aspx");
    }
}
