using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

/// <summary>
/// Summary description for GetEntity_Name
/// </summary>
public partial class Entity
{
	public static IEnumerable<Entity> getName(String textBox)
	{
		VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        return db.Entities.Where(n => n._Entity_Contact_LName == textBox)
                          .OrderBy(n => n._Entity_Contact_LName);
                          //.Select(n => n._Entity_Contact_FName, n._Entity_Contact_MName, n._Entity_Contact_LName, n._Entity_Phone);
    }         
        
		// TODO: Add constructor logic here
		//
}





/* public partial class Name_lookup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            grdEntity.Visible = true;
            
            
            
            grdEntity.DataSource = db.Entities.Where(n =>
                n.Entity_Contact_LName == (lnameBox.Text) && 
                n.Entity_Contact_FName == (fnameBox.Text)&& 
                n.Entity_Contact_MName == (middleIBox.Text));
            grdEntity.DataBind();
        }
    }*/