<%-- 
    Document   : Admin_Home_Page
    Created on : Feb 19, 2024, 12:13:02 AM
    Author     : ROHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="./assets_home/global.css" />
    <link rel="stylesheet" href="./assets_home/index.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;700&display=swap"
    />
    
        <style>
  .home-button {
      position:relative;
      top:2px;
    border-bottom: 2px solid var(--color-dimgray); 
  }
  .badge{
          margin-left: 4.3px;
  }
  
  .button3:hover,.button2:hover,.total-donations-parent:hover{
    box-shadow: 3px 4px 19.9px 0 rgba(0, 0, 0, 0.25);
    width:566px;
    height:489.4px;
    cursor: pointer;
}

    
.home-button:hover,
.totaldonationsamount-button:hover,
.totalexpenses-button:hover,
.employeedetails-button:hover{
    background-color: lightblue;
    cursor: pointer;
}
.button3:hover,.button2:hover,.total-donations-parent:hover{
    box-shadow: 3px 4px 19.9px 0 rgba(0, 0, 0, 0.25);
    width:339.6px;
    height:376px;
    cursor: pointer;
}
.fb-icon:hover ,.vector-icon1:hover,.vector-icon2:hover,.total-expenses-button:hover{
    cursor: pointer;}
</style>
    
  </head>
  <body>
    <div class="admin-donate">
      <header class="frame-parent">
        <div class="mandir-logo-parent">
          <img
            class="mandir-logo-icon"
            loading="eager"
            alt=""
            src="./assets_home/mandir-logo@2x.png"
          />

          <div class="total-donations-amount-button">
            <div class="employee-details-button-frame">
              <div class="home-button-frame">
                <div class="home-button"  onclick="window.location.href='index.html'">Home</div>
                
              </div>
              <div class="totaldonationsamount-button" onclick="window.location.href='Donation_Display.jsp'">
                Total Donations Amount
              </div>
              <div class="log-acc-button">
                <div class="totalexpenses-button" onclick="window.location.href='Expenses_Display.jsp'">Total Expenses</div>
              </div>
              <div class="employeedetails-button" onclick="window.location.href='Employee_Display.jsp'">Employee Details</div>
            </div>
            <div class="log-acc-button1"  onclick="showAdminDetails()">
              <div class="badge-parent" onclick="showAdminDetails()">
                <div class="badge" >
                  <div class="content">
                    <b class="label">Login </b>
                  </div>
                </div>
                <img class="iconnavigationarrow-drop-dow" alt="" />
              </div>
              <img class="vector-icon" alt="" src="./assets_home/vector.svg" />
            </div>
          </div>
        </div>
        <div class="expensegrp">
          <img
            class="expensegrp-child"
            loading="eager"
            alt=""
            src="./assets_home/line-3.svg"
          />
        </div>
      </header>
      <div class="log-acc-button2">
        <div class="badge-group">
          <div class="badge1">
            <div class="content1">
              <b class="label1">Login </b>
            </div>
          </div>
          <img class="iconnavigationarrow-drop-dow1" alt="" />
        </div>
        <img class="footer-frame-icon" alt="" src="./assets_home/vector-1.svg" />
      </div>
      <footer class="footer-frame">
        <img class="background-icon" alt="" src="./assets_home/background@2x.png" />

        <section class="total-display">
          <div class="total-display-child"></div>
          <div class="button1" onclick="window.location.href='Donation_Display.jsp'">
            <div class="total-donations-parent">
              <div class="total-donations"></div>
              <b class="total-donation-amount">Total Donation Amount</b>
              <img
                class="home-button-icon"
                loading="eager"
                alt=""
                src="./assets_home/rectangle-44@2x.png"
              />
            </div>
          </div>
          <div class="button2" onclick="window.location.href='Expenses_Display.jsp'">
            <div class="expense-grp">
              <div class="expense-back-image"></div>
              <b class="total-expense">Total Expenses</b>
              <img
                class="expense-image-icon"
                loading="eager"
                alt=""
                src="./assets_home/expense-image@2x.png"
              />
            </div>
          </div>
          <div class="button3" onclick="window.location.href='Employee_Display.jsp'">
            <div class="employee-details-grp">
              <div class="emp-det-image"></div>
              <b class="emp-det-text">Manage Employees </b>
              <img
                class="emp-det-image-icon"
                loading="eager"
                alt=""
                src="./assets_home/emp-det-image@2x.png"
              />
            </div>
          </div>
        </section>
      </footer>
      <div class="footer">
        <div class="footer-child"></div>
        <div class="logo-and-total-donations">
          <div class="facebook-vector">
            <div class="fb-link">
              <img
                class="fb-icon"
                loading="eager"
                alt=""
                src="./assets_home/fb.svg"
              />
            </div>
            <div class="empdettext">
              <img
                class="total-expenses-button"
                alt=""
                src="./assets_home/vector-2.svg"
              />
            </div>
            <img class="vector-icon1" alt="" src="./assets_home/vector-3.svg" />

            <img class="vector-icon2" alt="" src="./assets_home/vector-4.svg" />
          </div>
        </div>
        <div class="copyright-2020-all-rights-res-wrapper">
          <div class="copyright-2020-all">
            Copyright ©2020 All rights reserved
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
}
 <script>
      function showAdminDetails() {
        // Show alert ask for logout confirmation
        var confirmLogout = confirm("Do you want to log out?");
        
        if (confirmLogout) {
          // Redirect to the Admin_login_page.jsp if logout confirmed
          window.location.href = "Admin.jsp";
        } else {
          // Stay on the same page if logout not confirmed
          // No action needed as the user chooses not to logout
        }
      }
    </script>
