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

public partial class controls_WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtDateTime.Text = DateTime.Now.ToString();
        
        }
        txtDonationID.Text = DonationID;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
         
    }
    public String DonationID
    {
        get { return txtDonationID.Text; }
        set { txtDonationID.Text = value; }
    }
    public String RecipientID
    {
        get { return txtRecipientID.Text; }
        set { txtRecipientID.Text = value; }
    }
    public String EmployeeID
    {
        get { return txtEmployeeID.Text; }
        set { txtEmployeeID.Text = value; }
    }
    public String DonorID
    {
        get { return txtDonorID.Text; }
        set { txtDonorID.Text = value; }
    }
    

}
