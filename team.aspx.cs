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

    public partial class team : System.Web.UI.Page
    {
        mydatabaseEntities et = new mydatabaseEntities();
        
        playerload pl = new playerload();
        event_db e1 = new event_db();
        team_db t1 = new team_db();
        team_db t2 = new team_db();
        event_player epdb = new event_player();
        user_team_db ut = new user_team_db();
        user_db u = new user_db();

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);
            string uname = cookie["uname"];
            Label5.Text = eid.ToString();
            e1 = et.event_db.Where(edb => edb.event_id == eid).FirstOrDefault<event_db>();
            t1 = et.team_db.Where(tdb => tdb.team_name == e1.event_team_1).FirstOrDefault<team_db>();
            t2 = et.team_db.Where(tdb => tdb.team_name == e1.event_team_2).FirstOrDefault<team_db>();
            Image1.ImageUrl = t1.team_image;
            Image3.ImageUrl = t2.team_image;

            if (!Page.IsPostBack)
            {
               
                if (Request.QueryString["Mode"] == "edit")
                {
                    double price = 100;
                    user_team_db ut1 = new user_team_db();
                   

                    u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();

                    ut1 = et.user_team_db.Where(user => user.user_id == u.user_id && user.event_id == eid).FirstOrDefault<user_team_db>();
                    var up = et.user_player_db.Where(player => player.user_team_id == ut1.user_team_id).AsEnumerable<user_player_db>();

                    int utid = ut1.user_team_id;
                    Label6.Text = utid.ToString();
                    Label18.Text = ut1.user_team_name;
                    Label17.Visible = true;
                    Label18.Visible = true;

                    foreach (var u in up.ToList<user_player_db>())
                    {
                        price -= Convert.ToDouble(u.player_value);
                    }
                    this.ViewState["price"] = price;
                    Label14.Text = ViewState["price"].ToString();

                    pl.Getedit(eid, utid);
                    DataList1.DataBind();
                    DataList2.DataBind();
                    Wizard1.Visible = true;
                    // DropDownList3.SelectedIndex = DropDownList3.Items.IndexOf(DropDownList3.Items.FindByText(ut1.star_bats));
                    // DropDownList4.SelectedIndex = DropDownList4.Items.IndexOf(DropDownList4.Items.FindByText(ut1.star_bowl));

                    
                    validatePlayer(utid, t1.team_name);
                    validatePlayer(utid, t2.team_name);

                    if (TextBox1.Text == "") { TextBox1.Text = ut1.user_team_name; }
                    Label19.Text = "Selected-" + ut1.star_bats;
                    Label19.Visible = true;
                    Label20.Text = "Selected-" + ut1.star_bowl;
                    Label20.Visible = true;
                }
                else
                {

                    this.ViewState["price"] = 100;
                    this.ViewState["flag"] = 1;

                    Label14.Text = ViewState["price"].ToString();
                    pl.Getplayers(eid);

                    DataList1.DataBind();
                    Wizard1.Visible = true;

                }
                string constr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                string query = "select distinct player_team from event_player where event_id=" + eid;
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "player_team";
                DropDownList1.DataValueField = "player_team";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--Select Team--", "0"));
                DropDownList1.EnableViewState = true;
                query = "select distinct player_type from event_player";
                cmd = new SqlCommand(query, con);
                DropDownList2.DataSource = cmd.ExecuteReader();
                DropDownList2.DataTextField = "player_type";
                DropDownList2.DataValueField = "player_type";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("--Select Type--", "0"));
                DropDownList2.EnableViewState = true;
                con.Close();
            }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            String uname = cookie["uname"];
            u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();
            int uid = u.user_id;
            int eid = Convert.ToInt32(cookie["eid"]);

            if (Request.QueryString["Mode"] == "edit")
            {
                user_team_db ut1 = new user_team_db();
                ut1 = et.user_team_db.Where(user => user.user_id == u.user_id && user.event_id == eid).FirstOrDefault<user_team_db>();
                ut1.user_team_name = TextBox1.Text;
                et.SaveChanges();
                Label6.Text = ut1.user_team_id.ToString();
            }
            else
            {
                ut.event_id = eid;
                ut.user_id = uid;
                ut.user_team_name = TextBox1.Text;
                et.user_team_db.Add(ut);
                et.SaveChanges();
                Label6.Text = ut.user_team_id.ToString();
            }
            
            Label18.Text = TextBox1.Text;
            Label18.Visible = true;

        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            String uname = cookie["uname"];
            u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();

            ut = et.user_team_db.Where(user => user.user_id == u.user_id).FirstOrDefault<user_team_db>();
            int utid = ut.user_team_id;
            Label6.Text = utid.ToString();

            user_player_db up = new user_player_db();
            up.user_team_id = utid;
            up.player_name = ((Label)e.Item.FindControl("player_nameLabel")).Text;
            up.player_team = ((Label)e.Item.FindControl("player_teamLabel")).Text;
            up.player_type = ((Label)e.Item.FindControl("player_typeLabel")).Text;
            up.player_value = Convert.ToDouble(((Label)e.Item.FindControl("player_valueLabel")).Text);

            double price = Convert.ToDouble(ViewState["price"]);
            price -= (Convert.ToDouble(((Label)e.Item.FindControl("player_valueLabel")).Text));
            this.ViewState["price"] = price;

            String pname = ((Label)e.Item.FindControl("player_nameLabel")).Text;
            epdb = et.event_player.Where(pl => pl.player_name == pname).FirstOrDefault<event_player>();
            up.player_image = epdb.player_image;
            string plname = ((Label)e.Item.FindControl("player_nameLabel")).Text;
            epdb = et.event_player.Where(pln => pln.player_name == plname).FirstOrDefault<event_player>();

            et.event_player.Remove(epdb);
            et.user_player_db.Add(up);

            et.SaveChanges();
            DataList1.DataBind();
            DataList2.DataBind();

            validatePlayer(utid,up.player_team);

        }



        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);

            event_player ep1 = new event_player();
            user_player_db up1 = new user_player_db();

            ep1.event_id = eid; 
            ep1.player_name = ((Label)e.Item.FindControl("player_nameLabel")).Text;
            ep1.player_team = ((Label)e.Item.FindControl("player_teamLabel")).Text;
            ep1.player_type = ((Label)e.Item.FindControl("player_typeLabel")).Text;
            ep1.player_value = Convert.ToDouble(((Label)e.Item.FindControl("player_valueLabel")).Text);
            double price = Convert.ToDouble(ViewState["price"]);
            price += (Convert.ToDouble(((Label)e.Item.FindControl("player_valueLabel")).Text));
            this.ViewState["price"] = price;

            String pname = ((Label)e.Item.FindControl("player_nameLabel")).Text;
            up1 = et.user_player_db.Where(pl => pl.player_name == pname).FirstOrDefault<user_player_db>();
            ep1.player_image = up1.player_image;
            
            et.event_player.Add(ep1);
            et.user_player_db.Remove(up1);

            et.SaveChanges();
            DataList1.DataBind();
            DataList2.DataBind();

            int utid = Convert.ToInt32(Label6.Text);
            validatePlayer(utid,ep1.player_team);
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);

            string tname = DropDownList1.SelectedItem.Text;
            string constring = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (DropDownList1.SelectedIndex == 0)
            {
                if (DropDownList2.SelectedIndex > 0)
                    SqlDataSource1.SelectCommand = "select player_name,player_type,player_value,player_team,player_image from event_player where event_id=" + eid + "and player_type='" + DropDownList2.SelectedItem.Text + "'";
                else
                    SqlDataSource1.SelectCommand = "select distinct player_name,player_type,player_value,player_team,player_image from event_player where event_id=" + eid;
            }
            else
            {
                if (DropDownList2.SelectedIndex > 0)
                    SqlDataSource1.SelectCommand = "select distinct player_name,player_type,player_value,player_team,player_image from event_player where player_type='" + DropDownList2.SelectedItem.Text + "' and event_id=" + eid + " and player_team='" + tname + "'";
                else
                    SqlDataSource1.SelectCommand = "select distinct player_name,player_type,player_value,player_team,player_image from event_player where event_id=" + eid + " and player_team='" + tname+ "'";
            }
            DataList1.DataBind();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);

            string ptype = DropDownList2.SelectedItem.Text;
            string constring = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (DropDownList2.SelectedIndex == 0)
            {
                if (DropDownList1.SelectedIndex > 0)
                    SqlDataSource1.SelectCommand = "select player_name,player_type,player_value,player_team,player_image from event_player where event_id=" + eid + "and player_team='" + DropDownList1.SelectedItem.Text + "'";
                else
                    SqlDataSource1.SelectCommand = "select distinct player_name,player_type,player_value,player_team,player_image from event_player where event_id=" + eid;
            }
            else
            {
                if (DropDownList1.SelectedIndex > 0)
                    SqlDataSource1.SelectCommand = "select distinct player_name,player_type,player_value,player_team,player_image from event_player where player_type='" + ptype + "' and event_id=" + eid + " and player_team='" + DropDownList1.SelectedItem.Text + "'";
                else
                    SqlDataSource1.SelectCommand = "select distinct player_name,player_type,player_value,player_team,player_image from event_player where event_id=" + eid + " and player_type='" + ptype + "'";
            }
            DataList1.DataBind();
        }

        protected void validatePlayer(int utid,string team)
        {
            int flag = 1;
            double price = Convert.ToDouble(ViewState["price"]);
            var updb = et.user_player_db.Where(val => val.player_type == "batsman" && val.user_team_id == utid).AsEnumerable();
            
            if (updb.Count() > 5)
            {
                Label7.Text = (updb.Count() - 5).ToString() + "batsman exceeded";
                Label7.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            else if(updb.Count() == 5)
            {
                Label7.Text = "batsmans selected";
                Label7.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label7.Text = (5 - updb.Count()).ToString() + "batsman remaining";
                Label7.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            updb = et.user_player_db.Where(val => val.player_type == "allrounder" && val.user_team_id == utid).AsEnumerable();
            if (updb.Count() > 1)
            {
                Label9.Text = (updb.Count() - 1).ToString() + "all-rounder exceeded";
                Label9.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            else if (updb.Count() == 1)
            {
                Label9.Text = "all-rounder selected";
                Label9.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label9.Text = (1 - updb.Count()).ToString() + "all-rounder remaining";
                Label9.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            updb = et.user_player_db.Where(val => val.player_type == "wicketkeeper" && val.user_team_id == utid).AsEnumerable();
            if (updb.Count() > 1)
            {
                Label8.Text = (updb.Count() - 1).ToString() + "wicket-keeper exceeded";
                Label8.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            else if (updb.Count() == 1)
            {
                Label8.Text = "wicket-keeper selected";
                Label8.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label8.Text = (1 - updb.Count()).ToString() + "wicket-keeper remaining";
                Label8.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            updb = et.user_player_db.Where(val => val.player_type == "bowler" && val.user_team_id == utid).AsEnumerable();
            if (updb.Count() > 4)
            {
                Label10.Text = (updb.Count() - 4).ToString() + "bowler exceeded";
                Label10.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            else if (updb.Count() == 4)
            {
                Label10.Text = "bowlers selected";
                Label10.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label10.Text = (4 - updb.Count()).ToString() + "bowler remaining";
                Label10.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            updb = et.user_player_db.Where(val => val.player_team == team && val.user_team_id == utid).AsEnumerable();
            if (updb.Count() > 6)
            {
                Label11.Text = (updb.Count() - 6).ToString() + " from "+team+" exceeded";
                Label11.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            else
            {
                Label11.Text = "Players are valid from each team";
                Label11.ForeColor = System.Drawing.Color.Green;
            }
            if (price >= 0)
            {
               Label14.Text = price.ToString();
               Label14.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label14.Text = price.ToString();
                Label14.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
       
            ViewState["flag"] = flag;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int flag = Convert.ToInt32(ViewState["flag"]);
            int utid = Convert.ToInt32(Label6.Text);
            var updb = et.user_player_db.Where(val => val.user_team_id == utid).AsEnumerable();
            if (updb.Count() < 11)
            {
                Label13.Text = (11 - updb.Count()).ToString() + " players remaining";
                Label13.ForeColor = System.Drawing.Color.Red;
                flag = 0;
            }
            if (flag == 1)
            {
                Label13.Text = "Team Validated";
                Label13.ForeColor = System.Drawing.Color.Green;
                Label12.Visible = false;
                DropDownList3.Visible = true;
                DropDownList4.Visible = true;
            }
            else
            {
                Label12.Text = "Team Invalid.Please Go Back";
                Label12.ForeColor = System.Drawing.Color.Red;
            }

            string constr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            string query = "select player_name from user_player_db where user_team_id=" + utid;
            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownList3.DataSource = rdr;
            DropDownList3.DataTextField = "player_name";
            DropDownList3.DataValueField = "player_name";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("--Select Starbatsman--", "0"));
            rdr.Close();
            rdr = cmd.ExecuteReader();

            DropDownList4.DataSource = rdr;
            DropDownList4.DataTextField = "player_name";
            DropDownList4.DataValueField = "player_name";
            DropDownList4.DataBind();
            DropDownList4.Items.Insert(0, new ListItem("--Select StarBatsman--", "0"));
            con.Close();

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            int eid = Convert.ToInt32(Label5.Text);
            int utid = Convert.ToInt32(Label6.Text);
            if (Request.QueryString["Mode"] == "edit")
            {
                ut = et.user_team_db.Where(user => user.user_team_id == utid && user.event_id == eid).FirstOrDefault<user_team_db>();
                ut.star_bats = DropDownList3.SelectedItem.Text;
            }
            else
            {
                ut = et.user_team_db.Where(user => user.user_team_id == utid).FirstOrDefault<user_team_db>();
                ut.star_bats = DropDownList3.SelectedItem.Text;
            }
            et.SaveChanges();
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            int eid = Convert.ToInt32(Label5.Text);
            int utid = Convert.ToInt32(Label6.Text);
            if (Request.QueryString["Mode"] == "edit")
            {
                ut = et.user_team_db.Where(user => user.user_team_id == utid && user.event_id == eid).FirstOrDefault<user_team_db>();
                ut.star_bowl = DropDownList4.SelectedItem.Text;
            }
            else
            {
                ut = et.user_team_db.Where(user => user.user_team_id == utid).FirstOrDefault<user_team_db>();
                ut.star_bowl = DropDownList4.SelectedItem.Text;
            }
            et.SaveChanges();
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            int eid = Convert.ToInt32(cookie["eid"]);
            e1 = et.event_db.Where(edb => edb.event_id == eid).FirstOrDefault<event_db>();
            if(Request.QueryString["Mode"] != "edit")
                e1.event_count += 1;
            et.event_player.RemoveRange(et.event_player.Where(ed => ed.event_id == eid));

            if(e1.event_status == "closed")
            {
                e1.event_count -= 1;
                int utid = Convert.ToInt32(Label6.ToString());
                et.user_player_db.RemoveRange(et.user_player_db.Where(ed => ed.user_team_id == utid));
                
                et.user_team_db.Remove(et.user_team_db.Where(ed => ed.event_id == eid && ed.user_team_id == utid).FirstOrDefault<user_team_db>());
                et.SaveChanges();
                Response.Redirect("view.aspx?Mode=deleted");
            }

            et.SaveChanges();
            
            Response.Redirect("view.aspx");
        }
    }
}