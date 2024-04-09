<%-- 
    Document   : Faq_Page
    Created on : Feb 19, 2024, 1:26:12 PM
    Author     : ROHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700;800&display=swap" />
    <link rel="stylesheet" href="./faq_Assets/index.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" charset="utf-8"></script>
  <style media="screen">

.donate:hover,
.events-5:hover,
.about:hover,
.home:hover,
.faqs:hover {
    background-color: lightblue;
    cursor: pointer;
}
       
.accordions {
width: 80%;
margin: 100px auto;
}

.accordions h3 {
text-align: center;
font-family: "poppins";
font-weight: bold;
}

.accordion-item {
background-color: #8b8e92d4;
margin-bottom: 20px;
border-radius: 7px;
color: #ffffff;
width:980px
}

.accordion-item .accordion-title {
cursor: pointer;
padding: 20px;
transition: transform 0.4s ease-in-out;
}

.accordion-item .accordion-title.active-title {
background-color: #5a94b1;
border-radius: 7px;
color: #ffffff;
}

.accordion-item .accordion-title h3 {
font-weight: 700;
margin: 0;
font-size: 18px;
display: flex;
justify-content: space-between;
font-weight: bold;
}

.accordion-item .accordion-title i.fa-chevron-down {
transform: rotate(0);
transition: 0.4s;
}

.accordion-item .accordion-title i.fa-chevron-down.chevron-top {
transform: rotate(-180deg);
color: #ffffff;
}

.accordion-item .accordion-content {
display: none;
line-height: 1.7;
padding: 20px;
background-color: #ffffff;
border-radius: 0 0 5px 5px;
color: #100e34;
}

.accordion-item .accordion-content.active {
display: block;
}

.accordion-item .accordion-content p {
    margin: 0;
    font-family: "poppins";
    font-size: 15px;
    white-space: normal; 
    text-align: left;
    
}
.details {
background: #dce1f2;
}

.details .detailed_info {
margin: 50px auto;
}

.details img {
margin: 0 auto;
display: block;
/* margin-top: 120px; */
}

.details h3 {
font-family: "Poppins", sans-serif;
font-weight: bold;
font-size: 20px;
}

.details p {
font-family: "Nunito Sans", sans-serif;
font-size: 16px;
line-height: 1.5em;
}

.details ul li {
font-family: "Nunito Sans", sans-serif;
font-size: 16px;
line-height: 1.7em;
}

.regroup-i:hover ,.group:hover,.fb:hover,.insta:hover{
    cursor: pointer;}
