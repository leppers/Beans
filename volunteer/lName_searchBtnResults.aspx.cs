using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lName_searchBtnResults : System.Web.UI.Page
{

    protected void lName_searchBtn_Click(object sender, EventArgs e)
    {
        grdLname.Visible = true;
        SqlDataSource1.SelectParameters.Add("lastname", lastNameSearch_bx.Text);
        SqlDataSource1.SelectCommand = "SELECT Entity_ID, Entity_LName, Entity_FName, Entity_MName, Entity_Phone WHERE (Entity_LName = @lastname)";
    }
    protected void lbtnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("volunteer.aspx");
    }
    protected void grdLname_SelectedIndexChanged(object sender, EventArgs e)
    {
        grdLname.Visible = false;
        DetailsView1.Visible = true;
    }
}