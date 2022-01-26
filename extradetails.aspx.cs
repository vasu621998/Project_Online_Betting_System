using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class extradetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mydatabaseEntities et = new mydatabaseEntities();
            String username = Request.QueryString["uname"];
            user_db user = et.user_db.Where(u => u.user_name == username).FirstOrDefault<user_db>();
            user.user_bday = DateTime.Parse(TextBox2.Text);
            user.user_country = TextBox1.Text;
            user.user_fav_team = DropDownList1.SelectedItem.Text;

            et.SaveChanges();

            Response.Redirect("Login.aspx");
        }
    }
}