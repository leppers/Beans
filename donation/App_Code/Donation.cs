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
using System.Collections.Generic;

/// <summary>
/// Summary description for Donation
/// </summary>
[Serializable]
public class Donation
{
    public Donation()
    {
       
        Date = DateTime.Now;
        DonationID = _donationID;
    }
    public Donation(int donationID, DateTime date, int employeeID, int donatorID, int recipientID )
	{

        _donationID = donationID;
        _date = date;
        _employeeID = employeeID;
        _donatorID = donatorID;
        _recipientID = recipientID;
        //
		// TODO: Add constructor logic here
		//
	}
    private int  _donationID;
    private DateTime _date;
    private int _employeeID;
    private int _donatorID;
    private int _recipientID;
    

    public int DonationID
    {
        get { return _donationID; }
        set { _donationID = _donationID + 1; }
    }
    public DateTime Date
    {
        get { return _date; }
        set { _date = value; }
    }
    public int EmployeeID
    {
        get { return _employeeID; }
        set { _employeeID = value; }
    }
    public int DonatorID
    {
        get { return _donatorID; }
        set { _donatorID = value; }
    }
    public int RecipientID
    {
        get { return _recipientID; }
        set { _recipientID = value; }
    }
    
 



}
