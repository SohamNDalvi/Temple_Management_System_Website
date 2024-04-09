<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1, width=device-width" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets1/global.css" />
        <link rel="stylesheet" href="./assets1/index.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;700&display=swap" />
        <style>
            .totalAmount{
                background-color: lightslategrey;
                display: inline-block;
                min-width: auto;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                color: white;
                font-family: "Poppins", sans-serif;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.4s ease;
                position: relative;
                top:17px;
                margin: 0 auto;
            }

            /* Styles for the buttons */
            .button2{
                background-color: #662549;
                color: white;
                font-family: "poppins";
                border: none;
                border-radius: 8px;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.4s ease;
            }
            .button1{

                background-color: #662549;
                color: white;
                font-family: "poppins";
                border: none;
                border-radius: 8px;
                padding: 10px 20px;
                font-size: 16px; /* Adjust as needed */
                cursor: pointer;
                transition: background-color 0.4s ease;
                position:relative;
                top:20px;
            }
            .button2:hover {
                background-color: #4b1834; /* Darken the color on hover */
            }

            .button1:hover {
                background-color: #4b1834; /* Darken the color on hover */
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                font-family: "poppins";
                padding: 10px;
                border: 1px solid #ccc;
            }

            th {
                font-weight: bold;
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {

                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f2f2f2;
            }

            /* Target the first row of th and td elements */
            tr:first-child th{
                font-size: 20px; /* Increase font size */
                background-color: lightskyblue; /* Change background color to black */
                color: darkslategray; /* Change text color to white */
            }
            .home-button:hover,
            .totaldonationsamount-button:hover,
            .totalexpenses-button:hover,
            .employee-details-button:hover{
                background-color: lightblue;
                cursor: pointer;
            }

            .fb-button-icon:hover ,.instagram-button-icon:hover,.twitter-button-icon:hover,.gmail-button-icon:hover{
                cursor: pointer;
            }
            .total-display:hover{
                box-shadow: 3px 4px 19.9px 0 rgba(0, 0, 0, 0.25);
            }

            .match {
                background-color: lightgreen;
            }
        </style>
    </head>
    <body>
        <div class="admin-donate">
            <div class="admin-donate-inner">
                <main class="mandir-logo-frame-parent">
                    <header class="mandir-logo-frame">
                        <img class="mandir-logo-icon" loading="eager" alt="" src="./assets1/mandir-logo@2x.png" />

                        <div class="total-donations-amount-button">
                            <div class="total-expenses-button">
                                <div class="employee-details-button-frame">
                                    <div class="home-button" onclick="window.location.href = 'Admin_Home_Page.jsp'">Home</div>
                                </div>
                                <div class="totaldonationsamount-button" onclick="window.location.href = 'Donation_Display.jsp'">Total Donations Amount</div>
                                <div class="contact-text1"></div>
                                <div class="totalexpenses-button-wrapper">
                                    <div class="totalexpenses-button" onclick="window.location.href = 'Expenses_Display.jsp'">Total Expenses</div>
                                </div>
                                <div class="totaldisplay-frame">

                                    <div class="employee-details-button" onclick="window.location.href = 'Employee_Display.jsp'">Employee Details</div>
                                </div>
                            </div>
                            <div class="log-acc-button" >
                                <div class="badge-parent" onclick="showAdminDetails()">
                                    <div class="badge" onclick="showAdminDetails()">
                                        <div class="content">
                                            <b class="label">Login </b>
                                        </div>
                                    </div>
                                    <img class="iconnavigationarrow-drop-dow" alt="" />
                                </div>
                                <img class="vector-icon" loading="eager" alt="" src="./assets1/vector.svg" onclick="showAdminDetails()"/>
                            </div>
                        </div>
                    </header>
                    <section class="footer-frame">
                        <img class="footer-frame-child" alt="" src="./assets1/rectangle-42@2x.png" />

                        <div class="total-display">
                            <div class="display-back"></div>
                            <div class="total-disp-frame">
                                <table id="employeeTable">
                                    <thead>
                                        <tr>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>City</th>
                                            <th>Donation Amount</th>
                                            <th>Payment Details</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Data will be fetched dynamically from the database -->
                                        <%@ page import="java.sql.*" %>
                                        <%@ page import="java.io.*" %>
                                        <%
                                        // Database connection parameters
                                        String jdbcUrl = "jdbc:mysql://localhost:3306/Ram_Mandir";
                                        String dbUsername = "root";
                                        String dbPassword = "root";

                                        Connection connection = null;
                                        PreparedStatement statement = null;
                                        ResultSet resultSet = null;

                                        try {
                                          // Load and register the JDBC driver
                                          Class.forName("com.mysql.jdbc.Driver");

                                          // Establish the database connection
                                          connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
                    
                                          // Prepare and execute the SQL query
                                          statement = connection.prepareStatement("SELECT * FROM total_donation");
                                          resultSet = statement.executeQuery();

                                          // Process the result set
                                           while (resultSet.next()) {
                          // Get donation details from the result set
                          String fullName = resultSet.getString("full_name");
                          String email = resultSet.getString("email_id");
                          String city = resultSet.getString("city");
                          int donationAmount = resultSet.getInt("donation_amount");
                          String paymentDetails = resultSet.getString("payment_details");

                          // Check if payment details are "Offline" (case insensitive)
                          if (paymentDetails != null && paymentDetails.trim().equalsIgnoreCase("Offline")) {
                                        %>
                                        <tr>
                                            <td><%= fullName %></td>
                                            <td><%= email %></td>
                                            <td><%= city %></td>
                                            <td><%= donationAmount %></td>
                                            <td><%= paymentDetails %></td>
                                            <td>
                                                <button class="button2" onclick="updateDonation('<%= fullName %>', '<%= email %>', '<%= city %>', '<%= donationAmount %>', ' <%= paymentDetails %>')">Update</button>
                                            </td>
                                        </tr>
                                        <%
                                            } else {
                                        %>
                                        <tr>
                                            <td><%= fullName %></td>
                                            <td><%= email %></td>
                                            <td><%= city %></td>
                                            <td><%= donationAmount %></td>
                                            <td><%= paymentDetails %></td>
                                            <td></td> <!-- No button included in this column -->
                                        </tr>
                                        <%
                                            }
                                        }
                                        }
                                        catch (Exception e) {
                                                            e.printStackTrace();
                                                          } finally {
                                                            // Close the resources in the finally block
                                                            try {
                                                              if (resultSet != null) {
                                                                resultSet.close();
                                                              }
                                                              if (statement != null) {
                                                                statement.close();
                                                              }
                                                              if (connection != null) {
                                                                connection.close();
                                                              }
                                                            } catch (SQLException ex) {
                                                              ex.printStackTrace();
                                                            }
                                                          }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div id="totalAmount" name="totalAmount" class="totalAmount"></div>
                            <div>  <button class="button1" onclick="insertDonation()">Insert</button>
                                <button class="button1" onclick="searchDonation()">Search</button>
                            </div>

                        </div>


                    </section>

                </main>

            </div>
            <footer class="footer">
                <div class="footer-back"></div>
                <div class="footer-frame1">
                    <div class="fb-vector">
                        <div class="fb-button-instance">
                            <img class="fb-button-icon" loading="eager" alt="" src="./assets1/fb-button.svg" />
                        </div>
                        <div class="social-media-buttons">
                            <img class="instagram-button-icon" loading="eager" alt="" src="./assets1/instagram-button.svg" />
                        </div>
                        <img class="twitter-button-icon" loading="eager" alt="" src="./assets1/twitter-button.svg" />
                        <img class="gmail-button-icon" loading="eager" alt="" src="./assets1/gmail-button.svg" />
                    </div>
                </div>
                <div class="copyright-frame">
                    <div class="copyright-2020-all">Copyright ©2020 All rights reserved</div>
                </div>
            </footer>
        </div>
        <script>
            function updateDonation(fullName, email, city, donationAmount, paymentDetails) {
                var updatedFullName = prompt("Enter updated full name", fullName);
                var updatedEmail = prompt("Enter updated email", email);
                var updatedCity = prompt("Enter updated city", city);
                var updatedPaymentDetails = paymentDetails;

                if (updatedFullName && updatedEmail && updatedCity && updatedPaymentDetails) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "UpdateDonationServlet", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            // Reload the page after successful update
                            location.reload();
                        }
                    };
                    var params = "fullName=" + encodeURIComponent(updatedFullName) +
                            "&email=" + encodeURIComponent(updatedEmail) +
                            "&city=" + encodeURIComponent(updatedCity) +
                            "&donationAmount=" + donationAmount + // Keep the original donation amount
                            "&paymentDetails=" + encodeURIComponent(updatedPaymentDetails) +
                            "&oldFullName=" + encodeURIComponent(fullName); // Pass old full name value
                    xhr.send(params);
                }
            }

            function insertDonation() {
                var fullName = prompt("Enter full name");
                var email = prompt("Enter email");
                var city = prompt("Enter city");
                var donationAmount = parseInt(prompt("Enter donation amount"));
                var paymentDetails = "offline"; // Set paymentDetails to "offline" by default

                if (!isNaN(donationAmount) && fullName && email && city && !isNaN(donationAmount)) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "InsertDonationServlet", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            // Reload the page after successful insertion
                            location.reload();
                        }
                    };
                    var params = "fullName=" + encodeURIComponent(fullName) +
                            "&email=" + encodeURIComponent(email) +
                            "&city=" + encodeURIComponent(city) +
                            "&donationAmount=" + donationAmount +
                            "&paymentDetails=" + encodeURIComponent(paymentDetails);
                    xhr.send(params);
                }
            }
            function fetchTotalAmount() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "FetchTotalAmountServlet", true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        document.getElementById("totalAmount").innerHTML = "Total Donation Amount: " + xhr.responseText;
                    }
                };
                xhr.send();
            }

      // Call fetchTotalAmount() initially to display the total amount
            fetchTotalAmount();


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

            function searchDonation() {
                var searchName = prompt("Enter the name to search");
                var table = document.getElementById("employeeTable");
                var found = false;

                // Remove highlight from all rows
                for (var j = 1; j < table.rows.length; j++) {
                    table.rows[j].classList.remove("match");
                }

                // Check each row for a match
                for (var i = 1; i < table.rows.length; i++) {
                    var fullName = table.rows[i].cells[0].innerText.trim();
                    if (fullName.toLowerCase() === searchName.toLowerCase()) {
                        // Match found, scroll to the row
                        found = true;
                        table.rows[i].scrollIntoView({behavior: "smooth", block: "center"});
                        // Highlight the matched row in green
                        table.rows[i].classList.add("match");
                    }
                }

                if (!found) {
                    alert("Sorry, the name was not found.");
                }
            }

        </script>
    </body>
</html>
