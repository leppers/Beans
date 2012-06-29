using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class volunteer_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOrganization_Click(object sender, EventArgs e)
    {
        Response.Redirect("GroupClockIn.aspx");
        
    }
    protected void btnIndividual_Click(object sender, EventArgs e)
    {
        Response.Redirect("IndivClockIn.aspx");
        
    }
    protected void btnClkIn_Click(object sender, EventArgs e)
    {
        //Response.Redirect("construction.aspx");
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void btnClkOut_Click(object sender, EventArgs e)
    {
        //Response.Redirect("construction.aspx");
        Response.Redirect("ClockOutHome.aspx");
    }
}
