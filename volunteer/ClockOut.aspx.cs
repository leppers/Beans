using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClockOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clockOutDate = DateTime.Today.ToString("yyyy-MM-dd HH:mm tt");
        //SqlDataSource1.SelectParameters.Add("orgSelected", clockOutDate);
        SqlDataSource1.SelectParameters.Add("clockOutDate", clockOutDate);
        SqlDataSource1.SelectCommand = "SELECT Entity.Entity_Organization_Name, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Phone FROM Volunteer INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID WHERE (Volunteer.Clock_In IS NOT NULL) AND (Volunteer.Clock_In LIKE '%' + @clockOutDate + '%' ) ";
    }
}
