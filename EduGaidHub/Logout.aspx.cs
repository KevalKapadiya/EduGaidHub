using System;
using System.Web;

namespace EduGaidHub
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session data
            Session.Clear();
            Session.Abandon();

            // Remove authentication cookies
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                Response.Cookies[".ASPXAUTH"].Expires = DateTime.Now.AddDays(-1);
            }

            // Redirect user to Login page
            Response.Redirect("Login.aspx");
        }
    }
}
