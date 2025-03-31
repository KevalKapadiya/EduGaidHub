using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace EduGaidHub
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = ""; // Clear error message on page load
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Please enter both username and password.";
                return;
            }

            // Fetch connection string from Web.config
            string connStr = WebConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM Admins WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        Session["AdminUsername"] = username;
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password!";
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "Database connection error: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}
