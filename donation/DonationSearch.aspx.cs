using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class DonationSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        PanelOrganization.Visible = false;
        PanelLastName.Visible = false;
        PanelPhoneNumber.Visible = false;
        PanelDateRage.Visible = false;

        if (!IsPostBack)
        {
            switch (ddlSearchBy.SelectedValue)
            {
                case "Lastname":
                    {

                        PanelLastName.Visible = true;
                        break;
                    }
                case "Organization":
                    {
                        PanelOrganization.Visible = true;
                        break;
                    }
                case "PhoneNumber":
                    {

                        PanelPhoneNumber.Visible = true;
                        break;
                    }
                case "DateRange":
                    {

                        PanelDateRage.Visible = true;
                        break;
                    }
            }
        }


    }

    protected void LoadSearchTool(object sender, EventArgs e)
    {
        switch (ddlSearchBy.SelectedValue)
        {
            case "Lastname":
                {
                    MV_Search.ActiveViewIndex = -1;
                    PanelLastName.Visible = true;
                    break;
                }
            case "Organization":
                {
                    MV_Search.ActiveViewIndex = -1;
                    PanelOrganization.Visible = true;
                    break;
                }
            case "PhoneNumber":
                {
                    MV_Search.ActiveViewIndex = -1;
                    PanelPhoneNumber.Visible = true;
                    break;
                }
            case "DateRange":
                {
                    MV_Search.ActiveViewIndex = -1;
                    PanelDateRage.Visible = true;
                    break;
                }
        }



    }
    protected void btnSearchDate_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Clear();
        MV_Search.ActiveViewIndex = 0;
        SqlDataSource1.SelectParameters.Add("DateStart",txtDonationStartDate.Text);
        SqlDataSource1.SelectParameters.Add("DateEnd", txtDonationEndDate.Text);
        SqlDataSource1.SelectCommand = "SELECT Donation.Donation_ID, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Organization_Name, Donation.Donation_Action, Donation.Donation_DateTime, Employee.Employee_FName, Employee.Employee_LName FROM Donation INNER JOIN Employee ON Donation.Employee_ID = Employee.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE (Donation.Donation_DateTime BETWEEN @DateStart AND @DateEnd)";
       
       
    }
    protected void btnSearchPhone_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Clear();
        MV_Search.ActiveViewIndex = 0;
        SqlDataSource1.SelectParameters.Add("PhoneNumber", txtDonorPhoneNumber.Text);
        SqlDataSource1.SelectCommand = "SELECT Donation.Donation_ID, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Organization_Name, Donation.Donation_Action, Donation.Donation_DateTime, Employee.Employee_FName, Employee.Employee_LName FROM Donation INNER JOIN Employee ON Donation.Employee_ID = Employee.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE ( Entity_Phone Like '%' + @PhoneNumber + '%' ) ";
    }
    protected void btnSearchName_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Clear();
        MV_Search.ActiveViewIndex = 0;
        SqlDataSource1.SelectParameters.Add("LastName", txtDonorLastName.Text);
        SqlDataSource1.SelectCommand = "SELECT Donation.Donation_ID, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Organization_Name, Donation.Donation_Action, Donation.Donation_DateTime, Employee.Employee_FName, Employee.Employee_LName FROM Donation INNER JOIN Employee ON Donation.Employee_ID = Employee.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE (Entity_Contact_LName Like '%' + @LastName + '%' ) ";
    }
    protected void btnSearchOrg_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Clear();
        MV_Search.ActiveViewIndex = 0;
        SqlDataSource1.SelectParameters.Add("Organization", txtOrganization.Text);
        SqlDataSource1.SelectCommand = "SELECT Donation.Donation_ID, Entity.Entity_Contact_FName, Entity.Entity_Contact_LName, Entity.Entity_Organization_Name, Donation.Donation_Action, Donation.Donation_DateTime, Employee.Employee_FName, Employee.Employee_LName FROM Donation INNER JOIN Employee ON Donation.Employee_ID = Employee.Employee_ID INNER JOIN Entity ON Donation.Entity_ID = Entity.Entity_ID WHERE (Entity_Organization_Name Like '%' + @Organization + '%' ) ";

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        MV_Search.ActiveViewIndex = 1;
    }
    protected void btnNewSearch_Click(object sender, EventArgs e)
    {
        ViewState.Clear();
    }
    protected void lnkPrint_Click(object sender, EventArgs e)
    {
        Server.Transfer("print_receipt.aspx?receiptID=" + gv_donation.SelectedValue.ToString());
    }
   
}
