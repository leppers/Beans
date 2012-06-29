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



public partial class donation_Default : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
       
       Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!IsPostBack)
        {
            //Session["DonationList"] = new List<DonationItem>();
            //Create New Donation List
            ViewState["DonationList"] = new List<DonationItem>();
            //Call Bind Dropdown Fucntion to populate dropdowns
            BindDropDown();
            //Make buttons visible
            btnAddDonation.Visible = true;
           
            btnSearchDonation.Visible = true;
            btnManageDonors.Visible = true;
        }
        if (IsPostBack)

        {
           if(ViewState["DonationList"] == null)
               ViewState["DonationList"] = new List<DonationItem>();
           // if (Session["DonationList"] == null)
              //  Session["DonationList"] = new List<DonationItem>();
        }
     }
    protected void btnAddDonation_Click(object sender, EventArgs e)
    {       
        MultiView1.ActiveViewIndex = 0;
        txtDateTime.Text = DateTime.Now.ToString();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = -1;
        //Session.Remove("DonationList");
        ViewState.Clear();
        ViewState["DonationList"] = new List<DonationItem>();
        
        LineItemRepeater.DataSource = "";
        LineItemRepeater.DataBind();
        
        btnAddDonation.Visible = true;
       
        btnSearchDonation.Visible = true;
        btnManageDonors.Visible = true;
    }
    
    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        btnAddDonation.Visible = false;

        btnSearchDonation.Visible = false;
        btnManageDonors.Visible = false;
       

        List<DonationItem> newDonationItem = (List<DonationItem>)ViewState["DonationList"];
       // List<DonationItem> newDonationItem = (List<DonationItem>)Session["DonationList"];
        txtAddItemID.Text = newDonationItem.Count.ToString();
        
        DonationItem newItem = new DonationItem();
        newItem.ItemID = int.Parse(txtAddItemID.Text);
       
        newItem.ItemType = int.Parse(ddlAddItemType.Text);
        newItem.ItemDescription = txtAddItemDescription.Text;
        newItem.ItemWeight = double.Parse(txtAddItemWeight.Text);
        newItem.ItemID = newDonationItem.Count + 1;
        newItem.CategoryName = ddlAddItemType.SelectedItem.Text.ToString();

        //Add NewItem to List
        newDonationItem.Add(newItem);
        //DataBind NewItem to Repeater
        LineItemRepeater.DataSource = newDonationItem;
        LineItemRepeater.DataBind();
        ViewState["DonationList"] = newDonationItem;
       // Session["DonationList"] = newDonationItem;
        if (newDonationItem.Count >= 1)
        {
            lblInvalidDonation.Text = "";
            lblInvalidDonation.Visible = false;
        }
        addItemReset();
     
    }

    protected void btnDeleteItem_Click(object sender, EventArgs e)
    {
       Button deleteButton = sender as Button;
       List<DonationItem> newDonationItem = (List<DonationItem>)ViewState["DonationList"];
       //List<DonationItem> newDonationItem = (List<DonationItem>)Session["DonationList"]; 
       int lineItem = ((RepeaterItem)deleteButton.NamingContainer).ItemIndex;
        newDonationItem.RemoveAt(lineItem);
        //ReDataBind NewItem to Repeater
        int i = 1;
        foreach  (DonationItem item in newDonationItem)
        {
            item.ItemID = i;
            i++;
        }
        LineItemRepeater.DataSource = newDonationItem;
        LineItemRepeater.DataBind();
    }
    protected void BindDropDown()
    {
        SqlConnection beansdbconnection;
        beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ToString());
        try
        {
        beansdbconnection.Open();
        
        SqlCommand beansSQLCommand = new SqlCommand("SELECT Entity_ID, Entity_Contact_FName, Entity_Contact_LName, Entity_Organization_Name FROM Entity WHERE Entity_Support_Type <> 'v' ", beansdbconnection);
        SqlDataReader dataReader = beansSQLCommand.ExecuteReader();
        while (dataReader.Read())
        {
            string DonorID = dataReader.GetSqlInt32(0).Value.ToString();
            if (dataReader.GetSqlString(3).IsNull)
            {
                string DonorName = dataReader.GetSqlString(1).Value + " " + dataReader.GetSqlString(2).Value;
                ddlDonorID.Items.Add(new ListItem(DonorName, DonorID));
            }
            else
            {
                string DonorName = dataReader.GetSqlString(3).Value + " - " + dataReader.GetSqlString(1).Value + " " + dataReader.GetSqlString(2).Value;
                ddlDonorID.Items.Add(new ListItem(DonorName, DonorID));
            }
           // string DonorName = dataReader.GetSqlString(1).Value;
          
            
        }
        dataReader.Close();
       
        SqlCommand beansSQLCommand2 = new SqlCommand("SELECT Employee_ID, Employee_FName, Employee_LName FROM Employee", beansdbconnection);
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
            Response.Write("Could Not Open Database To Poulate Dropdowns");
        }
        ddlDonorID.Items.Insert(0, new ListItem("[Please select any Donor Name]", ""));
        ddlEmployeeID.Items.Insert(0, new ListItem("[Please select any Employee Name]", ""));
        ddlAddItemType.Items.Insert(0, new ListItem("[Please select any Item Type]", ""));
    }

  

   
    
    protected void btnSearchDonation_Click(object sender, EventArgs e)
    {
        Server.Transfer("DonationSearch.aspx");
    }
   

    protected void btnManageDonors_Click(object sender, EventArgs e)
    {
        Response.Redirect("Donor.aspx");
    }


    protected void btnFinish_Click(object sender, EventArgs e)
    {
        List<DonationItem> newDonationItem = (List<DonationItem>)ViewState["DonationList"];
       // List<DonationItem> newDonationItem = (List<DonationItem>)Session["DonationList"];
        

        if (newDonationItem.Count >= 1)
        {
           // lblInvalidDonation.Text = newDonationItem.Count.ToString();
     
            lblInvalidDonation.Visible = true;
            int DonorID = int.Parse(ddlDonorID.SelectedValue);
            String DonationAction = ddlAction.Text;
            int EmployeeID = int.Parse(ddlEmployeeID.SelectedValue);
            DateTime datetime = DateTime.Parse(DateTime.Now.ToString());

            Double DValue = 0.0;
           

            SqlConnection beansdbconnection;
            beansdbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v4ConnectionString"].ToString());
            try
            {
                beansdbconnection.Open();

                SqlCommand beansSQLCommand =
                    new SqlCommand("INSERT INTO Donation (Entity_ID, Donation_Action, Donation_DateTime, Employee_ID, Donation_Value)VALUES (@EntityID, @Action ,@datetime ,@EmployeeID, @Value); SELECT CAST(scope_identity() AS int);", beansdbconnection);
                beansSQLCommand.Parameters.Add("@EntityID", SqlDbType.Int).Value = DonorID;
                beansSQLCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = DonationAction;
                beansSQLCommand.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = EmployeeID;
                beansSQLCommand.Parameters.Add("@datetime", SqlDbType.DateTime).Value = datetime;
                beansSQLCommand.Parameters.Add("@Value", SqlDbType.Decimal).Value = DValue;

                Int32 DonationID = (Int32)beansSQLCommand.ExecuteScalar();
                hfDonationID.Value = DonationID.ToString();


                foreach (DonationItem item in newDonationItem)
                {
                    //lblTest.Text = DonationID.ToString();
                    SqlCommand beansSQLCommand2 = new SqlCommand("INSERT INTO DonLin (DonLin_ID, Donation_ID, Category_ID, Item_Description, DonLin_Weight) VALUES (@ItemID, @DonationID, @ItemType, @ItemDesc ,@Weight);", beansdbconnection);
                    beansSQLCommand2.Parameters.Add("@ItemID", SqlDbType.Int).Value = item.ItemID;
                    beansSQLCommand2.Parameters.Add("@DonationID", SqlDbType.Int).Value = DonationID;
                    beansSQLCommand2.Parameters.Add("@ItemType", SqlDbType.Int).Value = item.ItemType;
                    beansSQLCommand2.Parameters.Add("@ItemDesc", SqlDbType.VarChar).Value = item.ItemDescription;
                    beansSQLCommand2.Parameters.Add("@Weight", SqlDbType.Decimal).Value = item.ItemWeight;
                    beansSQLCommand2.ExecuteNonQuery();
                }

            }
            catch (SqlException sqlexcept)
            {
                lblInvalidDonation.Text = "SQLExcept " + sqlexcept.ToString();
                lblInvalidDonation.Visible = true;
            }
            catch (Exception except)
            {
                lblInvalidDonation.Text = "Except " + except.ToString();
                lblInvalidDonation.Visible = true;
            }
            finally
            {
                beansdbconnection.Close();

                MultiView1.ActiveViewIndex = 1;
                newDonationItem.Clear();
                LineItemRepeater.Controls.Clear();
            }

        }
        else
        {
            lblInvalidDonation.Text = "No Donation Added";
            lblInvalidDonation.Visible = true;
            MultiView1.ActiveViewIndex = -1;

        }
        
    }
    

    protected void lnkPrint_Click(object sender, EventArgs e)
    {
        Server.Transfer("print_receipt.aspx?receiptID=" + hfDonationID.Value);
    }
    protected void addItemReset()
    {
        txtAddItemDescription.Text = "";
        txtAddItemWeight.Text = "0";
    }
    protected void lnkClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
        MultiView1.ActiveViewIndex = -1;
        //Session.Remove("DonationList");
        ViewState.Clear();
        ViewState["DonationList"] = new List<DonationItem>();

        LineItemRepeater.DataSource = "";
        LineItemRepeater.DataBind();

        btnAddDonation.Visible = true;

        btnSearchDonation.Visible = true;
        btnManageDonors.Visible = true;
        
    }
}

        
     








    

