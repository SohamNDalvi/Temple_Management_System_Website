<%-- 
    Document   : ForgotPasswordPage1
    Created on : Feb 16, 2024, 6:37:29 PM
    Author     : ROHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="./ForgotPasswordPage1_Assets/global.css" />
    <link rel="stylesheet" href="./ForgotPasswordPage1_Assets/index.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700;800&display=swap" />
</head>
<body>
<%
    String error = request.getParameter("data");
%>
<div class="admin-forgot1">
    <div class="vector-parent">
        <img class="frame-child" alt="" src="ForgotPasswordPage1_Assets/rectangle-1.svg" />

        <img class="backbutton-icon" onclick="window.location.href='admin'" loading="eager" alt="" src="ForgotPasswordPage1_Assets/backbutton.svg" id="backButtonIcon" />

        <div class="frame-wrapper">
            <div class="forget-password-parent">
                <div class="forget-password">
                    <div class="forget-password-wrapper">
                        <% if (error == null) { %>
                            <p></p>
                        <% } else { %>
                            <script>alert('Password Mismatched or Email Not Found');</script>
                        <% } %>
                        <h3 class="forget-password1">Forget Password</h3>
                    </div>
                    <div class="provide-your-accounts">
                        Provide your account's email for which you want to reset your password And Enter Your Password Details Also!
                    </div>
                </div>
                <form id="forgotPasswordForm" method="post" action="ForgotPasswordServlet">
                    <div class="email-address-parent">
                        <div>
                            <input type="text" name="email" id="email" placeholder="Email Id" style="font-family: poppins; border: 15px; font-size: 20px; margin: auto; font-weight: lighter; display: block; color: #923012; width: 390px; height: 50px; position: relative; outline: none; top: -30px; border-radius: 5px; background-color: #e1d1cb; border-color: #e1d1cb;" />
                        </div>
                    </div>
                    <div class="email-address-parent">
                        <div>
                            <input type="password" name="password" id="password" placeholder="Password" style="font-family: poppins; border: 15px; font-size: 20px; margin: auto; font-weight: lighter; display: block; color: #923012; width: 390px; height: 50px; position: relative; outline: none; top: -20px; border-radius: 5px; background-color: #e1d1cb; border-color: #e1d1cb;" />
                        </div>
                    </div>
                    <div class="email-address-parent">
                        <div>
                            <input type="password" name="Cpassword" id="Cpassword" placeholder="Confirm Password" style="font-family: poppins; border: 15px; font-size: 20px; margin: auto; font-weight: lighter; display: block; color: #923012; width: 390px; height: 50px; position: relative; outline: none; top: -10px; border-radius: 5px; background-color: #e1d1cb; border-color: #e1d1cb;" />
                        </div>
                    </div>
                    <div id="errorMessage" style="color: red; margin-top: 10px;"></div>
                    <div class="extended-fab" style="display: block; margin-top: 20px; width: 390px; height: 50px; border-radius: 5px; background-color: #923012; cursor: pointer; position: relative; overflow: hidden; top:10px">
    <img class="icon" src="icon.png" alt="" style="position: absolute; left: 15px; top: 50%; transform: translateY(-50%); width: 20px; height: 20px;">
    <input type="submit" value="Update Password" style="font-family: poppins; font-size: 20px; font-weight: bold; color: #fff; width: 350px; height: 50px; border: none; background-color: transparent; cursor: pointer;">
</div>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
