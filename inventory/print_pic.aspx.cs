using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_receipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string PICID = Request.QueryString["PICID"];
        if (PICID != null)
            lblPICID.Text = PICID;

        if (!IsPostBack)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Print", "javascript:window.print();", true);
        }


    }
    protected void lnkClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
