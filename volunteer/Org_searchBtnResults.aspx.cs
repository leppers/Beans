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


public partial class Org_lookup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void selectBtn_Click(object sender, EventArgs e)
    {
        string orgSelected = ddlOrganization.SelectedValue;
        grd_NamebyOrg.Visible = true;
        //LinqDataSource2.SelectParameters.Clear();

        //LinqDataSource2.SelectParameters.Add("Entity_Organization_Name", ddlOrganization.SelectedItem.Text);
        //LinqDataSource2.Select = "new (Entity_ID, Shift_ID, Clock_In, Clock_Out, Volunteers_Scheduled, Volunteers_Worked, Community_Service, Volunteer_Comments)";
        // need to capture Entity_ID with org name
                //LinqDataSource2.Where = "Entity_Organization_Name == @Entity_Organization_Name";
        SqlDataSource1.SelectParameters.Add("orgSelected", ddlOrganization.SelectedItem.Text);
        SqlDataSource1.SelectCommand = "SELECT Entity.Entity_ID, Entity.Entity_Organization_Name, Volunteer.Volunteers_Scheduled, Shift.Shift_Name, Shift.Shift_Date FROM Entity INNER JOIN Volunteer ON Entity.Entity_ID = Volunteer.Entity_ID INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID WHERE (Entity.Entity_Organization_Name = @orgSelected)";
    }
    protected void grd_NamebyOrg_SelectedIndexChanged(object sender, EventArgs e)
    {
        grd_NamebyOrg.Visible = false;
        ddlOrganization.Visible = false;
        selectBtn.Visible = false;
        Label1.Visible = false;
        Label2.Visible = true;

        dtlOrg.Visible = true;
        //btnClockin.Visible = true;
    }
    /*protected void btnClockin_Click(object sender, EventArgs e)
    {
        string clockinDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm tt");
        //SqlDataSource2.UpdateParameters["Clock_In"].DefaultValue = clockinDate;
        SqlDataSource2.UpdateParameters.Add("clockinDate", clockinDate);
        SqlDataSource2.UpdateCommand = "UPDATE Volunteer SET Clock_In =@clockinDate, Volunteers_Worked = @Volunteers_Worked FROM Volunteer INNER JOIN Shift ON Volunteer.Shift_ID = Shift.Shift_ID INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID INNER JOIN Entity AS Entity_1 ON Volunteer.Entity_ID = Entity_1.Entity_ID";
        SqlDataSource2.Update();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }*/
    protected void dtlOrg_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        string clockinDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm tt");

        SqlConnection beansdbconnection;
        // connection created
        beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ToString());

        dtlOrg.DataSource = beansdbconnection;
        dtlOrg.DataBind();

        try
        {
            beansdbconnection.Open();
            // data adapter
            SqlDataAdapter bnsdataAdapter = new SqlDataAdapter();
            bnsdataAdapter.SelectCommand = new SqlCommand("SELECT Entity.Entity_Organization_Name," +
                "Volunteer.Volunteers_Scheduled, Volunteer.Volunteers_Worked, Shift.Shift_Name," +
                "Shift.Shift_Date FROM Shift INNER JOIN Volunteer ON Shift.Shift_ID = Volunteer.Shift_ID" +
                "INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID WHERE" +
                "Entity.Entity_ID=@Entity_ID AND Entity.Entity_Organization_Name IS NOT NULL", beansdbconnection);

            // dataset
            DataSet bnsdataSet = new DataSet();
            bnsdataAdapter.Fill(bnsdataSet, "Volunteer");

            //data table reference
            DataTable bnsdataTable = bnsdataSet.Tables["Volunteer"];

            //  clock-in command (UPDATE)       
            SqlCommand cmdClockin = new SqlCommand("UPDATE Volunteer" +
                                            "SET Entity_ID = @EntID, Shift_ID = @ShiftID," +
                "Clock_IN = @clockIn, Volunteers_Worked = @VolWorked", beansdbconnection);

            cmdClockin.Parameters.Add("@EntID", SqlDbType.Int, 4, "Entity_ID");
            cmdClockin.Parameters.Add("@ShiftID", SqlDbType.Int, 4, "Shift_ID");
            cmdClockin.Parameters.Add("@clockIn", SqlDbType.Time, 5, "Clock_In");
            cmdClockin.Parameters.Add("@VolWorked", SqlDbType.Int, 10, "Volunteers_Worked");

            cmdClockin.Parameters["@clockIn"].Value = clockinDate;

            bnsdataAdapter.UpdateCommand = cmdClockin;
            bnsdataAdapter.Update(bnsdataSet, "Volunteer");
        }
        catch
        {
            Response.Write("Could Not Update Database");
        }
        finally
        {
            beansdbconnection.Close();
        }
        

        /*try
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





        //SqlDataSource2.UpdateParameters.Add("clockinDate", clockinDate);
        SqlDataSource2.UpdateParameters["@Clock_In"].DefaultValue = clockinDate;
        
        SqlDataSource2.UpdateCommand = "UPDATE SET Entity_ID= @Entity_ID, Shift_ID=@Shift_ID, Clock-In=@Clock_In, Volunteers_Worked=@Volunteers_Worked";
        SqlDataSource2.UpdateCommand = "UPDATE Volunteer SET Clock_In =@clockinDate AND" +
            "Volunteers_Worked = @Volunteers_Worked FROM Volunteer INNER JOIN Shift" + 
            "ON Volunteer.Shift_ID = Shift.Shift_ID INNER JOIN Entity ON Volunteer.Entity_ID = Entity.Entity_ID" +
            "INNER JOIN Entity AS Entity_1 ON Volunteer.Entity_ID = Entity_1.Entity_ID";*/
        SqlDataSource2.Update();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
}
