using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;

/// <summary>
/// Summary description for Entity
/// </summary>
public partial class Entity
{
    public static IEnumerable<Entity> Select()
    {
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        return db.Entities.OrderByDescending(e => e.Entity_ID);
    }
    /*public static IEnumerable<Entity> SelectPaged
        (
            int startRowIndex,
            int maximumRows
        )
    {
        return Select().Skip(startRowIndex).Take(maximumRows);
    }*/
    
	public static int Insert(Entity entityToInsert)
    {
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        db.Entities.InsertOnSubmit(entityToInsert);
        db.SubmitChanges();
        return entityToInsert.Entity_ID;
	}
    public static void Update(Entity oldEntity, Entity newEntity)
    {
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        db.Entities.Attach(newEntity, oldEntity);
        db.SubmitChanges();
    }

    public static void Delete(Entity entityToDelete)
    {
        VolunteerDatabaseDataContext db = new VolunteerDatabaseDataContext();
        db.Entities.Attach(entityToDelete);
        db.Entities.DeleteOnSubmit(entityToDelete);
        db.SubmitChanges();
    }
    
}
