using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VolunteerEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        grdEntity.Visible = true;
    }
    protected void grdEntity_SelectedIndexChanged(object sender, EventArgs e)
    {
        frmEntity.Visible = true;
    }
    protected void frmEntityUpdated(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        pnlUpdated.Visible = true;
    }
    protected void frmEntityDeleted(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        pnlDeleted.Visible = true;
    }
}
