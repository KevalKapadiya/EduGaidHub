# EduGuide Hub 🚀✨

Welcome to **EduGuide Hub** – a fully functional web application built using **ASP.NET Web Forms (ASPX, CS)**. This platform provides users with detailed information about colleges, admissions, and specialized courses like MSc in Data Science and Cybersecurity. The system is designed to offer a seamless experience for students looking for higher education opportunities.

## Key Features ✨

### 🏫 College & Course Information
- Browse detailed information about colleges and universities.
- View specific course details, including eligibility, syllabus, and fees.
- Compare multiple courses and institutions.

### 👨‍🎓 User Registration & Login
- Secure user authentication using **ASP.NET Identity**.
- Users can register with their email and password.
- Secure login with email verification.
- Password reset via email OTP.

### 🔍 Search & Filter Colleges/Courses
- Search for colleges or courses by name, location, or category.
- Filter results based on criteria like ranking, fees, and specialization.

### 🗣 Student Reviews & Ratings
- Users can leave reviews and rate colleges based on their experiences.
- View ratings and feedback from other students.

### 📅 Admission Notifications & Updates
- Get real-time updates on admissions, deadlines, and entrance exams.
- Subscribe to notifications for preferred colleges.

### 🔐 Admin Dashboard
- Manage users and their accounts.
- Add, edit, and delete college and course details.
- Moderate student reviews and feedback.
- View platform analytics, including user engagement and course popularity.

## Development Challenges 🛠️
Building a comprehensive educational platform required overcoming key challenges:

✔ Efficiently managing vast amounts of college/course data.
✔ Implementing secure authentication and OTP-based password recovery.
✔ Optimizing database performance for quick search and filtering.

## Real-World Impact 🌍
By providing an intuitive and informative platform, **EduGuide Hub**:

✅ Helps students make informed decisions about their higher education.
✅ Saves time by consolidating all essential details in one place.
✅ Encourages user engagement through reviews and ratings.
✅ Supports a growing community by enabling easy access to educational resources.

## Technologies Used 🖥️
- **ASP.NET Web Forms (ASPX, CS)** (Backend & Frontend)
- **SQL Server** (Database)
- **ASP.NET Identity** (User Authentication & Management)
- **AJAX & jQuery** (Dynamic UI Enhancements)

## Getting Started 🚀
Follow these steps to set up the project on your local machine:

1️⃣ **Clone the Repository:**
```sh
 git clone https://github.com/keval-kapadiya/EduGuide-Hub.git
 cd EduGuide-Hub
```

2️⃣ **Open the Project in Visual Studio**
- Launch **Visual Studio** and open the `EduGuide-Hub.sln` file.

3️⃣ **Configure Database**
- Update the `web.config` file with your **SQL Server** connection string.
- Run the following command in **SQL Server Management Studio (SSMS)** to apply migrations:
```sql
 EXEC sp_executesql N'CREATE DATABASE EduGuideHubDB'
```
- Use the **Entity Framework Migrations** to create tables.

4️⃣ **Run the Application**
- Press `Ctrl + F5` to run the project in your browser.

5️⃣ **Access the Web Application**
- Open `http://localhost:5000/` (or the configured port) and explore EduGuide Hub! 🚀

## 🔗 Connect with Me
If you're passionate about **education, technology, and web development**, let’s connect!

💼 **LinkedIn**: [https://www.linkedin.com/in/keval-kapadiya85/]
📧 **Email**: [kevalkapadiya991@gmail.com]

## 🙏 Thank You
Thank you for exploring this project! If you have any questions or suggestions, feel free to reach out. Happy coding! 🚀✨

