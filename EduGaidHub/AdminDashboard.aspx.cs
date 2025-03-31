using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connStr = "Server=KEVAL\\SQLEXPRESS;Database=EduGaidHub;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Courses";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCourses.DataSource = dt;
                gvCourses.DataBind();
            }
        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Courses (Title, CollegeName, Description, Criteria, Fees, Instructor, Duration, CollegeLink) " +
                               "VALUES (@Title, @CollegeName, @Description, @Criteria, @Fees, @Instructor, @Duration, @CollegeLink)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@CollegeName", txtCollegeName.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Criteria", txtCriteria.Text);
                cmd.Parameters.AddWithValue("@Fees", txtFees.Text);
                cmd.Parameters.AddWithValue("@Instructor", txtInstructor.Text);
                cmd.Parameters.AddWithValue("@Duration", txtDuration.Text);  // No conversion needed
                cmd.Parameters.AddWithValue("@CollegeLink", txtCollegeLink.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            ClearFields();
            LoadCourses();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int courseId = Convert.ToInt32(((Button)sender).CommandArgument);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Courses WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtCourseID.Value = reader["CourseID"].ToString();
                    txtTitle.Text = reader["Title"].ToString();
                    txtCollegeName.Text = reader["CollegeName"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtCriteria.Text = reader["Criteria"].ToString();
                    txtFees.Text = reader["Fees"].ToString();
                    txtInstructor.Text = reader["Instructor"].ToString();
                    txtDuration.Text = reader["Duration"].ToString();  // Display as it is
                    txtCollegeLink.Text = reader["CollegeLink"].ToString();
                }
                conn.Close();
            }
        }


        protected void btnUpdateCourse_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Courses SET Title=@Title, CollegeName=@CollegeName, Description=@Description, Criteria=@Criteria, " +
                               "Fees=@Fees, Instructor=@Instructor, Duration=@Duration, CollegeLink=@CollegeLink WHERE CourseID=@CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", Convert.ToInt32(txtCourseID.Value));
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@CollegeName", txtCollegeName.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Criteria", txtCriteria.Text);
                cmd.Parameters.AddWithValue("@Fees", txtFees.Text);
                cmd.Parameters.AddWithValue("@Instructor", txtInstructor.Text);
                cmd.Parameters.AddWithValue("@Duration", txtDuration.Text);  // No conversion needed
                cmd.Parameters.AddWithValue("@CollegeLink", txtCollegeLink.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            ClearFields();
            LoadCourses();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int courseId = Convert.ToInt32(((Button)sender).CommandArgument);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Courses WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadCourses();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        private void ClearFields()
        {
            txtCourseID.Value = "";
            txtTitle.Text = "";
            txtCollegeName.Text = "";
            txtDescription.Text = "";
            txtCriteria.Text = "";
            txtFees.Text = "";
            txtInstructor.Text = "";
            txtDuration.Text = "";
            txtCollegeLink.Text = "";
        }
    }
}
