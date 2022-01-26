using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Security;
namespace Project
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("events");
            cookie["uname"] = Login1.UserName;
            Response.Cookies.Add(cookie);

            if (Login1.UserName == "admin123")
                Response.Redirect("~/admin/ahome.aspx");

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }
    }
}