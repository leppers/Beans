using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class RecoverPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PanelReset.Visible = true;
        PanelComplete.Visible = false;

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        int num = random.Next(1000);
        string username = txtUserName.Text;
        string password = "C@fe" + num;
        MembershipUser mu = Membership.GetUser(username);
        mu.ChangePassword(mu.ResetPassword(), password);
        PanelReset.Visible = false;
        PanelComplete.Visible = true;
        lblPassword.Text = password.ToString();
    }
}
