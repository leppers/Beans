using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.IO;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


    
    


public partial class Name_lookup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            grdEntity.Visible = true;
            
            VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
            
            grdEntity.DataSource = db.Entities.Where(n =>
                n.Entity_Contact_LName == (lnameBox.Text) && 
                n.Entity_Contact_FName == (fnameBox.Text)&& 
                n.Entity_Contact_MName == (middleIBox.Text));
            grdEntity.DataBind();
        }
    }
}
