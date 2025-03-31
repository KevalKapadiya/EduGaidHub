<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EduGaidHub.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Background Styling */
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
        }

        /* Header Styling */
        .header {
            background: #667eea;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            border-bottom: 4px solid #5a67d8;
        }

        /* Footer Styling */
        .footer {
            background: #2c3e52;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
            font-size: 16px;
        }

        /* Main Container */
        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 26px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Course Card Styling */
        .course-card {
            display: flex;
            flex-direction: column;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            border-left: 5px solid #667eea;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            margin-bottom: 20px;
        }

        .course-card:hover {
            transform: scale(1.02);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

        .course-card h3 {
            color: #5a67d8;
            font-size: 22px;
            margin-bottom: 10px;
        }

        .course-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            font-size: 16px;
            color: #444;
        }

        .course-details p {
            background: #f8f9fa;
            padding: 10px;
            border-radius: 6px;
            border-left: 4px solid #764ba2;
        }

        /* Visit College Button */
        .visit-btn {
            display: inline-block;
            text-decoration: none;
            background: #667eea;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
            transition: 0.3s;
            width: max-content;
        }

        .visit-btn:hover {
            background: #5a67d8;
        }

        /* Responsive Grid */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            .course-details {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#txtSearch").on("keyup", function () {
                var query = $(this).val();
                $.ajax({
                    url: "Home.aspx/SearchCourses",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ searchQuery: query }),
                    dataType: "json",
                    success: function (response) {
                        var courses = JSON.parse(response.d);
                        var html = "";
                        for (var i = 0; i < courses.length; i++) {
                            html += '<div class="course-card">';
                            html += '<h3>' + courses[i].Title + '</h3>';
                            html += '<div class="course-details">';
                            html += '<p><strong>🏛 College:</strong> ' + courses[i].CollegeName + '</p>';
                            html += '<p><strong>📄 Description:</strong> ' + courses[i].Description + '</p>';
                            html += '<p><strong>🎓 Criteria:</strong> ' + courses[i].Criteria + '</p>';
                            html += '<p><strong>💰 Fees:</strong> ' + courses[i].Fees + '</p>';
                            html += '<p><strong>👨‍🏫 Instructor:</strong> ' + courses[i].Instructor + '</p>';
                            html += '<p><strong>⏳ Duration:</strong> ' + courses[i].Duration + '</p>';
                            html += '</div>';
                            html += '<a href="' + courses[i].CollegeLink + '" class="visit-btn" target="_blank">🌐 Visit College</a>';
                            html += '</div>';
                        }
                        $("#courseContainer").html(html);
                    },
                    error: function () {
                        alert("Error fetching courses.");
                    }
                });
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Header Section -->
    <div class="header">
        🎓 Welcome to EduGuide Hub - Explore Your Future!
    </div>

    <!-- Main Container -->
    <div class="container">
        <h2>📚 Available Courses</h2>

        <div id="courseContainer">
            <asp:Repeater ID="rptCourses" runat="server">
                <ItemTemplate>
                    <div class="course-card">
                        <h3><%# Eval("Title") %></h3>
                        <div class="course-details">
                            <p><strong>🏛 College:</strong> <%# Eval("CollegeName") %></p>
                            <p><strong>📄 Description:</strong> <%# Eval("Description") %></p>
                            <p><strong>🎓 Criteria:</strong> <%# Eval("Criteria") %></p>
                            <p><strong>💰 Fees:</strong> <%# Eval("Fees") %></p>
                            <p><strong>👨‍🏫 Instructor:</strong> <%# Eval("Instructor") %></p>
                            <p><strong>⏳ Duration:</strong> <%# Eval("Duration") %> </p>
                        </div>
                        <a href="<%# Eval("CollegeLink") %>" class="visit-btn" target="_blank">🌐 Visit College</a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>


</asp:Content>
