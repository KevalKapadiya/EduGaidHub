<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="YourNamespace.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            padding-top: 60px;
            background: #f4f4f4;
        }

        .navbar {
            background: #007bff;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            position: fixed; /* ✅ Keeps navbar fixed */
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000; /* ✅ Ensures navbar stays above other content */
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-right: 15px;
            font-size: 18px;
        }

        .logout-btn {
            background: red;
            color: white;
            border: none;
            padding: 10px 30px;
            cursor: pointer;
            border-radius: 4px;
        }

            .logout-btn:hover {
                background: darkred;
            }

        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-top: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 10px;
        }

            .form-group label {
                font-weight: bold;
                display: block;
            }

            .form-group input, .form-group textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

        .btn {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
            margin-right: 10px;
        }

            .btn:hover {
                background: #218838;
            }

        .delete-btn {
            background: red;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

            .delete-btn:hover {
                background: darkred;
            }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background: #007bff;
            color: white;
        }

        .form-buttons {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .footer {
            position: relative;
            bottom: 0;
            width: 100%;
            text-align: center;
            padding: 10px;
            background: #007bff;
            color: white;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="navbar">
            <div>
                <a href="AdminDashboard.aspx">Dashboard</a>
                <a href="RegistrationAdmin.aspx">Register Admin</a>
               

            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="btnLogout_Click" />
        </div>


        <div class="container">
            <h2>Manage Courses</h2>

            <!-- Hidden Field for Course ID -->
            <asp:HiddenField ID="txtCourseID" runat="server" />

            <div class="form-group">
                <label>Course Title:</label>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>College Name:</label>
                <asp:TextBox ID="txtCollegeName" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Criteria:</label>
                <asp:TextBox ID="txtCriteria" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Fees:</label>
                <asp:TextBox ID="txtFees" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Instructor:</label>
                <asp:TextBox ID="txtInstructor" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Duration:</label>
                <asp:TextBox ID="txtDuration" runat="server" placeholder="e.g., 2 Weeks, 6 Months, 3 Years"></asp:TextBox>

            </div>

            <div class="form-group">
                <label>College Link:</label>
                <asp:TextBox ID="txtCollegeLink" runat="server"></asp:TextBox>
            </div>

            <div class="form-buttons">
                <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="btn" OnClick="btnAddCourse_Click" />
                <asp:Button ID="btnUpdateCourse" runat="server" Text="Update Course" CssClass="btn" OnClick="btnUpdateCourse_Click" />
            </div>

            <h3>Courses List</h3>
            <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" GridLines="None" CellPadding="8" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="CollegeName" HeaderText="College Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Criteria" HeaderText="Criteria" />
                    <asp:BoundField DataField="Fees" HeaderText="Fees" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" />

                    <asp:BoundField DataField="CollegeLink" HeaderText="College Link" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn" OnClick="btnEdit_Click" CommandArgument='<%# Eval("CourseID") %>' />
                            <asp:Button ID="btnDelete" runat="server" CssClass="delete-btn" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%# Eval("CourseID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Your Website | All Rights Reserved
        </div>
    </form>
</body>
</html>
