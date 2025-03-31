<%@ Page Title="Admin Login" Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EduGaidHub.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        /* Navbar Styling */
        .navbar {
            background: linear-gradient(to right, #667eea, #764ba2);
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            font-size: 18px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }


            .navbar a, .dropdown-btn {
                color: white;
                text-decoration: none;
                padding: 10px 15px;
                font-weight: bold;
                transition: background 0.3s ease-in-out;
                cursor: pointer;
            }

                .navbar a:hover, .dropdown-btn:hover {
                    background: #5a67d8;
                    border-radius: 5px;
                }

        /* Footer Styling */
        .footer {
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 16px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        /* Login Box */
        .admin-login-container {
            width: 350px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            margin-top: 80px; /* Space below navbar */
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        /* Input Fields */
        label {
            font-weight: bold;
            display: block;
            text-align: left;
            margin-top: 10px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Login Button */
        .btn-login {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background: #667eea;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

            .btn-login:hover {
                background: #5a67d8;
            }

        /* Message Styling */
        .message {
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div>
            <a href="Home.aspx">Home</a>
            <a href="CourseDetails.aspx">Courses</a>
            <a href="ContactUs.aspx">Contact Us</a>
        </div>
        <div>
            <a href="AdminLogin.aspx">Admin</a>
            <a href="Logout.aspx">Logout</a>
        </div>
    </div>

    <!-- Admin Login Form -->
    <form id="form1" runat="server">
        <div class="admin-login-container">
            <h2>Admin Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" CssClass="btn-login" Text="Login" OnClick="btnLogin_Click" />
            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
        </div>
    </form>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 EduGaidHub. All Rights Reserved.</p>
    </div>
</body>
</html>
