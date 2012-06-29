using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for DonationItem
/// </summary>
 [Serializable]
public class DonationItem : Donation
{
    public DonationItem()
    {

    }

    public DonationItem(int itemID, int donationItemID, int itemType, String itemDescription, double itemWeight)
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int _donationItemID;
    private int _itemID;
    private String _itemDescription;
    private int _itemType;
    private double _itemWeight;
    private String _CategoryName;
   // private double _itemValue;


   
    public int ItemID
    {
        get { return _itemID; }
        set { _itemID = value; }
    }
    public int DonationItemID
    {
        get { return _donationItemID; }
        set { _donationItemID = value; }
    }
    public String ItemDescription
    {
        get { return _itemDescription; }
        set { _itemDescription = value; }
    }
    public double ItemWeight
    {
        get { return _itemWeight; }
        set { _itemWeight = value; }
    }
   /* public double ItemValue
    {
        get { return _itemValue; }
        set { _itemValue = value; }
    }*/
    public String CategoryName
    {
        get { return _CategoryName; }
        set { _CategoryName = value; }
    }
    public int ItemType
    {
        get { return _itemType; }
        set { _itemType = value; }
    }
    

}
