using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace YourNamespace
{
    public partial class RegistrationAdmin : Page
    {
        protected void btnRegisterAdmin_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Admins (FullName, Email, Username, Password) VALUES (@FullName, @Email, @Username, @Password)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@FullName", txtAdminFullName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtAdminEmail.Text);
                    cmd.Parameters.AddWithValue("@Username", txtAdminUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtAdminPassword.Text); // Consider hashing passwords

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblMessage.Text = "Admin Registration Successful!";
                        lblError.Text = "";
                    }
                    else
                    {
                        lblError.Text = "Registration Failed!";
                        lblMessage.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
