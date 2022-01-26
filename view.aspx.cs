using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Project
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Mode"] == "deleted")
            {
                Response.Write("Sorry, Your team is not submitted as the event is already locked");
            }
            else
            {
                mydatabaseEntities et = new mydatabaseEntities();
                event_db e1 = new event_db();
                user_db u = new user_db();
                user_team_db ut1 = new user_team_db();
                team_db t1 = new team_db();
                HttpCookie cookie = Request.Cookies["events"];
                int eid = Convert.ToInt32(cookie["eid"]);
                string uname = cookie["uname"];

                u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();

                ut1 = et.user_team_db.Where(user => user.user_id == u.user_id && user.event_id == eid).FirstOrDefault<user_team_db>();

                e1 = et.event_db.Where(edb => edb.event_id == eid).FirstOrDefault<event_db>();
                t1 = et.team_db.Where(t => t.team_name == e1.event_team_1).FirstOrDefault<team_db>();
                Image5.ImageUrl = t1.team_image;
                t1 = et.team_db.Where(t => t.team_name == e1.event_team_2).FirstOrDefault<team_db>();
                Image7.ImageUrl = t1.team_image;

                Label2.Text = ut1.user_team_name;
                Label3.Text = ut1.user_team_id.ToString();
                Label4.Text = ut1.star_bats;
                Label5.Text = ut1.star_bowl;
                DataList1.DataBind();

                if (Request.QueryString["Mode"] == "locked")
                {
                    Button2.Visible = false;
                    Button3.Visible = false;
                    Label6.Visible = true;
                    LinkButton1.Visible = true;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("delete.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string url = "team.aspx?Mode=edit";
            Response.Redirect(url);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.cricbuzz.com/");
        }
    }
}