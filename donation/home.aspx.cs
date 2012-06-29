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

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{

        //    dropViews.DataSource = MultiView1.Views;
        //    dropViews.DataTextField = "ID";
        //    dropViews.DataBind();
        //}


    }
    protected void btnNewDonation_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Donation.aspx");
    }
    protected void btnNewDonor_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Donor.aspx");
    }
    protected void btnSearchDonation_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/addDonation.aspx");
    }
    protected void btnSearchDonor_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/addDonation.aspx");
    }
}

        

//    }
//    protected void btnAddDonation_Click(object sender, EventArgs e)
//    {
//        FormView1.ChangeMode(FormViewMode.Insert);
//        MultiView1.ActiveViewIndex = 0;
       
//        if (FormView1.CurrentMode == FormViewMode.Insert &&
//        ((TextBox)FormView1.FindControl("datetimeTextBox")).Text.Length == 0)
//            ((TextBox)FormView1.FindControl("datetimeTextBox")).Text =
//            DateTime.Now.ToString();
       
        
         

        
//    }
    
//    protected void lnkButtonAddItem_Click(object sender, EventArgs e)
//    {
//        MultiView1.ActiveViewIndex = 1;
        
//    }

//    protected void dropViews_SelectedIndexChanged(object sender, EventArgs e)
//    {
       
  
//       // MultiView1.ActiveViewIndex = dropViews.SelectedIndex;
  
//    }
//   /* protected void InsertButton_Click(object sender, EventArgs e)
//    {
        
//      // Response.Redirect("AddDonationItem.aspx?donation_id=dID", true);
//    }
//    protected void FormView1_ItemCreated(object sender, EventArgs e)
//    {
//        //FormView1.ChangeMode(FormViewMode.ReadOnly);

//     //  String value = FormView1.DataKey["donation_id"].ToString();
//      //  CustomerDetailsView.DataKey["PostalCode"].ToString();

//      // Label1.Text = value;
//       //Response.Redirect("AddDonationItem.aspx?donation_id=" + value );


//    }
//   protected void ItemInserted(object sender, FormViewInsertedEventArgs e)
//    {
//        FormView1.ChangeMode(FormViewMode.ReadOnly);
//    }*/
//}
