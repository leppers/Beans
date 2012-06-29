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

public partial class controls_ctrlAddDonationItem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DonationID = txtDonationID.Text;
        ItemType = txtType.Text;
        ItemDescription = txtDescription.Text;
        Weight = txtWeight.Text;
        //txtDonationID.Text = DonationID;
        //txtItemID.Text = ItemID;
        //txtType.Text = ItemType;
        //txtDescription.Text = ItemDescription;
        //txtWeight.Text = Weight;
        //txtValue.Text = Value;
    }
   
    public String DonationID
    {
        get { return txtDonationID.Text; }
        set { txtDonationID.Text = value; }
    }
    public String ItemID
    {
        get { return txtItemID.Text; }
        set { txtItemID.Text = value; }
    }
    public String ItemType
    {
        get { return txtType.Text; }
        set { txtType.Text = value; }
    }
    public String ItemDescription
    {
        get { return txtDescription.Text; }
        set { txtDescription.Text = value; }
    }
    public String Weight
    {
        get { return txtWeight.Text; }
        set { txtWeight.Text = value; }
    }
    public String Value
    {
        get { return txtValue.Text; }
        set { txtValue.Text = value; }
    }
}
