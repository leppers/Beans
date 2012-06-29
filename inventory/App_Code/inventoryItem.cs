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
/// Summary description for InventoryItem
/// </summary>
[Serializable]
public class inventoryItem
{
    public inventoryItem()
    {

    }

    public inventoryItem(int itemID, int PIC_ID, int unitID, int locationID, int itemQty)
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private int _PIC_ID;
    private int _PIC_itemID;
    private int _unitID;
    private int _locationID;
    private int _itemQty;
    private String _itemDescription;
    private String _PIC_itemName;
    private String _locationName;
    private String _unitName;
   


    public int ItemID
    {
        get { return _PIC_itemID; }
        set { _PIC_itemID = value; }
    }
    public int PIC_ID
    {
        get { return _PIC_ID; }
        set { _PIC_ID = value; }
    }
    public String ItemDescription
    {
        get { return _itemDescription; }
        set { _itemDescription = value; }
    }
    public int ItemQty
    {
        get { return _itemQty; }
        set { _itemQty = value; }
    }
   
    public int UnitID
    {
        get { return _unitID; }
        set { _unitID = value; }
    }
    public int LocationID
    {
        get { return _locationID; }
        set { _locationID = value; }
    }

    public String ItemName
    {
        get { return _PIC_itemName; }
        set { _PIC_itemName = value; }
    }
    public String LocationName
    {
        get { return _locationName; }
        set { _locationName = value; }
    }
    public String UnitName
    {
        get { return _unitName; }
        set { _unitName = value; }
    }


}
