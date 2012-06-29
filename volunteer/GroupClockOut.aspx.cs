using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GroupClockOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
                
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        grdWorkList.Visible = true;

    }
    protected void grdWorkList_SelectedIndexChanged(object sender, EventArgs e)
    {
        srcWorkList.UpdateParameters["Entity_ID"].DefaultValue = grdWorkList.SelectedValue.ToString();
        srcWorkList.UpdateParameters["ClockOut"].DefaultValue = DateTime.Now.ToString();        
        srcWorkList.Update();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    
}