.accordion-item{box-shadow: 3px 4px 19.9px 0 rgba(0, 0, 0, 0.25);}

  </style>
  </head>
  <body>
    <div class="main-container" style="height:1290px;" >
      <div class="line"></div>
      <div class="flex-column-bcd">
        <div class="frame">
          <div class="rectangle"></div>
          <span class="home" onclick="window.location.href='index.html'">Home</span>
          <span class="about" onclick="window.location.href='User_About.jsp'">About</span>
          <span class="events-5" onclick="window.location.href='User_Events.jsp'">Events</span>
          <span class="faqs" onclick="window.location.href='Faq_Page.jsp'">FAQ’s</span>
          <span class="donate" onclick="window.location.href='UserDonate.jsp'">Donate</span>
          <div class="line-7"></div>
        </div>
        <div class="section-heading">
          <span class="section-title">Frequently Asked Questions</span>
        </div>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <section id="faq" >
    <div class="container faq" style="position: relative; left:-40px; top:180px; height:200px">

      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="accordions">
              <div class="accordion-item">
                <div class="accordion-title" data-tab="item1">
                  <h3>How can I make a donation to the temple online?
 <i class="fa fa-chevron-down"></i></h3>
                </div>
                <div class="accordion-content" id="item1">
                  <p>
                   Making a donation to our temple online is quick and easy. You can visit the "Donate" section on our website, where you'll find various payment options available, including credit/debit card payments, bank transfers, or popular online payment platforms. Simply choose your preferred method, enter the donation amount, and follow the instructions to complete the transaction securely. Your generous contributions help support our temple's maintenance, community programs, and charitable initiatives.
                  </p>
                </div>
              </div>

              <div class="accordion-item">
                <div class="accordion-title" data-tab="item2">
                  <h3>Is there a schedule of upcoming events and religious ceremonies available on the website? <i class="fa fa-chevron-down"></i></h3>
                </div>
                <div class="accordion-content" id="item2">
                  <p>
                    Yes, you can find the schedule of upcoming events and religious ceremonies on our website. Simply navigate to the "Events" section on the homepage or visit the "Events" page for detailed information.
                  </p>
                </div>
              </div>

              <div class="accordion-item">
                <div class="accordion-title" data-tab="item3">
                  <h3>How can I book a slot for participating in a religious ritual or ceremony?<i class="fa fa-chevron-down"></i></h3>
                </div>
                <div class="accordion-content" id="item3">
                  <p>
                    To book a slot for participating in a religious ritual or ceremony, please visit the "Plan Your Yatra" section on our website. There, you'll find a booking form where you can select your preferred date and time for the ceremony. Our team will then reach out to confirm your booking and provide further instructions.
                  </p>
                </div>
              </div>

              <div class="accordion-item">
                <div class="accordion-title" data-tab="item4">
                  <h3>Are there any specific rituals or practices I should be aware of before coming to the Ram Mandir? <i class="fa fa-chevron-down"></i></h3>
                </div>
                <div class="accordion-content" id="item4">
                  <p>
                    Before visiting the Ram Mandir, it's advisable to familiarize yourself with basic temple etiquette, such as removing shoes before entering the sacred premises and dressing modestly. Additionally, consider purifying yourself with a bath or ablutions and maintaining a respectful demeanor during your visit.
                  </p>
                </div>
              </div>
                
                <div class="accordion-item">
                <div class="accordion-title" data-tab="item5">
                  <h3>Are there any specific guidelines for photography or videography within the temple premises?<i class="fa fa-chevron-down"></i></h3>
                </div>
                <div class="accordion-content" id="item5">
                  <p>
                    Photography and videography for personal, non-commercial use are generally allowed within the temple premises. However, we kindly ask visitors to respect the sanctity of the temple and the privacy of other devotees. Please refrain from using flash photography, capturing images of sacred rituals without permission, or causing any disruption to the spiritual atmosphere. Thank you for your understanding and cooperation.
                  </p>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
 
        <span class="contact-us" style="bottom:180px">For More Details Contact Us :</span
        ><button class="badge-8" style="bottom:180px"  onclick="openComposeEmail()">
            <div class="content"><span class="label" style="font-size:20px">Contact Us</span></div>
        </button>
        <div class="line"></div>
        <div class="footer">
          <div class="rectangle-9" style="top:-1070px">
            <div class="flex-row-decb">
              <div class="regroup-i" onclick="window.location.href='https://twitter.com/ShriRamTeerth'">
                <div class="group" onclick="openComposeEmail()"></div>
                <div class="frame-a"></div>
              </div>
              <div class="fb" onclick="window.location.href='https://www.facebook.com/srjbtkshetra/'"></div>
              <div class="insta" onclick="window.location.href='https://www.instagram.com/shriramteerthkshetra/'"></div>
            </div>
            <span class="copyright-reserved"
              >Copyright ©2024 All rights reserved
            </span>
               
          </div>
        </div>
      </div>
      <div class="rectangle-b"></div>
    </div>
  </body>
</html>
 <script type="text/javascript">
  $(document).ready(function () {
    $(".accordion-title").click(function (e) {
      var accordionitem = $(this).attr("data-tab");
      $("#" + accordionitem)
        .slideToggle()
        .parent()
        .siblings()
        .find(".accordion-content")
        .slideUp();

      $(this).toggleClass("active-title");
      $("#" + accordionitem)
        .parent()
        .siblings()
        .find(".accordion-title")
        .removeClass("active-title");

      $("i.fa-chevron-down", this).toggleClass("chevron-top");
      $("#" + accordionitem)
        .parent()
        .siblings()
        .find(".accordion-title i.fa-chevron-down")
        .removeClass("chevron-top");
    });
  });

function openComposeEmail() {
            // Email address of the recipient
            var recipientEmail = "sohamdalvi1206@gmail.com";

            // Subject of the email (optional)
            var subject = "";

            // Body of the email (optional)
            var body = "";

            // Construct the mailto link
            var mailtoLink = "mailto:" + recipientEmail + "?subject=" + encodeURIComponent(subject) + "&body=" + encodeURIComponent(body);

            // Open the default email client with the pre-filled email
            window.location.href = mailtoLink;
        }
    
  function confirmLogin() {
      // Prompt the user with a confirmation dialog
      var confirmation = confirm("Do you want to login as admin?");
      
      // If the user clicks "OK" (true) in the confirmation dialog
      if (confirmation) {
        // Redirect to Admin_login.jsp
        window.location.href = "Admin_login_page.jsp";
      }
      // If the user clicks "Cancel" (false) in the confirmation dialog, do nothing
    }
  </script> 