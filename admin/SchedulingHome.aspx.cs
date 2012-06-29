using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class SchedulingHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        pnlCalendar.Visible = false;
        pnlView.Visible = true;
        string selectedDate2 = Calendar1.SelectedDate.ToString("yyyy-MM-dd HH:mm tt");
        srcSchedule.SelectParameters.Clear();

        srcSchedule.SelectParameters.Add("selectedDate2", selectedDate2);
        srcSchedule.SelectCommand = "SELECT Entity.Entity_ID, Entity.Entity_Organization_Name," +
                "Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Email, " +
                "Entity.Entity_Phone, Volunteer.Volunteers_Scheduled, Volunteer.Community_Service, " +
                "Shift.Shift_Name, Shift.Shift_Date FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID " +
                "INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Shift.Shift_Date = @selectedDate2)";
    }
                
    protected void grdSchedule_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        dtlSchedule.Visible = true;
        
    }
    protected void dtlScheduleUpdated(object sender, EventArgs e)
    {
        pnlView.Visible = false;
        pnlNew.Visible = false;
        pnlUpdated.Visible = true;
    }
    protected void dtlScheduleDeleted(object sender, EventArgs e)
    {
        pnlView.Visible = false;
        pnlNew.Visible = false;
        pnlDeleted.Visible = true;
    }
   
}
