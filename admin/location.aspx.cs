using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class location : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtnAdd_Click(object sender, EventArgs e)
    {
        TextBox locName = (TextBox)GV_Location.FooterRow.FindControl("txtLocationName");
        TextBox locDesc = (TextBox)GV_Location.FooterRow.FindControl("txtLocationDesc");

        if (locName.Text.Length !=0 && locDesc.Text.Length != 0)
        {

            LocationDataSource.InsertCommand = "INSERT INTO Location (Location_Name, Location_Description) VALUES (@locName, @locDesc)";
            LocationDataSource.InsertParameters.Add("locName", locName.Text.ToString());
            LocationDataSource.InsertParameters.Add("locDesc", locDesc.Text.ToString());
            LocationDataSource.Insert();
            GV_Location.DataBind();
        }
    }
}
