<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EduGaidHub.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
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

        .login-container {
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

        .btn-login, .btn-forgot {
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

        .btn-login:hover, .btn-forgot:hover {
            background: #5a67d8;
        }

        .message, .error {
            font-weight: bold;
            margin-top: 10px;
        }

        .message { color: green; }
        .error { color: red; }

        .register-link {
            display: block;
            margin-top: 15px;
            font-size: 14px;
            color: #333;
            text-decoration: none;
        }

        .register-link:hover {
            color: #5a67d8;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="form1" runat="server">
            <label>Email:</label>
            <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>

            <label>Password:</label>
            <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
              
            <asp:Label ID="LblMessage" runat="server" CssClass="message"></asp:Label>
            <asp:Label ID="LblError" runat="server" CssClass="error"></asp:Label>

            <a href="Registration.aspx" class="register-link">Don't have an account? Register here</a>
        </form>
    </div>
</body>
</html>
