using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using AjaxControlToolkit;
using System.Collections.Specialized;
using System.Data;




/// <summary>
/// Summary description for CascadingDropDown
/// </summary>

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
public class CascadingDropDown : System.Web.Services.WebService
{
    //Create global Connection string
    string strConnection = ConfigurationManager.ConnectionStrings
    ["Beans_DB_v5ConnectionString"].ConnectionString;

    public CascadingDropDown()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    /// <summary>
    /// WebMethod to populate country Dropdown
    /// </summary>
    /// <param name="knownCategoryValues"></param>
    /// <param name="category"></param>
    /// <returns>countrynames</returns>
 
    //Cascading Dropdown 1
    [WebMethod]
    public CascadingDropDownNameValue[] GetItems
    (string knownCategoryValues, string category)
    {
        //Create sql connection and sql command
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.CommandText = "SELECT * FROM Inventory_Item ORDER BY Item_Name";

        //Create dataadapter and fill the dataset
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        dAdapter.SelectCommand = cmd;
        con.Open();
        DataSet objDs = new DataSet();
        dAdapter.Fill(objDs);
        con.Close();

        //create list and add items in it 
        //by looping through dataset table
        List<CascadingDropDownNameValue> ItemNames
        = new List<CascadingDropDownNameValue>();
        foreach (DataRow dRow in objDs.Tables[0].Rows)
        {
            string ItemID = dRow["Item_ID"].ToString();
            string ItemName = dRow["Item_Name"].ToString();
            ItemNames.Add(new CascadingDropDownNameValue
            (ItemName, ItemID));
        }
        return ItemNames.ToArray();


    }
// Cascading Dropdown 2
    [WebMethod]
    public CascadingDropDownNameValue[] GetUnits
    (string knownCategoryValues, string category, string contextKey)
    {
        int itemID = 0;

        if (contextKey != null)
        {
            SqlConnection con1 = new SqlConnection(strConnection);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con1;
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.Parameters.AddWithValue("@ItemName", contextKey);
            cmd1.CommandText = "SELECT Item_ID FROM Inventory_Item WHERE Item_Name = @ItemName";
            con1.Open();

            itemID = (int)cmd1.ExecuteScalar();
            con1.Close();
        }

        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Parameters.AddWithValue("@itemID", itemID);
        cmd.CommandText =
        "SELECT * FROM Unit WHERE Item_ID = @itemID ORDER BY Unit_Name";

        SqlDataAdapter dAdapter = new SqlDataAdapter();
        dAdapter.SelectCommand = cmd;
        con.Open(); 
        DataSet objDs = new DataSet();
        dAdapter.Fill(objDs);
        con.Close();
        List<CascadingDropDownNameValue> ItemUnits =
        new List<CascadingDropDownNameValue>();
        foreach (DataRow dRow in objDs.Tables[0].Rows)
        {
            string unitID = dRow["Unit_ID"].ToString();
            string unitName = dRow["Unit_Name"].ToString();
            ItemUnits.Add(new CascadingDropDownNameValue
            (unitName, unitID));
        }
        return ItemUnits.ToArray();
    }

//Autocomplete 
    [WebMethod]
    public string[] GetItemInfo(string prefixText)
    {
        string sql = "Select Item_Name from Inventory_Item Where Item_Name like @prefixText";
        SqlDataAdapter da = new SqlDataAdapter(sql,strConnection);
        da.SelectCommand.Parameters.Add("@prefixText", SqlDbType.VarChar, 50).Value = prefixText+ "%"; 
        DataTable dt = new DataTable(); 
        da.Fill(dt); 
        string[] items = new string[dt.Rows.Count];
        int i = 0; 
        foreach (DataRow dr in dt.Rows) 
        { 
        items.SetValue(dr["Item_Name"].ToString(),i); 
        i++; 
        } 
        return items; 

    }

}