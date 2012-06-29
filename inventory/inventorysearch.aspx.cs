using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inventorysearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        PanelLastName.Visible = false;
        PanelDateRage.Visible = false;
        

        if (!IsPostBack)
        {
            switch (ddlSearchBy.SelectedValue)
            {
                case "Lastname":
                    {

                        PanelLastName.Visible = true;
                        LineItempanel.Visible = true;
                       
                        break;
                    }
                case "DateRange":
                    {

                        PanelDateRage.Visible = true;
                        LineItempanel.Visible = true;
                       
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
                    
                    PanelLastName.Visible = true;
                    ViewState.Clear();
                    
                    
                    break;
                }
            case "DateRange":
                {
                    
                    PanelDateRage.Visible = true;
                    ViewState.Clear();
                   
                    
                    break;
                }
        }



    }
    protected void btnSearchDate_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Clear();
        QueryPanel.Visible = true;
        SqlDataSource1.SelectParameters.Add("DateStart", txtDonationStartDate.Text);
        SqlDataSource1.SelectParameters.Add("DateEnd", txtDonationEndDate.Text);
        SqlDataSource1.SelectCommand = "SELECT PIC.PIC_ID, PIC.PIC_Date, Employee.Employee_FName, Employee.Employee_LName FROM PIC INNER JOIN Employee ON PIC.Employee_ID = Employee.Employee_ID WHERE (PIC.PIC_Date BETWEEN @DateStart AND @DateEnd)";


    }
    
    protected void btnSearchName_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Clear();
        QueryPanel.Visible = true;
        SqlDataSource1.SelectParameters.Add("LastName", ddlEmployeeID.SelectedValue);
        SqlDataSource1.SelectCommand = "SELECT PIC.PIC_ID, PIC.PIC_Date, Employee.Employee_FName, Employee.Employee_LName FROM PIC INNER JOIN Employee ON PIC.Employee_ID = Employee.Employee_ID WHERE (PIC.Employee_ID = @LastName ) ";
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LineItempanel.Visible = true;
    }
    protected void btnNewSearch_Click(object sender, EventArgs e)
    {
        ViewState.Clear();
        QueryPanel.Visible = false;
        LineItempanel.Visible = false;
    }

    protected void LoadSearchToolChange(object sender, EventArgs e)
    {
        switch (ddlSearchBy.SelectedValue)
        {
            case "Lastname":
                {

                    PanelLastName.Visible = true;
                    LineItempanel.Visible = false;
                    QueryPanel.Visible = false;
                    ViewState.Clear();
          


                    break;
                }
            case "DateRange":
                {

                    PanelDateRage.Visible = true;
                    LineItempanel.Visible = false;
                    QueryPanel.Visible = false;
                    ViewState.Clear();
                    


                    break;
                }
        }
    }

    protected void lnkPrint_Click(object sender, EventArgs e)
    {
        Server.Transfer("print_pic.aspx?PICID=" + gv_inventoryResults.SelectedValue.ToString());
    }
}
