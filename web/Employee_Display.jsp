<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="initial-scale=1, width=device-width" />

  <link rel="stylesheet" href="assets1/global.css" />
  <link rel="stylesheet" href="assets1/index.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600&display=swap" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;700&display=swap" />
  <style>
      /* Styles for the buttons */
    .button1,.button2{
        
      background-color: #662549;
      color: white;
      font-family: "poppins";
      border: none;
      border-radius: 8px;
      padding: 10px 20px;
      font-size: 16px; /* Adjust as needed */
      cursor: pointer;
      transition: background-color 0.4s ease;
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

.total-display:hover{box-shadow: 3px 4px 19.9px 0 rgba(0, 0, 0, 0.25);}
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
          <img class="mandir-logo-icon" loading="eager" alt="" src="assets1/mandir-logo@2x.png" />

          <div class="total-donations-amount-button">
            <div class="total-expenses-button">
              <div class="employee-details-button-frame">
                <div class="home-button" onclick="window.location.href='Admin_Home_Page.jsp'">Home</div>
              </div>
              <div class="totaldonationsamount-button" onclick="window.location.href='Donation_Display.jsp'">Total Donations Amount</div>
              <div class="totalexpenses-button-wrapper">
                <div class="totalexpenses-button" onclick="window.location.href='Expenses_Display.jsp'">Total Expenses</div>
              </div>
              <div class="totaldisplay-frame">
                <div class="employee-details-button" onclick="window.location.href='Employee_Display.jsp'">Employee Details</div>
                <div class="contact-text"></div>
              </div>
            </div>
            <div class="log-acc-button">
              <div class="badge-parent" onclick="showAdminDetails()">
                <div class="badge" onclick="showAdminDetails()">
                  <div class="content">
                    <b class="label">Login </b>
                  </div>
                </div>
                <img class="iconnavigationarrow-drop-dow" alt="" />
              </div>
              <img class="vector-icon" loading="eager" alt="" src="assets1/vector.svg" onclick="showAdminDetails()"/>
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
                    <th>Contact No.</th>
                    <th>ID</th>
                    <th>Position Role</th>
                    <th>Salary</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- Table rows will be populated dynamically from the database -->
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
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the database connection
                    connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                    // Prepare and execute the SQL query
                    statement = connection.prepareStatement("SELECT * FROM Employee_Details");
                    resultSet = statement.executeQuery();

                    // Process the result set
                    while (resultSet.next()) {
                      // Get employee details from the result set
                      String name = resultSet.getString("Full_Name");
                      int contact = resultSet.getInt("Contact_no");
                      int id = resultSet.getInt("ID");
                      String role = resultSet.getString("Role");
                      int salary = resultSet.getInt("Salary");
                      System.out.println("Name: " + name + ", Contact: " + contact + ", ID: " + id + ", Role: " + role + ", Salary: " + salary);

                  %>
                  <tr>
  <td><%= name %></td>
  <td><%= contact %></td>
  <td><%= id %></td>
  <td><%= role %></td>
  <td><%= salary %></td>
  <td>
    <button class="button1" onclick="updateEmployee(<%= id %>, '<%= name %>', <%= contact %>, '<%= role %>', <%= salary %>)">Update</button>
  </td>
</tr>
                      
                  <% 
                    }
                  } catch (Exception e) {
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
                <div>
                <button class="button2" onclick="insertEmployee()">Insert</button>
                <button class="button2" onclick="deleteEmployeePrompt()">Delete</button>
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
            <img class="fb-button-icon" loading="eager" alt="" src="assets1/fb-button.svg" />
          </div>
          <div class="social-media-buttons">
            <img class="instagram-button-icon" loading="eager" alt="" src="assets1/instagram-button.svg" />
          </div>
          <img class="twitter-button-icon" loading="eager" alt="" src="assets1/twitter-button.svg" />
          <img class="gmail-button-icon" loading="eager" alt="" src="assets1/gmail-button.svg" />
        </div>
      </div>
      <div class="copyright-frame">
        <div class="copyright-2020-all">Copyright ©2020 All rights reserved</div>
      </div>
    </footer>
  </div>

  <script>
      function deleteEmployeePrompt() {
    var id = prompt("Enter the ID of the employee to delete:");
    if (id !== null) { // Check if user canceled the prompt
        deleteEmployee(parseInt(id)); // Convert ID to integer and call deleteEmployee function
    }
}
      
      function deleteEmployee(id) {
    var confirmDelete = confirm("Are you sure you want to delete this employee?");
    if (confirmDelete) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "DeleteEmployeeServletFile", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                location.reload();
            }
        };
        var params = "id=" + id;
        xhr.send(params);
    }
}

      
    function updateEmployee(id, name, contact, role, salary) {
  var updatedName = prompt("Enter updated name", name);
  var updatedContact = parseInt(prompt("Enter updated contact number", contact));
  var updatedRole = prompt("Enter updated role", role);
  var updatedSalary = parseInt(prompt("Enter updated salary", salary));

  if (updatedName && !isNaN(updatedContact) && updatedRole && !isNaN(updatedSalary)) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UpdateEmployeeServletFile", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        location.reload();
      }
    };
    var params = "id=" + id + "&name=" + updatedName + "&contact=" + updatedContact + "&role=" + updatedRole + "&salary=" + updatedSalary;
    xhr.send(params);
  }
}

function insertEmployee() {
  var id = parseInt(prompt("Enter ID\n The Id Must Be Unique For Each Employee "));
  var name = prompt("Enter name");
  var contact = parseInt(prompt("Enter contact number"));
  var role = prompt("Enter role");
  var salary = parseInt(prompt("Enter salary"));

  if (!isNaN(id) && name && !isNaN(contact) && role && !isNaN(salary)) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "InsertEmployeeServletFile", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        location.reload();
      }
    };
    var params = "id=" + id + "&name=" + name + "&contact=" + contact + "&role=" + role + "&salary=" + salary;
    xhr.send(params);
  }
}

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
            table.rows[i].scrollIntoView({ behavior: "smooth", block: "center" });
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
