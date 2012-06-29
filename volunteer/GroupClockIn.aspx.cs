using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class GroupClockIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime todaysDate = DateTime.Now.Date;

        TodayLiteral.Text = todaysDate.ToString();        


    }
    protected void selectBtn_Click(object sender, EventArgs e)
    {
        string orgSelected = ddlOrganization.SelectedValue;
        grdNamebyOrg.Visible = true;
        
        
    }
    protected void grdNamebyOrg_SelectedIndexChanged(object sender, EventArgs e)
    {
        grdNamebyOrg.Visible = false;
        ddlOrganization.Visible = false;
        selectBtn.Visible = false;
        Label1.Visible = false;

        lblNumWorkers.Visible = true;
        txtNumWorkers.Visible = true;
        btnClockIn.Visible = true;
    }

    protected void btnClockIn_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        srcGrdNamebyOrg.UpdateParameters["Entity_ID"].DefaultValue = grdNamebyOrg.SelectedValue.ToString();
        srcGrdNamebyOrg.UpdateParameters["ClockinTime"].DefaultValue = DateTime.Now.ToString();
        srcGrdNamebyOrg.UpdateParameters["NumWorked"].DefaultValue = txtNumWorkers.Text;
        srcGrdNamebyOrg.Update();

    }

   
}
