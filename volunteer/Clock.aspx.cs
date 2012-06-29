using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Clock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // convert textbox entry to type int
        int IDtxtbx;
        IDtxtbx = Convert.ToInt32(textBox1.Text);
        //int IDtxtbx = int.Parse(textBox1.Text);

        // Create a gridview to display entity attributes to user to
        // verify if this is the correct selection
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        Confirm_grdView.DataSource = db.Entities.Where(n => n.Entity_ID == (IDtxtbx));
        Confirm_grdView.DataBind();
    }
    protected void Btn1_Click(object sender, EventArgs e)
    {
        Confirm_grdView.Visible = true;
        Hlink1.Visible = false;
        Label1.Visible = true;
        btnNo.Visible = true;
        btnYes.Visible = true;
    }
}
