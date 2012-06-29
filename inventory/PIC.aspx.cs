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
using System.Collections.Generic;
using System.Data.SqlClient;



public partial class PIC : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!IsPostBack)
        {
            //Session["inventoryList"] = new List<inventoryItem>();
            //Create New Inventory List
            ViewState["inventoryList"] = new List<inventoryItem>();
            //Call Bind Dropdown Fucntion to populate dropdowns
            BindDropDown();
            //Make buttons visible
            btnAddInventory.Visible = true;

            btnSearchInventory.Visible = true;
            
        }
        if (IsPostBack)
        {
            if (ViewState["inventoryList"] == null)
                ViewState["inventoryList"] = new List<inventoryItem>();
            // if (Session["inventoryList"] == null)
            //  Session["inventoryList"] = new List<inventoryItem>();
        }
    }
    protected void btnAddInventory_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        txtDateTime.Text = DateTime.Now.ToString();
        btnAddInventory.Visible = false;
        btnSearchInventory.Visible = false;
    }

    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = -1;
        //Session.Remove("inventoryList");
        ViewState.Clear();
        ViewState["inventoryList"] = new List<inventoryItem>();

        LineItemRepeater.DataSource = "";
        LineItemRepeater.DataBind();

        btnAddInventory.Visible = true;
        btnSearchInventory.Visible = true;
      
    }

    protected void btnAddItem_Click(object sender, EventArgs e)
    {

        List<inventoryItem> newinventoryItem = (List<inventoryItem>)ViewState["inventoryList"];
        // List<inventoryItem> newinventoryItem = (List<inventoryItem>)Session["inventoryList"];
        txtAddItemID.Text = newinventoryItem.Count.ToString();

        inventoryItem newItem = new inventoryItem();
        newItem.ItemID = int.Parse(txtAddItemID.Text);
        newItem.ItemName = txtAddItemType.Text;
        newItem.UnitID = int.Parse(ddlAddUnit.Text);
        newItem.UnitName = ddlAddUnit.SelectedItem.Text;
        newItem.ItemDescription = txtAddItemDescription.Text;
        newItem.LocationID = int.Parse(ddlAddLocation.Text);
        newItem.LocationName = ddlAddLocation.SelectedItem.Text;
        newItem.ItemQty = int.Parse(txtAddItemQuantity.Text);
        newItem.ItemID = newinventoryItem.Count + 1;

        //Add NewItem to List
        newinventoryItem.Add(newItem);
        //DataBind NewItem to Repeater
        LineItemRepeater.DataSource = newinventoryItem;
        LineItemRepeater.DataBind();
        ViewState["inventoryList"] = newinventoryItem;
        // Session["inventoryList"] = newinventoryItem;
        if (newinventoryItem.Count >= 1)
        {
            lblInvalidInventory.Text = "";
            lblInvalidInventory.Visible = false;
        }
        addItemReset();

    }

    protected void btnDeleteItem_Click(object sender, EventArgs e)
    {
        Button deleteButton = sender as Button;
        List<inventoryItem> newinventoryItem = (List<inventoryItem>)ViewState["inventoryList"];
        //List<inventoryItem> newinventoryItem = (List<inventoryItem>)Session["inventoryList"]; 
        int lineItem = ((RepeaterItem)deleteButton.NamingContainer).ItemIndex;
        newinventoryItem.RemoveAt(lineItem);
        //ReDataBind NewItem to Repeater
        int i = 1;
        foreach (inventoryItem item in newinventoryItem)
        {
            item.ItemID = i;
            i++;
        }
        LineItemRepeater.DataSource = newinventoryItem;
        LineItemRepeater.DataBind();
    }
    protected void BindDropDown()
    {
        SqlConnection beansdbconnection;
        beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v4ConnectionString"].ToString());
        try
        {
            beansdbconnection.Open();
           /* SqlCommand beansSQLCommand = new SqlCommand("SELECT Unit.Unit_Name, Unit.Unit_ID, Inventory_Item.Item_Name FROM Unit INNER JOIN Inventory_Item ON Unit.Item_ID = Inventory_Item.Item_ID", beansdbconnection);
            SqlDataReader dataReader1 = beansSQLCommand.ExecuteReader();
            while (dataReader1.Read())
            {
                string UnitID = dataReader1.GetSqlInt32(1).Value.ToString();
                string ItemName = dataReader1.GetSqlString(2).Value + " " + dataReader1.GetSqlString(0).Value;
              ddlAddItemType.Items.Add(new ListItem(ItemName, UnitID));
                
            }
            dataReader1.Close();*/

            SqlCommand beansSQLCommand2 = new SqlCommand("SELECT Employee_ID, Employee_FName, Employee_LName FROM Employee Order by Employee_FName", beansdbconnection);
            SqlDataReader dataReader2 = beansSQLCommand2.ExecuteReader();
            while (dataReader2.Read())
            {
                string EmployeeID = dataReader2.GetSqlInt32(0).Value.ToString();
                string EmployeeName = dataReader2.GetSqlString(1).Value + " " + dataReader2.GetSqlString(2).Value;
                ddlEmployeeID.Items.Add(new ListItem(EmployeeName, EmployeeID));
            }
            dataReader2.Close();

            beansdbconnection.Close();
        }
        catch
        {
            Response.Write("Could Not Open Database");
        }
       
        ddlEmployeeID.Items.Insert(0, new ListItem("[Please select any Employee Name]", ""));
        //ddlAddItemType.Items.Insert(0, new ListItem("[Please select any Item Type]", ""));
        ddlAddLocation.Items.Insert(0, new ListItem("[Please select a Location]", ""));
    }



   

    protected void btnSearchInventory_Click(object sender, EventArgs e)
    {
        Server.Transfer("InventorySearch.aspx");
    }
  
   

    protected void btnFinish_Click(object sender, EventArgs e)
    {
        List<inventoryItem> newinventoryItem = (List<inventoryItem>)ViewState["inventoryList"];
        // List<inventoryItem> newinventoryItem = (List<inventoryItem>)Session["inventoryList"];


        if (newinventoryItem.Count >= 1)
        {
          
            lblInvalidInventory.Visible = true;
            int EmployeeID = int.Parse(ddlEmployeeID.Text);
            DateTime datetime = DateTime.Parse(txtDateTime.Text);

            SqlConnection beansdbconnection;
            beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v4.1ConnectionString"].ToString());
            try
            {
                beansdbconnection.Open();

                SqlCommand beansSQLCommand =
                    new SqlCommand("INSERT INTO PIC (PIC_Date, Employee_ID)VALUES (@datetime ,@EmployeeID); SELECT CAST(scope_identity() AS int);", beansdbconnection);
                beansSQLCommand.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = EmployeeID;
                beansSQLCommand.Parameters.Add("@datetime", SqlDbType.DateTime).Value = datetime;
     

                Int32 PICID = (Int32)beansSQLCommand.ExecuteScalar();
                hfInventoryID.Value = PICID.ToString();


                foreach (inventoryItem item in newinventoryItem)
                {
                    //lblTest.Text = InventoryID.ToString();
                    SqlCommand beansSQLCommand2 = new SqlCommand("INSERT INTO PIC_LineItem (PIC_Item_ID, PIC_ID, Unit_ID, Location_ID, Item_Desc, PIC_Item_Quantity) VALUES (@ItemID, @PICID, @ItemType, @LocationID, @ItemDesc ,@Quantity);", beansdbconnection);
                    beansSQLCommand2.Parameters.Add("@ItemID", SqlDbType.Int).Value = item.ItemID;
                    beansSQLCommand2.Parameters.Add("@PICID", SqlDbType.Int).Value = PICID;
                    beansSQLCommand2.Parameters.Add("@ItemType", SqlDbType.Int).Value = item.UnitID;
                    beansSQLCommand2.Parameters.Add("@ItemDesc", SqlDbType.VarChar).Value = item.ItemDescription;
                    beansSQLCommand2.Parameters.Add("@LocationID", SqlDbType.Int).Value = item.LocationID;
                    beansSQLCommand2.Parameters.Add("@Quantity", SqlDbType.Int).Value = item.ItemQty;
                    beansSQLCommand2.ExecuteNonQuery();
                }

            }
            catch (SqlException sqlexcept)
            {
                lblInvalidInventory.Text = "SQLExcept " + sqlexcept.ToString();
                lblInvalidInventory.Visible = true;
            }
            catch (Exception except)
            {
                lblInvalidInventory.Text = "Except " + except.ToString();
                lblInvalidInventory.Visible = true;
            }
            finally
            {
                beansdbconnection.Close();

                MultiView1.ActiveViewIndex = 1;
                newinventoryItem.Clear();
                LineItemRepeater.Controls.Clear();
            }

        }
        else
        {
            lblInvalidInventory.Text = "No Inventory Added";
            lblInvalidInventory.Visible = true;
            MultiView1.ActiveViewIndex = -1;

        }

    }

    protected void btnEntityLookup_Click(object sender, EventArgs e)
    {

    }

    protected void lnkPrint_Click(object sender, EventArgs e)
    {
        Server.Transfer("print_pic.aspx?PICID=" + hfInventoryID.Value);
    }
    protected void addItemReset()
    {
        txtAddItemDescription.Text = "";
        txtAddItemQuantity.Text = "0";
        txtAddItemType.Text = "";
        
    }
    protected void lnkClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    protected void getItemType(object sender, EventArgs e)
    {
        ddlAddItemType.SelectedValue = txtAddItemType.Text;
        cddItemUnit.ContextKey = txtAddItemType.Text;
        
    }


   
}






//<!--    <cc1:ModalPopupExtender ID="MPEAreYouSure" runat="server" DropShadow="True" PopupControlID="OkPanel" TargetControlID="btnFinish" OkControlID="OkButton" CancelControlID="CancelButton" />
//          <asp:Panel ID="OkPanel" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Ridge" Style="display: none" CssClass="MPEBackground">
//          <h2>Add Inventory Confirmation</h2><br />
//          <h5>Are You Sure?</h5>
//          <asp:Button ID="OkButton" runat="server" Text="Yes"  />
//          <asp:Button ID="CancelButton"
//                  runat="server" Text="No" />
//          </asp:Panel> -->













