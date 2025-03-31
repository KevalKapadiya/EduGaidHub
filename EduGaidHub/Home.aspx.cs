using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace EduGaidHub
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

private void LoadCourses()
{
    List<Course> courses = new List<Course>();

    using (SqlConnection con = new SqlConnection("Server=KEVAL\\SQLEXPRESS;Database=EduGaidHub;Integrated Security=True;"))
    {
        string query = @"
        SELECT 
            Title, 
            CollegeName, 
            Description, 
            Criteria, 
            Fees, 
            CollegeLink, 
            Instructor, 
            ISNULL(Duration, 'Not Specified') AS Duration 
        FROM Courses";

        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            courses.Add(new Course
            {
                Title = reader["Title"].ToString(),
                CollegeName = reader["CollegeName"].ToString(),
                Description = reader["Description"].ToString(),
                Criteria = reader["Criteria"].ToString(),
                Fees = reader["Fees"].ToString(),
                CollegeLink = reader["CollegeLink"].ToString(),
                Instructor = reader["Instructor"].ToString(),
                Duration = reader["Duration"].ToString()  // ✅ Fixed conversion issue
            });
        }
    }

    rptCourses.DataSource = courses;
    rptCourses.DataBind();
}


        [WebMethod]
        public static string SearchCourses(string searchQuery)
        {
            List<Course> courses = new List<Course>();
            using (SqlConnection con = new SqlConnection("Server=KEVAL\\SQLEXPRESS;Database=EduGaidHub;Integrated Security=True;"))
            {
                string query = @"
        SELECT 
            Title, 
            CollegeName, 
            Description, 
            Criteria, 
            Fees, 
            CollegeLink, 
            Instructor, 
            ISNULL(Duration, 'Not Specified') AS Duration 
        FROM Courses 
        WHERE Title LIKE @query 
           OR CollegeName LIKE @query
           OR Description LIKE @query
           OR Criteria LIKE @query
           OR Fees LIKE @query
           OR CollegeLink LIKE @query
           OR Instructor LIKE @query
           OR Duration LIKE @query";  // ✅ Searches across all fields

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@query", "%" + searchQuery + "%");
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    courses.Add(new Course
                    {
                        Title = reader["Title"].ToString(),
                        CollegeName = reader["CollegeName"].ToString(),
                        Description = reader["Description"].ToString(),
                        Criteria = reader["Criteria"].ToString(),
                        Fees = reader["Fees"].ToString(),
                        CollegeLink = reader["CollegeLink"].ToString(),
                        Instructor = reader["Instructor"].ToString(),
                        Duration = reader["Duration"].ToString()
                    });
                }
            }

            return new JavaScriptSerializer().Serialize(courses);
        }

    }

    public class Course
    {
        public string Title { get; set; }
        public string CollegeName { get; set; }
        public string Description { get; set; }
        public string Criteria { get; set; }
        public string Fees { get; set; }
        public string CollegeLink { get; set; }
        public string Instructor { get; set; }
        public string Duration { get; set; }
    }
}
