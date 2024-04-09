<%-- 
    Document   : Admin_login_page
    Created on : Feb 15, 2024, 10:25:12 PM
    Author     : ROHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="./Admin_login_page_Assets/global.css" />
    <link rel="stylesheet" href="./Admin_login_page_Assets/index.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700;800&display=swap"
    />
  </head>
  <body>
    <div class="admin-login">
      <form class="input-field-parent" action="AdminLoginServlet" method="post" onsubmit="return validateForm()">

        <div class="cancelbutton-wrapper" >
          <img class="cancelbutton-icon" loading="eager" alt="" src="Admin_login_page_Assets/cancelbutton.svg" onclick="window.location.href='index.html'">

        </div>
        <div class="admin-login-text-wrapper">
          <h3 class="admin-login-text">Admin Login</h3>
        </div>
        <div class="email-id-field-wrapper">
          <div class="email-id-field">
              <div ><input type="text" name="email" id="email" placeholder="Email Id" ; style="font-family: poppins; border: 15px; font-size: 20px; margin: auto; font-weight: lighter; display: block;
    color: #923012;
    display: block;
    width: 390px;
    height: 50px;
    position: relative;
    outline: none;
    top: 10px;
    border-radius: 5px;
    background-color: #e1d1cb;
    border-color: #e1d1cb;" />
                  
                  
                </div>
              
              <div id=1 class="login-frame"></div>
            
            <div class="passwordfield">
              
                  <div ><input type="password" name="password" id="password" placeholder="Password " ; style="font-family: poppins; border: 15px; font-size: 20px; margin: auto; font-weight: lighter; display: block;
    color: #923012;
    display: block;
    width: 390px;
    height: 50px;
    position: relative;
    outline: none;
    border-radius: 5px;
    background-color: #e1d1cb;
    border-color: #e1d1cb;" />
                  
                  
                </div>
                <div id="1" class="login-frame1"></div>
                <div class="login-button-instance" >
                    <button class="login-button" type="submit"> Login </button>
        </div>
                  
                </div>
              </div>
            </div>
            <div class="coreinputcheckbox-wrapper">
              <div class="coreinputcheckbox">
                <div class="forgot-password-link"> </div>
                <div class="forgot-password-wrapper">
                  <div class="forgot-password" onclick="window.location.href='./ForgotPasswordPage1.jsp'">Forgot Password?</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </form>
    </div>

    <script>
      function validateForm() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        
        if (email.trim() == "" || password.trim() == "") {
          alert("Please enter both email and password.");
          return false;
        }
       
     
        return true; // Form will be submitted if all validations pass
    }
    </script>
  </body>
</html>
