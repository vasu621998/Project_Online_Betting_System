using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

namespace Project.admin
{
    public partial class players : System.Web.UI.Page
    {
        mydatabaseEntities et = new mydatabaseEntities();
        event_db e1 = new event_db();
        team_db t1 = new team_db();
        team_db t2 = new team_db();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                HttpCookie cke = Request.Cookies["admin"];
                int eid = Convert.ToInt32(cke["eid"]);

                e1 = et.event_db.Where(eve => eve.event_id == eid).FirstOrDefault<event_db>();
                t1 = et.team_db.Where(tdb => tdb.team_name == e1.event_team_1).FirstOrDefault<team_db>();
                t2 = et.team_db.Where(tdb => tdb.team_name == e1.event_team_2).FirstOrDefault<team_db>();
                Image2.ImageUrl = t1.team_image;
                Image4.ImageUrl = t2.team_image;

                team1.Text = t1.team_id.ToString();
                team2.Text = t2.team_id.ToString();

                ((TemplateField)GridView1.Columns[1]).EditItemTemplate = null;
            }
        }

       /* protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            HttpCookie cke = Request.Cookies["admin"];
            int eid = Convert.ToInt32(cke["eid"]);

            event_player ep = new event_player();
            ep.event_id = eid;
            string name = (GridView1.SelectedRow.FindControl("Label3") as Label).Text;
            
            ep.player_name = (GridView1.SelectedRow.FindControl("Label3") as Label).Text; ;
            ep.player_points = 0;
            ep.player_value = Convert.ToDouble((GridView1.SelectedRow.FindControl("Label6") as Label).Text);

            player_db p = new player_db();
            p = et.player_db.Where(player => player.player_name == name).FirstOrDefault<player_db>();
            ep.player_image = (GridView1.SelectedRow.FindControl("Image1") as Image).ImageUrl; ;
            ep.player_type= (GridView1.SelectedRow.FindControl("Label5") as Label).Text;
            ep.player_team= (GridView1.SelectedRow.FindControl("Label4") as Label).Text; ;
            et.event_player.Add(ep);
            et.SaveChanges();
            (GridView1.SelectedRow.FindControl("Label8") as Label).Text = "Added";
            (GridView1.SelectedRow.FindControl("Label8") as Label).Visible = true;
            (GridView1.SelectedRow.FindControl("Button2") as Button).Visible = false;
        }*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie cke = Request.Cookies["admin"];
            int eid = Convert.ToInt32(cke["eid"]);
            e1 = et.event_db.Where(eve => eve.event_id == eid).FirstOrDefault<event_db>();
            e1.event_status = "open";
            et.SaveChanges();

            Response.Redirect("ahome.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("insert"))
            {
                player_db p = new player_db();
                team_db t2 = new team_db();

                TextBox name = GridView1.FooterRow.FindControl("name") as TextBox;
                TextBox value = GridView1.FooterRow.FindControl("value") as TextBox;
                DropDownList team = GridView1.FooterRow.FindControl("team") as DropDownList;
                DropDownList status = GridView1.FooterRow.FindControl("status") as DropDownList;
                DropDownList type = GridView1.FooterRow.FindControl("type") as DropDownList;
                FileUpload fu = GridView1.FooterRow.FindControl("image") as FileUpload;

                if (fu.HasFile)
                {
                    String s = Path.GetFileName(fu.FileName);
                    fu.SaveAs(Server.MapPath("~/images/" + team.SelectedItem.Text + "/") + s);
                }
                string s1 = Path.GetFileName(fu.FileName);
                t2 = et.team_db.Where(t => t.team_name == team.SelectedItem.Text).FirstOrDefault<team_db>();
                p.team_id = t2.team_id;
                p.player_name = name.Text;
                p.player_type = type.SelectedItem.Text;
                p.player_value = Convert.ToDouble(value.Text);
                p.player_status = status.SelectedItem.Text;
                p.player_image = "~/images/" + team.SelectedItem.Text + "/" + s1;
      
                et.player_db.Add(p);
                et.SaveChanges();
                GridView1.DataBind();

            }
        }

    }
}