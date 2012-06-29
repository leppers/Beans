using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Donor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PanelOrganization.Visible = false;
        PanelLastName.Visible = false;
        PanelPhoneNumber.Visible = false;
        if (!IsPostBack)
        {
            
            
        }
        

       // GridView1.DataBind();

    }
    protected void btnSearchDonorSubmit_Click(object sender, EventArgs e)
    {

        DonorFormView.ChangeMode(FormViewMode.Edit);
    }
    protected void btnAddDonor_Click(object sender, EventArgs e)
    {
        Donor_MV.ActiveViewIndex = 2;
        DonorFormView.ChangeMode(FormViewMode.Insert);

        if (DonorFormView.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtCity = DonorFormView.FindControl("cityTextBox") as TextBox;
            TextBox txtState = DonorFormView.FindControl("stateTextBox") as TextBox;


            if (txtCity != null)
            {
                txtCity.Text = "Anchorage";
            }
            if (txtCity != null)
            {
                txtState.Text = "AK";
            }
        }

    }
    protected void btnSearchDonor_Click(object sender, EventArgs e)
    {
        Donor_MV.ActiveViewIndex = 0;
    }

    protected void btnSearchOrg_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters.Clear();
        Donor_MV.ActiveViewIndex = 1;
        DonorFormView.ChangeMode(FormViewMode.Edit);
        SqlDataSource2.SelectParameters.Add("Organization", txtDonorOrg.Text);
        SqlDataSource2.SelectCommand = "SELECT Entity_ID, Entity_Organization_Name, Entity_Contact_FName, Entity_Contact_MName, Entity_Contact_LName, Entity_Address1, Entity_Address2, Entity_City, Entity_State, Entity_ZipCode, Entity_Email, Entity_Phone, Entity_Type, Entity_Support_Type FROM Entity WHERE (Entity_Organization_Name Like '%' + @Organization  + '%')";


    }
    protected void btnSearchPhone_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters.Clear();
        Donor_MV.ActiveViewIndex = 1;
        DonorFormView.ChangeMode(FormViewMode.Edit);
        SqlDataSource2.SelectParameters.Add("PhoneNumber", txtDonorPhoneNumber.Text);
        SqlDataSource2.SelectCommand = "SELECT Entity_ID, Entity_Organization_Name, Entity_Contact_FName, Entity_Contact_MName, Entity_Contact_LName, Entity_Address1, Entity_Address2, Entity_City, Entity_State, Entity_ZipCode, Entity_Email, Entity_Phone, Entity_Type, Entity_Support_Type FROM Entity WHERE ( Entity_Phone Like '%' + @PhoneNumber + '%' ) ";
    }
    protected void btnSearchName_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters.Clear();
        Donor_MV.ActiveViewIndex = 1;
        DonorFormView.ChangeMode(FormViewMode.Edit);
        SqlDataSource2.SelectParameters.Add("LastName", txtDonorLastName.Text);
        SqlDataSource2.SelectCommand = "SELECT Entity_ID, Entity_Organization_Name, Entity_Contact_FName, Entity_Contact_MName, Entity_Contact_LName, Entity_Address1, Entity_Address2, Entity_City, Entity_State, Entity_ZipCode, Entity_Email, Entity_Phone, Entity_Type, Entity_Support_Type FROM Entity WHERE (Entity_Contact_LName Like '%' + @LastName + '%' ) ";
    }
    protected void LoadSearchTool(object sender, EventArgs e)
    {
        switch (ddlSearchBy.SelectedValue)
        {
            case "Lastname":
                {
                    Donor_MV.ActiveViewIndex = 0;
                    PanelLastName.Visible = true;
                    break;
                }
            case "PhoneNumber":
                {
                    Donor_MV.ActiveViewIndex = 0;
                    PanelPhoneNumber.Visible = true;
                    break;
                }
            case "Organization":
                {
                    Donor_MV.ActiveViewIndex = 0;
                    PanelOrganization.Visible = true;
                    break;
                }
        }//End Switch
    }//End LoadSearchTool
    protected void EditButton_Click(object sender, EventArgs e)
    {
        

    }
    protected void lBtnSearch_Click(object sender, EventArgs e)
    {
        Donor_MV.ActiveViewIndex = 2;

    }
   
}



