using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduGaidHub
{
    public partial class CourseDetails : Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["EduGaidHubDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string courseName = Request.QueryString["course"];
                if (!string.IsNullOrEmpty(courseName))
                {
                    LoadCourseDetails(courseName);
                }
                else
                {
                    // Show a message if no course is selected
                    rptCourses.DataSource = new DataTable(); // Empty data
                    rptCourses.DataBind();
                }
            }
        }

        private void LoadCourseDetails(string courseName)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT CourseID, Title, CollegeName, Description, Criteria, Fees, 
                                        CollegeLink, Instructor, Duration 
                                 FROM Courses 
                                 WHERE Title = @Title";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", courseName);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptCourses.DataSource = dt;
                    rptCourses.DataBind();
                }
                else
                {
                    rptCourses.DataSource = new DataTable(); // Empty data
                    rptCourses.DataBind();
                }
            }
        }
    }
}
