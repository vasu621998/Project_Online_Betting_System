using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;

namespace Project.admin
{ 
    public partial class calcresult : System.Web.UI.Page
    {
        mydatabaseEntities et = new mydatabaseEntities();
        event_player ep = new event_player();
        event_db e1 = new event_db();
        user_team_db ut = new user_team_db();
        user_player_db up = new user_player_db();
        result_db rs = new result_db();
        double points = 0;
        team_db t1 = new team_db();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HttpCookie cke = Request.Cookies["admin"];
                int eid = Convert.ToInt32(cke["eid"]);
                string mom = cke["mom"];
                Label1.Text = eid.ToString();

                var ut = et.user_team_db.Where(team => team.event_id == eid).AsEnumerable<user_team_db>();
                e1 = et.event_db.Where(eve => eve.event_id == eid).FirstOrDefault<event_db>();

                t1 = et.team_db.Where(t => t.team_name == e1.event_team_1).FirstOrDefault<team_db>();
                Image1.ImageUrl = t1.team_image;
                t1 = et.team_db.Where(t => t.team_name == e1.event_team_2).FirstOrDefault<team_db>();
                Image3.ImageUrl = t1.team_image;
                e1.event_mom = mom;
                et.SaveChanges();

                foreach (var user in ut.ToList<user_team_db>())
                {
                    int utid = user.user_team_id;
                    var up = et.user_player_db.Where(player => player.user_team_id == utid).AsEnumerable<user_player_db>();
                    foreach (var player in up.ToList<user_player_db>())
                    {
                        string name = player.player_name;
                        ep = et.event_player.Where(p => p.player_name == name).FirstOrDefault<event_player>();

                        if (user.star_bats == name)
                            points += Convert.ToDouble(2 * ep.player_points);
                        else if (user.star_bowl == name)
                            points += Convert.ToDouble(2 * ep.player_points);
                        else
                            points += Convert.ToDouble(ep.player_points);

                        if (name == mom)
                            points += 50;
                        

                    }
                    if (user.star_bats == mom || user.star_bowl == mom)
                        points += 50;
                    rs.event_id = eid;
                    rs.user_id = user.user_id;
                    rs.user_pts = points;
                    rs.user_team_name = user.user_team_name;
                    rs.user_rank = 1;
                    et.result_db.Add(rs);
                    et.SaveChanges();
                    points = 0;

                }
                string constr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                string query = "SELECT t.user_team_name, rank() OVER (ORDER BY t.user_pts DESC) as rank FROM result_db t";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader rdr=cmd.ExecuteReader();

                while (rdr.Read())
                {
                    string tname = rdr["user_team_name"].ToString();
                    int rank = Convert.ToInt32(rdr["rank"].ToString());

                    rs = et.result_db.Where(t => t.user_team_name == tname).FirstOrDefault<result_db>();
                    rs.user_rank = rank;
                    et.SaveChanges();
                }
                con.Close();
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                       
                Response.Redirect("ahome.aspx");
        }
    }
}