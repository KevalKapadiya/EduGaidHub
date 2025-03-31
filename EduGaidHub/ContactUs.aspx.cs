using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

namespace EduGaidHub
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            // Retrieve connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;

            // Insert into database
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO ContactMessages (Name, Email, Message, DateSubmitted) VALUES (@Name, @Email, @Message, GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Message", message);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error saving to database: " + ex.Message;
                return; // Stop execution if database fails
            }

            // Send Email Notification
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("your-email@example.com"); // Replace with your email
                mail.To.Add("admin@example.com"); // Replace with admin email
                mail.Subject = "New Contact Us Form Submission";
                mail.Body = $"Name: {name}\nEmail: {email}\nMessage:\n{message}";

                SmtpClient smtp = new SmtpClient("smtp.example.com"); // Replace with SMTP settings
                smtp.Credentials = new System.Net.NetworkCredential("your-email@example.com", "your-password");
                smtp.Port = 587; // Adjust SMTP port if necessary
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Message saved, but email notification failed.";
                return; // Stop execution if email fails
            }

            // Success message
            lblMessage.Text = "Your message has been sent successfully!";
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}
