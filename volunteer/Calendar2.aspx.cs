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

public partial class Calendar2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        pnlCalendar.Visible = false;
        pnlShiftSelect.Visible = true;

        DateTime selectedDate = Calendar1.SelectedDate.Date;
        
            SelectedDateLiteral.Text = string.Format("You selected: {0:d}<br/>{1}",
            selectedDate, SelectedDateLiteral.Text);


        

    }
    protected void btnShiftSelect_Click(object sender, EventArgs e)
    {
        pnlShiftSelect.Visible = false;
        pnlNumberofVolunteers.Visible = true;       
     
    }
    protected void lbtnIndividual_Click(object sender, EventArgs e)
    {
        
        pnlNumberofVolunteers.Visible = false;
        pnlIndividualSchedule.Visible = true;

        
        /*SqlDataSource2.SelectParameters.Clear();
        SqlDataSource2.SelectParameters.Add("shiftName", rblShiftSelect.SelectedItem.Text);

        string selectedDate1 = Calendar1.SelectedDate.ToString("yyyy-MM-dd HH:mm tt");
        SqlDataSource2.SelectParameters.Add("selectedDate1", selectedDate1);

        SqlDataSource2.SelectCommand = "SELECT Entity.Entity_ID, Entity.Entity_Organization_Name, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Email, Entity.Entity_Phone, Volunteer.Volunteers_Scheduled, Volunteer.Community_Service, Shift.Shift_Name, Shift.Shift_Date FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Entity.Entity_Organization_Name IS NULL) AND (Shift.Shift_Name = @shiftName) AND (Shift.Shift_Date = @selectedDate1)";
        */


    }

    protected void lbtnGroup_Click(object sender, EventArgs e)
    {
        pnlShiftSelect.Visible = false;
        pnlNumberofVolunteers.Visible = false;
        pnlGroupSchedule.Visible = true;
       
        
        
        
        string selectedDate2 = Calendar1.SelectedDate.ToString("yyyy-MM-dd HH:mm tt");
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("shiftName", rblShiftSelect.SelectedItem.Text);
        SqlDataSource1.SelectParameters.Add("selectedDate2", selectedDate2);
        

        SqlDataSource1.SelectCommand = "SELECT Entity.Entity_ID, Entity.Entity_Organization_Name," +
                "Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Email, " +
                "Entity.Entity_Phone, Volunteer.Volunteers_Scheduled, Volunteer.Community_Service, " +
                "Shift.Shift_Name, Shift.Shift_Date FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID" +
                "INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Entity.Entity_Organization_Name IS NOT NULL)" +
                "AND (Shift.Shift_Name = @shiftName) AND (Shift.Shift_Date = @selectedDate2)";
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        grdIndividual_Entity.Visible = true;
    }
    protected void grdIndividual_Entity_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlIndividualSchedule.Visible = false;
        pnlBinaryField1.Visible = true;
        


    }
    protected void btnCommunity_Click(object sender, EventArgs e)
    {
        pnlBinaryField1.Visible = false;
        pnlBinaryField2.Visible = true;
    }
    
    protected void btnClient_Click(object sender, EventArgs e)
    {
        pnlBinaryField2.Visible = false;
        pnlSelect.Visible = true;

        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        var shiftID = db.Shifts.Where(s =>s.Shift_Name == rblSelectedLiteral.Text && s.Shift_Date == Calendar1.SelectedDate).Select(s => new {s.Shift_ID});
        int shift_ID = int.Parse(shiftID.ToString());

        byte CommuServ;

        if (cbxCommServ.Checked)
        {
            CommuServ = 1;

        }
        else
        {
            CommuServ = 0;
        }
        byte isClient;

        if (cbxClient.Checked)
        {
            isClient = 1;

        }
        else
        {
            isClient = 0;
        }
        /*System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
        //Convert to binary data
        byte[] binaryData = encoding.GetBytes(CommuServ);*/
      

        srcIndividual.InsertParameters["EntID"].DefaultValue = grdIndividual_Entity.SelectedValue.ToString();
        srcIndividual.InsertParameters["ShiftID"].DefaultValue = shiftID.ToString();
        //srcIndividual.InsertParameters["CommServ"].DefaultValue = CommuServ.ToString();
        //  Convert.ToByte(srcIndividual.InsertParameters["CommServ"].DefaultValue= CommuServ);
        
        //srcIndividual.InsertParameters.Add("Client", SqlDbType.Binary);
        //  Convert.ToByte(srcIndividual.InsertParameters["Client"].DefaultValue = isClient);
       
        srcIndividual.Insert();
        grdSelect.Visible = true;
    }

}
