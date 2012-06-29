using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    String StartDate = ""; 
    String EndDate = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void rblChooseSystem_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (rblChooseSystem.SelectedValue == "Inventory")
        {

            pnlDonation.Visible = false;
            pnlVolunteer.Visible = false;
            pnlInventory.Visible = true;
        }
        else
        {
            if (rblChooseSystem.SelectedValue == "Volunteer")
            {

                pnlInventory.Visible = false;
                pnlDonation.Visible = false;
                pnlVolunteer.Visible = true;

            }
            else
            {
                pnlInventory.Visible = false;
                pnlVolunteer.Visible = false;
                pnlDonation.Visible = true;

            }
        }

    }
    //protected void rblWhichTimeFrame_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    switch (rblWhichTimeFrame.SelectedValue)
    //    {
    //        case "Year":
    //            StartDate = ("01/01/" + ddlWhichYear.SelectedValue);
              
    //            EndDate = (12 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
                
    //            pnlChooseMonth.Visible = false;
    //            pnlChooseQuarter.Visible = false;
    //            tbStartDate.ReadOnly = true;
    //            tbEndDate.ReadOnly = true;
    //            ddlWhichYear.Visible = true;
                
               
    //            break;
    //        case "Quarter":
    //            pnlChooseMonth.Visible = false;
    //            pnlChooseQuarter.Visible = true;
    //            tbStartDate.ReadOnly = true;
    //            tbEndDate.ReadOnly = true;
    //            ddlWhichYear.Visible = true;
    //            break;
    //        case "Month":
    //            pnlChooseQuarter.Visible = false;
    //            pnlChooseMonth.Visible = true;
    //            tbStartDate.ReadOnly = true;
    //            tbEndDate.ReadOnly = true;
    //            ddlWhichYear.Visible = true;
    //            break;
    //        case "Date Range":
    //            pnlChooseQuarter.Visible = false;
    //            pnlChooseMonth.Visible = false;
    //            pnlChooseDateRange.Visible = true;
    //            tbStartDate.ReadOnly = false;
    //            tbEndDate.ReadOnly = false;
    //            btnDateRange.Visible = true;
    //            ddlWhichYear.Visible = false;
    //            break;
    //    }
    //    tbStartDate.Text = StartDate;
    //    tbEndDate.Text = EndDate;
    //    RefreshReports();
        
       
    //}


    //protected void ddlChooseQuarter_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    switch (ddlChooseQuarter.SelectedValue)
    //    {
    //        case "1":
                
    //            StartDate =(01 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
    //            EndDate = (03 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
    //            break;
    //        case "2":
    //            StartDate = (04 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
    //            EndDate = (06 + "/" + 30 + "/" + ddlWhichYear.SelectedValue);
    //            break;
    //        case "3":
    //            StartDate = (07 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
    //            EndDate = (09 + "/" + 30 + "/" + ddlWhichYear.SelectedValue);
    //            break;
    //        case "4":
    //            StartDate = (10 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
    //            EndDate = (12 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
    //            break;

    //    }
    //    tbStartDate.Text =StartDate;
    //    tbEndDate.Text = EndDate;
    //    RefreshReports();

    //}
//    protected void ddlChooseMonth_SelectedIndexChanged(object sender, EventArgs e)
//    {
//        switch (ddlChooseMonth.SelectedValue)
//        {
//            case "1":
                
//                StartDate = (01 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (01 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);

//                break;
//            case "2":
//                // Have to check if february is a leap year
//                int year = int.Parse(ddlWhichYear.SelectedValue);
//                bool isleap = CheckLeapYear(year);
//                //if isleap is true then it is a leap year
//                if (isleap == false)
//                {
//                    //when there is not a leap year
//                    StartDate = (02 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                    EndDate = (02 + "/" + 28 + "/" + ddlWhichYear.SelectedValue);
                    
//                }
//                else
//                {
//                    //when there is a leap year.
//                    StartDate = (02 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                    EndDate = (02 + "/" + 29 + "/" + ddlWhichYear.SelectedValue);
                    
//                }
//                break;

//            case "3":
//                StartDate = (03 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (03 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
                
//                break;
//            case "4":
//                StartDate = (04 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (04 + "/" + 30 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "5":
//                StartDate = (05 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (05 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "6":
//                StartDate = (06 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (06 + "/" + 30 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "7":
//                StartDate = (07 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (07 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "8":
//                StartDate = (08 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (08 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "9":
//                StartDate = (09 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (09 + "/" + 30 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "10":
//                StartDate = (10 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (10 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
//                break;
//            case "11":
//                StartDate = (11 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = ("11/30/" + ddlWhichYear.SelectedValue);
//                break;
//            case "12":
//                StartDate = (12 + "/" + 01 + "/" + ddlWhichYear.SelectedValue);
//                EndDate = (12 + "/" + 31 + "/" + ddlWhichYear.SelectedValue);
//                break;

//        }
//        tbStartDate.Text = (StartDate);
//        tbEndDate.Text = (EndDate);
//        RefreshReports();

//    }
//    private bool CheckLeapYear(int year)
//    {
//        bool leapYear = false;
//        leapYear = (((year % 4) == 0) && ((year % 100) != 0) || ((year % 400) == 0));
//        if (leapYear.Equals(true))
//            return true;
//        else
//            return false;
//    }



// protected void RefreshReports()
//{
//    //rv_DonOrgByDate.LocalReport.Refresh();

//    rv_newInvWaste.LocalReport.Refresh();

//        if (rblChooseSystem.SelectedValue == "Inventory")
//        {

           
//        }
//        else
//        {
//            if (rblChooseSystem.SelectedValue == "Volunteer")
//            {
//                //rv_VolunteerHours.Refresh();
                
               
                
//            }
//            else
//            {
//                rv_DonOrgByDate.LocalReport.Refresh();

//            }
//    }

//}
// protected void btnDateRange_Click(object sender, EventArgs e)
// {
//     //RefreshReports();
// }
// protected void ddlWhichYear_SelectedIndexChanged(object sender, EventArgs e)
// {
//     /*if (rblWhichTimeFrame.SelectedIndex == 0)
//     {

//         ddlWhichYear.AutoPostBack = true;
//     }
//     else
//     {
//         ddlWhichYear.AutoPostBack = false;

//     }
//        */
// }
}
