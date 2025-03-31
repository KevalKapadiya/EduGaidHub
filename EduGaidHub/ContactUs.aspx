<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="EduGaidHub.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 40%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
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
        }
        .btn:hover {
            background: #218838;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Contact Us</h2>

        <div class="form-group">
            <label>Name:</label>
            <asp:TextBox ID="txtName" runat="server" required="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" required="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Message:</label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" required="true"></asp:TextBox>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    </div>
</asp:Content>
