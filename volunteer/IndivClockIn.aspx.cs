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
using System.Data.Linq;
using System.Collections.Generic;

public partial class IndivClockIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnSelectLookup_Click(object sender, EventArgs e)
    {
        pnlSearch.Visible = false;

        switch (ddlSearchSelection.SelectedValue)
        {

            case "Lastname":
                {
                    pnlNameLookup.Visible = true;
                    break;
                }
            case "PhoneNumber":
                {
                    pnlNumberLookup.Visible = true;
                    break;
                }
        }

    }




    protected void lbtnYes_Click(object sender, EventArgs e)
    {
        pnlHome.Visible = false;
        pnlSearch.Visible = true;
    }

    protected void btnNameSearch_Click(object sender, EventArgs e)
    {
        grdLastName.Visible = true;
    }
    protected void btnPhoneSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            grdPhone.Visible = true;
    }
    protected void grdLastName_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlNameLookup.Visible = false;
        pnlClockin.Visible = true;
        srcName.UpdateParameters["Entity_ID"].DefaultValue = grdLastName.SelectedValue.ToString();
        srcName.UpdateParameters["ClockInTime"].DefaultValue = DateTime.Now.ToString();

        srcName.Update();
    }
    protected void grdPhone_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlNumberLookup.Visible = false;
        pnlClockin.Visible = true;
        srcPhone.UpdateParameters["Entity_ID"].DefaultValue = grdPhone.SelectedValue.ToString();
        srcPhone.UpdateParameters["ClockinTime"].DefaultValue = DateTime.Now.ToString();

        srcPhone.Update();
    }
}
