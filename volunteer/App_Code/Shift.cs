using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Shift
/// </summary>
public partial class Shift
{
    public static int Insert(Shift shiftToInsert)
    {
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        db.Shifts.InsertOnSubmit(shiftToInsert);
        db.SubmitChanges();
        return shiftToInsert.Shift_ID;
    }
  
    public static IEnumerable<Shift> Select()
    {
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        return db.Shifts.OrderByDescending(s => s.Shift_ID);
    }
	
}
