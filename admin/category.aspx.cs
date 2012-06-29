using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtnAdd_Click(object sender, EventArgs e)
    {
        TextBox catName = (TextBox)GV_Category.FooterRow.FindControl("txtCategoryName");
        TextBox catDesc = (TextBox)GV_Category.FooterRow.FindControl("txtCategoryDesc");

        if (catName.Text.Length !=0 && catDesc.Text.Length != 0)
        {

            CategoryDataSource.InsertCommand = "INSERT INTO Category (Category_Name, Category_Description) VALUES (@catName, @catDesc)";
            CategoryDataSource.InsertParameters.Add("catName", catName.Text.ToString());
            CategoryDataSource.InsertParameters.Add("catDesc", catDesc.Text.ToString());
            CategoryDataSource.Insert();
            GV_Category.DataBind();
        }
    }
}
