using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project
{
    public class playerload
    {
        mydatabaseEntities et = new mydatabaseEntities();
        event_db e1 = new event_db();
        team_db t1 = new team_db();
        team_db t2 = new team_db();
        user_team_db ut = new user_team_db();
        user_player_db up = new user_player_db();
        event_player epdb = new event_player();

        public void Getplayers(int eid)
        {
            e1 = et.event_db.Where(edb => edb.event_id == eid).FirstOrDefault<event_db>();

            t1 = et.team_db.Where(tdb => tdb.team_name == e1.event_team_1).FirstOrDefault<team_db>();
            t2 = et.team_db.Where(tdb => tdb.team_name == e1.event_team_2).FirstOrDefault<team_db>();

            var p1 = et.player_db.Where(p => p.team_id == t1.team_id && p.player_status == "available").AsEnumerable<player_db>();
            var p2 = et.player_db.Where(p => p.team_id == t2.team_id && p.player_status == "available").AsEnumerable<player_db>();

            foreach (var p in p1.ToList<player_db>())
            {
                epdb.event_id = eid;
                epdb.player_team = t1.team_name;
                epdb.player_name = p.player_name;
                epdb.player_value = p.player_value;
                epdb.player_image = p.player_image;
                epdb.player_type = p.player_type;
                et.event_player.Add(epdb);
                et.SaveChanges();
            }
            foreach (var p in p2.ToList<player_db>())
            {
                epdb.event_id = eid;
                epdb.player_team = t2.team_name;
                epdb.player_name = p.player_name;
                epdb.player_value = p.player_value;
                epdb.player_image = p.player_image;
                epdb.player_type = p.player_type;
                et.event_player.Add(epdb);
                et.SaveChanges();
            }
        }

        public void Getedit(int eid,int utid)
        {
            event_player ep = new event_player();
            var up = et.user_player_db.Where(player => player.user_team_id == utid).AsEnumerable<user_player_db>();
            Getplayers(eid);
            foreach(var u in up.ToList<user_player_db>())
            {
                string name = u.player_name;
                ep = et.event_player.Where(e => e.player_name == name).FirstOrDefault<event_player>();
                et.event_player.Remove(ep);
                et.SaveChanges();
            }
        }
    }
}