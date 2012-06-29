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

public partial class WalkInVolunteer_Phone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime todaysDate = DateTime.Now.Date;

        TodayLiteral.Text = todaysDate.ToString();

        DateTime currentTime = DateTime.Now;

        DateTime shiftChange = Convert.ToDateTime("11:00:00 AM");

        int i = DateTime.Compare(currentTime, shiftChange);
        string shiftName;
        //if currentTime is less than shiftChange then result is Less than zero

        //if currentTime equals shiftChange then result is Zero

        //if currentTime is greater than shiftChange then result isGreater zero 

        if (i >= 0)
        {
            shiftName = "Afternoon";
        }
        else
        {
            shiftName = "Morning";
        }
        ShiftNameLiteral.Text = shiftName;

    }
    protected void btnPhoneSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            grdPhone.Visible = true;
    }
    protected void grdPhone_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlNumberLookup.Visible = false;
        pnlShift.Visible = true;

    }
    protected void grdShift_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlShift.Visible = false;
        pnlFields.Visible = true;
    }
    protected void lbtnCommServ_Click(object sender, EventArgs e)
    {
        lblClient.Visible = true;
        lblClient2.Visible = true;
        chkbxClient.Visible = true;

        lblYes2.Visible = true;
        lbtnClient.Visible = true;

    }
    protected void lbtnClient_Click(object sender, EventArgs e)
    {
        btnClockIn.Visible = true;

    }

    protected void btnClockIn_Click(object sender, EventArgs e)
    {
        
        
        SqlConnection beansdbconnection4 = null;
        SqlCommand cmdSchedule = null;        

            
            
               
        beansdbconnection4 = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ToString());


        int EntID = int.Parse(grdPhone.SelectedValue.ToString());





        byte[] CommServ;
        CommServ = new byte[1];

        if (chkbxCommServ.Checked)
        {
            CommServ[0] = 1;

        }
        else
        {
            CommServ[0] = 0;
        }

        byte[] isClient;
        isClient = new byte[1];

        if (chkbxClient.Checked)
        {
            isClient[0] = 1;

        }
        else
        {
            isClient[0] = 0;
        }




        int ShiftID = int.Parse(grdShift.SelectedValue.ToString());


        cmdSchedule = new SqlCommand("INSERT INTO Volunteer(Entity_ID," +
                "Shift_ID, Clock_In, Community_Service, is_client) VALUES(@EntID, @ShiftID," +
                "@ClockIn, @CommServ, @isClient)", beansdbconnection4);

        cmdSchedule.Prepare();

        cmdSchedule.Parameters.Add("@EntID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@ShiftID", SqlDbType.Int, 4);
        cmdSchedule.Parameters.Add("@ClockIn", SqlDbType.DateTime, 5);
        cmdSchedule.Parameters.Add("@CommServ", SqlDbType.Binary, 1);
        cmdSchedule.Parameters.Add("@isClient", SqlDbType.Binary, 1);



        try
        {
            beansdbconnection4.Open();
            //Response.Write("Connection is open!!!");


            cmdSchedule.Parameters["@EntID"].Value = EntID;
            cmdSchedule.Parameters["@ShiftID"].Value = ShiftID;
            cmdSchedule.Parameters["@ClockIn"].Value = DateTime.Now;
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
            beansdbconnection4.Close();
            //Response.Write("Connection is now closed");
        }

        pnlFields.Visible = false;
        Panel2.Visible = true;
    }
}
