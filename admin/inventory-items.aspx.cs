using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class inventory_items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtnAdd_Click(object sender, EventArgs e)
    {
        TextBox ItemName = (TextBox)GV_Item.FooterRow.FindControl("txtItemName");
        TextBox ItemDesc = (TextBox)GV_Item.FooterRow.FindControl("txtItemDesc");
        DropDownList ddlCategory = (DropDownList)GV_Item.FooterRow.FindControl("ddlCategory");
        String ItemStringID = "";

        if (ItemName.Text.Length != 0 && ItemDesc.Text.Length != 0 && ddlCategory.SelectedValue.Length != 0)
        {
           
        
        SqlConnection conn;
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Beans_DB_v5ConnectionString"].ToString());
        try
        {
            conn.Open();

            SqlCommand InsertCmd = new SqlCommand("INSERT INTO [Inventory_Item] ([Item_Name]," +
                "[Item_Description], [Category_ID]) VALUES (@ItemName, @ItemDescription, @CategoryID);" +
                "SELECT CAST(scope_identity() as INT);", conn);
            InsertCmd.Parameters.Add("ItemName",SqlDbType.VarChar).Value= ItemName.Text.ToString();
            InsertCmd.Parameters.Add("ItemDescription",SqlDbType.VarChar).Value = ItemDesc.Text.ToString();
            InsertCmd.Parameters.Add("CategoryID", SqlDbType.Int).Value = ddlCategory.SelectedValue;

            Int32 ItemID = (Int32)InsertCmd.ExecuteScalar();
            ItemStringID = ItemID.ToString();
            SqlCommand InsertUnitCmd = new SqlCommand("INSERT INTO [Unit] ([Item_ID], [Unit_Name]," +
            "[Unit_Weight], [Unit_Description]) VALUES (@ItemID, 'lbs', '1', 'pounds')", conn);
            InsertUnitCmd.Parameters.Add("ItemID", SqlDbType.Int).Value = int.Parse(ItemStringID);
            InsertUnitCmd.ExecuteNonQuery();
            GV_Item.DataBind();
            GV_Unit.DataBind();

            conn.Close();
        }
        catch
        {
            Response.Write("Could Not Open Database");
        }
            

      }
    }
      protected void btnDelete_Click(object sender, GridViewDeleteEventArgs e)
    {
        
        ItemDataSource.DeleteCommand = "DELETE FROM [Inventory_Item] WHERE [Item_ID] = @Item_ID ";
        ItemDataSource.DeleteParameters.Add("Item_ID", GV_Item.DataKeys[e.RowIndex].Value.ToString());
    
      }
  
    protected void btnEdit_RowEditing(object sender, GridViewEditEventArgs e)
    {
      
        GV_Item.EditIndex = e.NewEditIndex;
        GV_Item.DataBind();
    }
        
    protected void btnUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      
       
            Label ItemID = (Label)GV_Item.Rows[e.RowIndex].FindControl("lblEditItemID");
            TextBox ItemName = (TextBox)GV_Item.Rows[e.RowIndex].FindControl("txtEditItemName");
            TextBox ItemDesc = (TextBox)GV_Item.Rows[e.RowIndex].FindControl("txtEditItemDesc");
            DropDownList ddlCategory = (DropDownList)GV_Item.Rows[e.RowIndex].FindControl("ddlEditCategory");
            string test = ddlCategory.SelectedItem.Value;

            if (test.ToString().Equals("--Select--"))
            {
                Label Required = (Label)GV_Item.Rows[e.RowIndex].FindControl("Required");
                Required.Visible = true;
                
            }
            else
            {
                GV_Item.EditIndex = -1;
                ItemDataSource.UpdateCommand = "UPDATE Inventory_Item SET Item_Name = @Item_Name, Item_Description = @Item_Description, Category_ID = @Category_ID FROM Inventory_Item WHERE Item_ID = @Item_ID ";
                ItemDataSource.UpdateParameters.Add("Item_ID", ItemID.Text.ToString());
                ItemDataSource.UpdateParameters.Add("Item_Name", ItemName.Text.ToString());
                ItemDataSource.UpdateParameters.Add("Item_Description", ItemDesc.Text.ToString());
                ItemDataSource.UpdateParameters.Add("Category_ID", ddlCategory.SelectedItem.Value);
                ItemDataSource.Update();
                GV_Item.DataBind();
            }
        
        
    }
    protected void lnkbtnAdd_Click1(object sender, EventArgs e)
    {
        String ItemID = GV_Item.SelectedValue.ToString();
        TextBox UnitName = (TextBox)GV_Unit.FooterRow.FindControl("txtUnitName");
        TextBox UnitWeight = (TextBox)GV_Unit.FooterRow.FindControl("txtUnitWeight");
        TextBox UnitDesc = (TextBox)GV_Unit.FooterRow.FindControl("txtUnitDescription");

        if (UnitName.Text.Length != 0 && UnitWeight.Text.Length != 0)
        {


            ItemDataSource.InsertCommand = "INSERT INTO [Unit] ([Item_ID], [Unit_Name], [Unit_Weight], [Unit_Description]) VALUES (@ItemID, @UnitName, @UnitWeight, @UnitDesc)";
            ItemDataSource.InsertParameters.Add("ItemID", ItemID);
            ItemDataSource.InsertParameters.Add("UnitName", UnitName.Text.ToString());
            ItemDataSource.InsertParameters.Add("UnitWeight", UnitWeight.Text.ToString());
            ItemDataSource.InsertParameters.Add("UnitDesc", UnitDesc.Text.ToString());
            ItemDataSource.Insert();
            GV_Unit.DataBind();
        }

    }
    protected void lnkbtnAddNewUnit_Click(object sender, EventArgs e)
    {
        String ItemID = GV_Item.SelectedValue.ToString();
        TextBox UnitName = (TextBox)GV_Unit.FooterRow.FindControl("txtUnitName");
        TextBox UnitWeight = (TextBox)GV_Unit.FooterRow.FindControl("txtUnitWeight");
        TextBox UnitDesc = (TextBox)GV_Unit.FooterRow.FindControl("txtUnitDescription");

        if (UnitName.Text.Length != 0 && UnitWeight.Text.Length != 0)
        {


            ItemDataSource.InsertCommand = "INSERT INTO [Unit] ([Item_ID], [Unit_Name], [Unit_Weight], [Unit_Description]) VALUES (@ItemID, @UnitName, @UnitWeight, @UnitDesc)";
            ItemDataSource.InsertParameters.Add("ItemID", ItemID);
            ItemDataSource.InsertParameters.Add("UnitName", UnitName.Text.ToString());
            ItemDataSource.InsertParameters.Add("UnitWeight", UnitWeight.Text.ToString());
            ItemDataSource.InsertParameters.Add("UnitDesc", UnitDesc.Text.ToString());
            ItemDataSource.Insert();
            GV_Unit.DataBind();
        }

    }
    protected void lnkBtnPanel_Click(object sender, EventArgs e)
    {
        PanelAddUnit.Visible =true;
    }
  
}
