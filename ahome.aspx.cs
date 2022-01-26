using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
namespace Project.admin
{
    public partial class ahome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Mode"] == "Ongoing")
                MultiView1.ActiveViewIndex = 1;
            else if (Request.QueryString["Mode"] == "Resulted")
                MultiView1.ActiveViewIndex = 2;
            else
                MultiView1.ActiveViewIndex = 0;

            ManageEvents me = new ManageEvents();
            me.Updateevents();
            
        }
       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie cke = Request.Cookies["admin"];
            if(cke==null)
                cke = new HttpCookie("admin");
            cke["eid"]= GridView1.SelectedRow.Cells[0].Text;
            Response.Cookies.Add(cke);
            Response.Redirect("players.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie cke = Request.Cookies["admin"];
            if (cke == null)
                cke = new HttpCookie("admin");
            cke["eid"] = GridView2.SelectedRow.Cells[0].Text;
            Response.Cookies.Add(cke);
            Response.Redirect("points.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie cke = Request.Cookies["admin"];
            if (cke == null)
                cke = new HttpCookie("admin");
            cke["eid"] = GridView3.SelectedRow.Cells[0].Text;
            Response.Cookies.Add(cke);
            Response.Redirect("points.aspx");
        }

       

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                mydatabaseEntities et = new mydatabaseEntities();
                event_db e1 = new event_db();

                TextBox label = GridView1.FooterRow.FindControl("label") as TextBox;
                TextBox st = GridView1.FooterRow.FindControl("st") as TextBox;
                TextBox lt = GridView1.FooterRow.FindControl("lt") as TextBox;
                Calendar date = GridView1.FooterRow.FindControl("date") as Calendar;
                DropDownList team1 = GridView1.FooterRow.FindControl("team1") as DropDownList;
                DropDownList team2 = GridView1.FooterRow.FindControl("team2") as DropDownList;
                DropDownList status = GridView1.FooterRow.FindControl("status") as DropDownList;

                e1.event_count = 0;
                e1.event_team_1 = team1.SelectedItem.Text;
                e1.event_team_2 = team2.SelectedItem.Text;
                e1.event_start = TimeSpan.Parse(st.Text);
                e1.event_lock = TimeSpan.Parse(lt.Text);
                e1.event_label = label.Text;
                e1.event_status = status.SelectedItem.Text;
                e1.event_date = date.SelectedDate;
                et.event_db.Add(e1);
                et.SaveChanges();
                Response.Redirect("ahome.aspx");
            }
        }

        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}