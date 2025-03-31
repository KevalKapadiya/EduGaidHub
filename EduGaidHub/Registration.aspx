<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="YourNamespace.Registration" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <style>
        /* General Page Styling */
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        /* Registration Container */
        .registration-container {
            width: 350px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
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

        /* Register Button */
        .btn-register {
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

        .btn-register:hover {
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

        /* Login Link */
        .login-link {
            display: block;
            margin-top: 15px;
            font-size: 14px;
            color: #333;
            text-decoration: none;
        }

        .login-link:hover {
            color: #5a67d8;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 400px) {
            .registration-container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>Register Here</h2>
        <form id="form1" runat="server">
            <label>Username:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

            <label>Password:</label>
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>

            <label>Mobile:</label>
            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>

            <!-- Login Link -->
            <a href="Login.aspx" class="login-link">Already have an account? Login here</a>
        </form>
    </div>
</body>
</html>
