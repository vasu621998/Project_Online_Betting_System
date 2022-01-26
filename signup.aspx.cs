using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Web.Security;
namespace Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        
        protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
        {
            mydatabaseEntities et = new mydatabaseEntities();
            user_db user = new user_db();

            /*if (CreateUserWizard1.UserName == "admin123")
                Roles.AddUserToRole(CreateUserWizard1.UserName, "admin");
            else
                Roles.AddUserToRole(CreateUserWizard1.UserName, "users");
                */

            

            user.user_name = CreateUserWizard1.UserName;
            user.user_pwd = CreateUserWizard1.Password;
            user.user_email = CreateUserWizard1.Email;

            et.user_db.Add(user);
            et.SaveChanges();
            
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            String url = "extradetails.aspx?";
            url += "uname=" + CreateUserWizard1.UserName;
            Response.Redirect(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}