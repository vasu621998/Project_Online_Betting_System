using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project
{
    public class ManageEvents
    {
        mydatabaseEntities et = new mydatabaseEntities();
        event_db e1 = new event_db();

        public void Updateevents()
        {
            var e = et.event_db.Where(events => events.event_status == "open" || events.event_status == "hidden").AsEnumerable<event_db>();
            foreach(var eve in e.ToList<event_db>())
            {
                string time = DateTime.Now.ToLongTimeString();
                string date = DateTime.Now.ToShortDateString();
              //  int a = time.CompareTo(eve.event_start.ToString());
                int b = date.CompareTo(eve.event_date.ToShortDateString());
                int c = time.CompareTo(eve.event_lock.ToString());

                
                if (eve.event_status == "open" && c >= 0 && b == 0)
                    eve.event_status = "locked";

                et.SaveChanges();
            }
        }
    }
}