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
using System.Data.Linq;
using System.Collections.Generic;

public partial class volunteer : System.Web.UI.Page
{
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        foreach (KeyValuePair<string, object> kvp in e.WhereParameters)
        {

            if (kvp.Value == null)
            {

                e.Cancel = true;

                return;

            }

        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

   

    protected void Button1_Click(object sender, EventArgs e)
    {
        
            switch (ddlSearchSelection.SelectedValue)
            {
                case "Organization":
                    {
                        Response.Redirect("Org_searchBtnResults.aspx");                        
                        break;
                    }
                case "Lastname":
                    {
                        Response.Redirect("lName_searchBtnResults.aspx");                        
                        break;
                    }
                case "PhoneNumber":
                    {
                        Response.Redirect("Phone_Search.aspx");
                        break;
                    }
            }
        
    }
   



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Home_Panel.Visible = false;
        Lookup_Panel.Visible = true;
    }
    protected void Clock_INbtn_Click(object sender, EventArgs e)
    {
        /*int int_Ent_ID_bx;
        Home_Panel.Visible = false;
        ClockIn_Panel.Visible = true;
        int_Ent_ID_bx = int.Parse(Ent_ID_bx.Text);*/

    }
}
