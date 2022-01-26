using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Security;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;


namespace Project
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ManageEvents me = new ManageEvents();
            me.Updateevents();

            if (Request.QueryString["Mode"] == "Ongoing")
                MultiView1.ActiveViewIndex = 1;
            else if (Request.QueryString["Mode"] == "Resulted")
                MultiView1.ActiveViewIndex = 2;
            else
                MultiView1.ActiveViewIndex = 0;

                mydatabaseEntities et = new mydatabaseEntities();
                user_db u = new user_db();

                HttpCookie cookie = Request.Cookies["events"];
                String uname = cookie["uname"];
                u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();
                int uid = u.user_id;
            Label1.Text = uid.ToString();
                

        }
        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];
            
            cookie["eid"] = ((Label)e.Item.FindControl("event_idLabel")).Text;
            Response.Cookies.Add(cookie);
            string uname = cookie["uname"];
            int eid = Convert.ToInt32(cookie["eid"]);
            mydatabaseEntities et = new mydatabaseEntities();
            event_db e1 = new event_db();
            user_db u = new user_db();
            user_team_db ut = new user_team_db();

            u = et.user_db.Where(name => name.user_name == uname).FirstOrDefault<user_db>();

            ut = et.user_team_db.Where(user => user.user_id == u.user_id && user.event_id == eid).FirstOrDefault<user_team_db>();
            if(ut==null)
            {
                Response.Redirect("team.aspx");
            }
            else
            {
                Response.Redirect("view.aspx");
            }
            DataList1.DataBind();
            DataList2.DataBind();
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];

            cookie["eid"] = ((Label)e.Item.FindControl("event_idLabel")).Text;
            Response.Cookies.Add(cookie);
            string url = "view.aspx?Mode=locked";
            Response.Redirect(url);
        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HttpCookie cookie = Request.Cookies["events"];

            cookie["eid"] = ((Label)e.Item.FindControl("event_idLabel")).Text;
            Response.Cookies.Add(cookie);
            Response.Redirect("result.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/ahome.aspx");
        }
    }
}