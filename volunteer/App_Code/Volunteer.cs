using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;

/// <summary>
/// Summary description for Volunteer
/// </summary>
public partial class Volunteer
{
	public static IEnumerable<Volunteer> SelectVolunteerSchedule(DateTime dateSelected, string selectedShift)
	{
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        var date = db.Shifts.Single(s => s.Shift_Date == dateSelected && s.Shift_Name == selectedShift);
        var query = date.Volunteers;
        return query;
	}
}
