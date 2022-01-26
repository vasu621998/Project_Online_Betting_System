using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;

namespace Project
{
    public partial class result : System.Web.UI.Page
    {
        mydatabaseEntities et = new mydatabaseEntities();
        event_db e1 = new event_db();
        user_db u = new user_db();
        user_team_db ut = new user_team_db();
        user_player_db up = new user_player_db();
        result_db r = new result_db();
        event_player ep = new event_player();
        team_db t1 = new team_db();

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);
            string uname = cookie["uname"];

            e1 = et.event_db.Where(eve => eve.event_id == eid).FirstOrDefault<event_db>();
            string mom = e1.event_mom;

            t1 = et.team_db.Where(t => t.team_name == e1.event_team_1).FirstOrDefault<team_db>();
            Image12.ImageUrl = t1.team_image;
            t1 = et.team_db.Where(t => t.team_name == e1.event_team_2).FirstOrDefault<team_db>();
            Image14.ImageUrl = t1.team_image;

            u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();
            ut = et.user_team_db.Where(user => user.user_id == u.user_id).FirstOrDefault<user_team_db>();
            int utid = ut.user_team_id;
            string tname = ut.user_team_name;

            var up = et.user_player_db.Where(p => p.user_team_id == utid).AsEnumerable<user_player_db>();

            foreach(var player in up)
            {
                if(player.player_name == mom)
                {
                    Image4.Visible = true;
                    Image7.ImageUrl = player.player_image;
                    Image7.Visible = true;
                    Label10.Text = player.player_name;
                    Label10.Visible = true;
                    Label11.Text = 50.ToString();
                    Label11.Visible = true;
                }
            }

            string bats = ut.star_bats;
            string bowl = ut.star_bowl;

            ep = et.event_player.Where(p => p.player_name == bats && p.event_id == eid).FirstOrDefault<event_player>();
            Label6.Text = bats;
            Label7.Text = ep.player_points.ToString();
            Image5.ImageUrl = ep.player_image;

            ep = et.event_player.Where(p => p.player_name == bowl && p.event_id == eid).FirstOrDefault<event_player>();
            Label8.Text = bowl;
            Label9.Text = ep.player_points.ToString();
            Image6.ImageUrl = ep.player_image;

            r = et.result_db.Where(team => team.user_team_name == tname && team.event_id == eid).FirstOrDefault<result_db>();
            Label3.Text = r.user_rank.ToString();
            Label12.Text = r.user_pts.ToString();

            if (r.user_rank == 1)
                Image11.ImageUrl = "/images/gold.png";
            else if (r.user_rank == 2)
                Image11.ImageUrl = "/images/silver.png";
            else if (r.user_rank == 3)
                Image11.ImageUrl = "/images/bronze.png";

                Label1.Text = eid.ToString();
            Label2.Text = utid.ToString();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);
            r = et.result_db.Where(team => team.event_id == eid && team.user_rank==1).FirstOrDefault<result_db>();

            Label13.Text = r.user_team_name;
            Label13.Visible = true;
            Label14.Text = r.user_pts.ToString();
            Label14.Visible = true;
            Image8.Visible = true;

            r = et.result_db.Where(team => team.event_id == eid && team.user_rank == 2).FirstOrDefault<result_db>();

            Label15.Text = r.user_team_name;
            Label15.Visible = true;
            Label16.Text = r.user_pts.ToString();
            Label16.Visible = true;
            Image9.Visible = true;

            r = et.result_db.Where(team => team.event_id == eid && team.user_rank == 3).FirstOrDefault<result_db>();

            Label17.Text = r.user_team_name;
            Label17.Visible = true;
            Label18.Text = r.user_pts.ToString();
            Label18.Visible = true;
            Image10.Visible = true;

            Label19.Visible = true;
            Button2.Visible = false;
            
        }
    }
}