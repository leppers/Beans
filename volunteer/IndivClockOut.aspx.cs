using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndivClockOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        grdIndivClockOut.Visible = true;
        
    }
    protected void grdIndivClockOut_SelectedIndexChanged(object sender, EventArgs e)
    {
        srcClockOut.UpdateParameters["Entity_ID"].DefaultValue = grdIndivClockOut.SelectedValue.ToString();
        srcClockOut.UpdateParameters["ClockoutTime"].DefaultValue = DateTime.Now.ToString();
        srcClockOut.Update();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
}
