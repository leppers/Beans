using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime selectedDate = Calendar1.SelectedDate.Date;

        SelectedDateLiteral.Text = string.Format("You selected: {0:d}<br/>{1}",
        selectedDate, SelectedDateLiteral.Text);

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
    protected void lbtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calendar.aspx");
        //pnlView.Visible = false; 
        //pnlCalendar.Visible = true;        
    }
}
