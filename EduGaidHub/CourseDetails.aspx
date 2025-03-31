<%@ Page Title="Course Details" Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="EduGaidHub.CourseDetails" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
        }

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

        .course-card h2 {
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
        .btn-visit {
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

        .btn-visit:hover {
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>📚 Course Details</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:Repeater ID="rptCourses" runat="server">
            <ItemTemplate>
                <div class="course-card">
                    <h2><%# Eval("Title") %></h2>
                    <div class="course-details">
                        
                        <p><strong>🏛 College Name:</strong> <%# Eval("CollegeName") %></p>
                        <p><strong>📄 Description:</strong> <%# Eval("Description") %></p>
                        <p><strong>🎓 Criteria:</strong> <%# Eval("Criteria") %></p>
                        <p><strong>💰 Fees:</strong> <%# Eval("Fees") %></p>
                        <p><strong>👨‍🏫 Instructor:</strong> <%# Eval("Instructor") %></p>
                        <p><strong>⏳ Duration:</strong> <%# Eval("Duration") %></p>
                    </div>
                    <a href="<%# Eval("CollegeLink") %>" class="btn-visit" target="_blank">🌐 Visit College</a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
