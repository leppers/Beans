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

public partial class IndivScheduling : System.Web.UI.Page
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
    protected void grdShift_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlShiftSelect.Visible = false;
        pnlIndividualSchedule.Visible = true;
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        grdIndividual_Entity.Visible = true;
    }
    protected void grdIndividual_Entity_SelectedIndexChanged(object sender, EventArgs e)
    {

        pnlBinaryField1.Visible = true;



    }
    protected void btnCommunity_Click(object sender, EventArgs e)
    {

        pnlBinaryField2.Visible = true;
    }

    protected void btnClient_Click(object sender, EventArgs e)
    {

        pnlSelect.Visible = true;

    }


    protected void btnSchedule_Click(object sender, EventArgs e)
    {
        SqlConnection beansdbconnection;
        beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ToString());

        byte[] CommServ;
        CommServ = new byte[1];

        if (cbxCommServ.Checked)
        {
            CommServ[0] = 1;

        }
        else
        {
            CommServ[0] = 0;
        }

        byte[] isClient;
        isClient = new byte[1];

        if (cbxClient.Checked)
        {
            isClient[0] = 1;

        }
        else
        {
            isClient[0] = 0;
        }

        int EntID = int.Parse(grdIndividual_Entity.SelectedValue.ToString());
        int ShiftID = int.Parse(grdShift.SelectedValue.ToString());


        SqlCommand cmdSchedule = new SqlCommand("INSERT INTO Volunteer(Entity_ID," +
                "Shift_ID, Community_Service, is_client) VALUES(@EntID, @ShiftID," +
                "@CommServ, @isClient)", beansdbconnection);

        cmdSchedule.Prepare();

        cmdSchedule.Parameters.Add("@EntID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@ShiftID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@CommServ", SqlDbType.Binary, 1);
        cmdSchedule.Parameters.Add("@isClient", SqlDbType.Binary, 1);

        try
        {
            beansdbconnection.Open();
            //Response.Write("Connection is open!!!");


            cmdSchedule.Parameters["@EntID"].Value = EntID;
            cmdSchedule.Parameters["@ShiftID"].Value = ShiftID;
            cmdSchedule.Parameters["@CommServ"].Value = CommServ;
            cmdSchedule.Parameters["@isClient"].Value = isClient;

            cmdSchedule.ExecuteNonQuery();
        }
        catch
        {
            Response.Write("Could Not Open Database");
        }
        finally
        {
            beansdbconnection.Close();
            //Response.Write("Connection is now closed");
        }

        Response.Redirect("ScheduleResults.aspx");

    }
}
