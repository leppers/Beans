using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (FV_Employee.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtCity = FV_Employee.FindControl("Employee_CityTextBox") as TextBox;
            TextBox txtState = FV_Employee.FindControl("Employee_StateTextBox") as TextBox;
            TextBox txtHireDate = FV_Employee.FindControl("Employee_HireDateTextBox") as TextBox;



            if (txtCity != null)
            {
                txtCity.Text = "Anchorage";
            }
            if (txtCity != null)
            {
                txtState.Text = "AK";
            }
            if (txtHireDate.Text != null)
            {
                txtHireDate.Text = DateTime.Today.ToShortDateString();
            }
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        FV_Employee.ChangeMode(FormViewMode.Edit);
    }
}
