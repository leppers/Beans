using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class volunteerTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime selectedDate = Calendar1.SelectedDate.Date;

        SelectedDateLiteral.Text = string.Format("You selected: {0:d}<br/>{1}",
        selectedDate, SelectedDateLiteral.Text);
        Panel2.Visible = true;
        Panel1.Visible = false;
        
    }
    protected void btnShiftSelect_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = true;

    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        grdContactInfo.Visible = true;
        lblInstruct.Visible = true;
        btnSelect.Visible = false;
    }
    protected void grdContactInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        lblInstruct.Visible = false;
        
    }
    protected void btnNumWork_Click(object sender, EventArgs e)
    {
        Panel5.Visible = true;
        btnNumWork.Visible = false;
        Response.Write(grdContactInfo.SelectedValue.ToString());

    }
    protected void btnSchedule_Click(object sender, EventArgs e)
    {
        SqlConnection beansdbconnection;
        beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ToString());

        string beansInsert = @"
                INSERT INTO Volunteers
                (
                    Entity_ID, Shift_ID, Volunteers_Scheduled, Volunteer_Comments
                )

                VALUES(@EntID, @ShiftID, @VolScheduled, @VolComments)";

                
        /*cmdSchedule.Parameters.Add("@EntID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@ShiftID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@VolScheduled", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@VolComments", SqlDbType.VarChar, 50);*/
        int EntID = int.Parse(grdContactInfo.SelectedValue.ToString());
        int ShiftID = int.Parse(grdShift.SelectedValue.ToString());

        /*VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        var shiftID = db.Shifts.Where(s => s.Shift_Name == rblSelectedLiteral.Text && s.Shift_Date == Calendar1.SelectedDate).Select(s => new { s.Shift_ID });
        int shift_ID = int.Parse(shiftID.ToString());*/

        //int shift_ID = int.Parse(shiftID.ToString());
        int numWork = int.Parse(txtNumberofWorkers.Text);

       
        //cmdSchedule.Prepare();

        try
        {
            beansdbconnection.Open();

            SqlCommand cmdSchedule = new SqlCommand(beansInsert, beansdbconnection);

            cmdSchedule.Parameters.Add("@EntID", SqlDbType.Int).Value = EntID;
            cmdSchedule.Parameters.Add("@ShiftID", SqlDbType.Int).Value = ShiftID;
            cmdSchedule.Parameters.Add("@VolScheduled", SqlDbType.Int).Value = numWork;
            cmdSchedule.Parameters.Add("@VolComments", SqlDbType.VarChar).Value = txtComments.Text;

            cmdSchedule.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.ToString());
        }
        finally
        {
            beansdbconnection.Close();
        }

        //SqlDataSource srcOrgSchedule = new SqlDataSource();
        //srcOrgSchedule.ConnectionString = WebConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ConnectionString;
        
    }







    
}
