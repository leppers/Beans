using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewVolunteer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void InsertButton_click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void FormView1Inserted(object sender, EventArgs e)
    {
        if(Page.IsValid)
        Panel2.Visible = true;
        Panel1.Visible = false;

    }

    protected void lbtnYes_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewVolunteer.aspx");
    }
    protected void lbtnNo_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    
}
