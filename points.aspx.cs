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
namespace Project.admin
{
    public partial class points : System.Web.UI.Page
    {
        mydatabaseEntities et = new mydatabaseEntities();
        event_db e1 = new event_db();
        event_player ep = new event_player();
        double pts = 0;
        team_db t1 = new team_db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HttpCookie cke = Request.Cookies["admin"];
                int eid = Convert.ToInt32(cke["eid"]);
                Label1.Text = eid.ToString();
                playerload pl = new playerload();
                pl.Getplayers(eid);
                DataList1.DataBind();

                e1 = et.event_db.Where(edb => edb.event_id == eid).FirstOrDefault<event_db>();
                t1 = et.team_db.Where(t => t.team_name == e1.event_team_1).FirstOrDefault<team_db>();
                Image2.ImageUrl = t1.team_image;
                t1 = et.team_db.Where(t => t.team_name == e1.event_team_2).FirstOrDefault<team_db>();
                Image4.ImageUrl = t1.team_image;

                string constr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                string query = "select distinct player_name from event_player where event_id=" + eid;
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "player_name";
                DropDownList1.DataValueField = "player_name";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--Select Player--", "0"));
                con.Close();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            TextBox r = (e.Item.FindControl("TextBox1") as TextBox);
            if (string.IsNullOrEmpty(r.Text)) { }
            else
            {
                int runs = Convert.ToInt32((e.Item.FindControl("TextBox1") as TextBox).Text);

                if (runs == 0)
                    pts -= 5;
                if (runs >= 100)
                    pts += 30;
                else if (runs >= 50)
                    pts += 20;
                pts += runs;
            }
            TextBox f = (e.Item.FindControl("TextBox2") as TextBox);
            if (string.IsNullOrEmpty(f.Text)) { }
            else
            {
                int four = Convert.ToInt32((e.Item.FindControl("TextBox2") as TextBox).Text);
                pts += (four * 5);
            }
            TextBox s = (e.Item.FindControl("TextBox3") as TextBox);
            if (string.IsNullOrEmpty(s.Text)) { }
            else
            {
                int six = Convert.ToInt32((e.Item.FindControl("TextBox3") as TextBox).Text);
                pts += (six * 10);
            }
            TextBox w = (e.Item.FindControl("TextBox4") as TextBox);
            if (string.IsNullOrEmpty(w.Text)) { }
            else
            {
                int wk = Convert.ToInt32((e.Item.FindControl("TextBox4") as TextBox).Text);
                if (wk >= 5)
                    pts += 30;
                pts += (wk * 20);
            }
            TextBox rgv = (e.Item.FindControl("TextBox5") as TextBox);
            if (string.IsNullOrEmpty(rgv.Text)) { }
            else
            {
                int rg = Convert.ToInt32((e.Item.FindControl("TextBox5") as TextBox).Text);
                pts -= (rg * 0.25);
            }
            TextBox m = (e.Item.FindControl("TextBox6") as TextBox);
            if (string.IsNullOrEmpty(m.Text)) { }
            else
            {
                int maiden = Convert.ToInt32((e.Item.FindControl("TextBox6") as TextBox).Text);
                pts += (maiden * 5);
            }
                string pname = ((Label)e.Item.FindControl("player_nameLabel")).Text;
            int eid = Convert.ToInt32(Label1.Text);
            ep = et.event_player.Where(player => player.player_name == pname && player.event_id == eid).FirstOrDefault<event_player>();
                ep.player_points = pts;
                et.SaveChanges();
                DataList1.DataBind();
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            HttpCookie cke = Request.Cookies["admin"];
            cke["mom"] = DropDownList1.SelectedItem.Text;
            Response.Cookies.Add(cke);
            int eid = Convert.ToInt32(Label1.Text);

            e1 = et.event_db.Where(ent => ent.event_id == eid).FirstOrDefault<event_db>();
            e1.event_status = "closed";
            et.SaveChanges();
            Response.Redirect("calcresult.aspx");
        }

        
    }
}