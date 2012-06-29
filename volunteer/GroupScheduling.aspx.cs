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
    protected void grdShift_SelectedIndexChanged(object sender, EventArgs e)
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

        
        int EntID = int.Parse(grdContactInfo.SelectedValue.ToString());
        int ShiftID = int.Parse(grdShift.SelectedValue.ToString());       
        int numWork = int.Parse(txtNumberofWorkers.Text);

        SqlCommand cmdSchedule = new SqlCommand("INSERT INTO Volunteer(Entity_ID," +
                "Shift_ID, Volunteers_Scheduled, Volunteer_Comments) VALUES(@EntID, @ShiftID," +
                "@VolScheduled, @VolComments)", beansdbconnection);

       
        cmdSchedule.Prepare();

        cmdSchedule.Parameters.Add("@EntID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@ShiftID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@VolScheduled", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@VolComments", SqlDbType.VarChar, 50);

        try        
        {
            beansdbconnection.Open();
            Response.Write("Connection is open!!!");
            

            cmdSchedule.Parameters["@EntID"].Value = EntID;
            cmdSchedule.Parameters["@ShiftID"].Value = ShiftID;
            cmdSchedule.Parameters["@VolScheduled"].Value = numWork;
            cmdSchedule.Parameters["@VolComments"].Value = txtComments.Text;

            cmdSchedule.ExecuteNonQuery();
        }
        catch 
        {
            Response.Write("Could Not Open Database");
        }
        finally
        {
            beansdbconnection.Close();
            Response.Write("Connection is now closed");
        }

        Response.Redirect("ScheduleResults.aspx");
        
    }

    
}
