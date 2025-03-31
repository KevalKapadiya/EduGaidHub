using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace YourNamespace
{
    public partial class Registration : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Users (Username, Email, Password, Mobile) VALUES (@Username, @Email, @Password, @Mobile)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // Consider hashing passwords
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblMessage.Text = "Registration Successful!";
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
