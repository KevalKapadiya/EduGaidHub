using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace EduGaidHub
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Users WHERE Email=@Email AND Password=@Password";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Email", TxtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", TxtPassword.Text);

                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        Session["UserEmail"] = TxtEmail.Text;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        LblError.Text = "Invalid Email or Password!";
                    }
                }
                catch (Exception ex)
                {
                    LblError.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}