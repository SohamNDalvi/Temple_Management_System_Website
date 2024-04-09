<%-- 
    Document   : UserDonate
    Created on : Feb 17, 2024, 1:50:53 AM
    Author     : ROHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="./User_Donating_assets/global.css" />
    <link rel="stylesheet" href="./User_Donating_assets/index.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;700&display=swap"
    />
    <style>
    .input-area:hover{box-shadow: 3px 4px 19.9px 0 rgba(0, 0, 0, 0.25);}
    
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-x: hidden;
            margin: 0;
        }
        .user-donate {
          width: 100%;
          height: 100%;
        }
       
              .donate:hover,
.events:hover,
.about:hover,
.home:hover,
.faqs:hover {
    background-color: lightblue;
    cursor: pointer;
}
 .fb-icon:hover ,.insta-icon:hover,.vector-icon:hover,.vector-icon1:hover{
    cursor: pointer;}
    </style>
  </head>
  <body>
    <div class="user-donate">
      <div class="user-donate-frame">
        <main class="empty-frame">
          <section class="frame-about-events-f-a-qs-parent">
            <div class="frame-about-events-f-a-qs">
              <div class="frame-home-about">
                <header class="frame-donate">
                  <img
                    class="frame-donate-child"
                    loading="eager"
                    alt=""
                    src="User_Donating_assets/rectangle-89@2x.png"
                  />

                  <div class="frame-logo">
                    <div class="home" onclick="window.location.href='index.html'">Home</div>
                    <div class="about" onclick="window.location.href='User_About.jsp'">About</div>
                    <div class="events" onclick="window.location.href='User_Events.jsp'">Events</div>
                    <div class="home-about-events-f-a-qs">
                      <div class="donate" onclick="window.location.href='UserDonate.jsp'">Donate</div>
                      <div class="line-separator"></div>
                    </div>
                    <div class="faqs" onclick="window.location.href='Faq_Page.jsp'">FAQ’s</div>
                  </div>
                </header>
              </div>
            </div>
            <div class="input-area-frame">
              <img
                class="input-area-frame-child"
                alt=""
                src="User_Donating_assets/bg-image.png"
              />

              <h2 class="quote" style="color:black; font-size:xx-large; position: relative; top:20px;">
                "Unite in love, donate today, let's pave the way for the Ram
                Mandir's grand display!"
              </h2>
              <form id="myForm" class="input-area" style="position: relative; top:40px;" action="UserDonateServlet" method="post">
                <div class="quote-text-input-parent">
                  <div class="quote-text-input">

                    <div class="first-name">Full Name</div>
                    <input
                      class="full-name-field"
                      placeholder="Full Name"
                      type="text"
                      name="full-name"
                      style="font-size: large;"
                    required/>
                  </div>
                  <div class="input-frame">
                      <div class="email-id">Email Id</div>
                    <input
                      class="email-field"
                      placeholder="Email ID "
                      type="email"
                      name="email"
                      style="border-color: var(--color-gainsboro);
                      
  display:block;
  outline:none;
  font-size: large"
                    required/>

                    
                  </div>
                  
                  <div class="input-frame2">
                      <div class="phone-number">Phone Number</div>
                    <input
                      class="phone-field"
                      placeholder="Phone Number"
                      type="tel"
                      name="phone-number"
                      style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large"
                     required/>

                  </div>
                  <div class="full-name-input">
                    <div class="city-state-fields-frame">
                      <div class="city-field-pincode-field">
                          <div class="city">City</div>
                        <input class="city-field" placeholder="City" name="city" type="text" style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large" required/>

                        
                      </div>
                      <div class="state-country-field">
                          <div class="state">State</div>
                        <input class="state-field" placeholder="State" name="state" type="text" style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large" required/>

                        
                      </div>
                    </div>
                    <div class="city-state-fields-frame1">
                      <div class="city-parent">
                          <div class="city1">Pincode</div>
                        <input
                          class="pincode-field"
                          name="pincode"
                          placeholder="pincode"
                          type="number"
                          style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large"
                        required/>

                        
                      </div>
                      <div class="country-parent">
                          <div class="country">Country</div>
                        <input
                          class="country-field"
                          placeholder="Country"
                          name="country"
                          type="text"
                          style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large"
                        required/>

                        
                      </div>
                    </div>
                  </div>
                  <div class="input-frame3">
                      <div class="donation-amount">Donation Amount</div>
                    <input
                      class="donation-amount-field"
                      placeholder="Donation Amount"
                      name="donation-amount"
                      type="number"
                      style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large"
                     required/>

                    
                  </div>
                  <div class="input-frame4">
                      <div class="donation-amount1">Payment Details</div>
                    <select name="payment-details" class="payment-details-field" style="border-color: var(--color-gainsboro);
  display:block;
  outline:none;
  font-size: large" required>
        <option value="" disabled selected>Select Payment Method</option>
        <option value="UPI">UPI</option>
        <option value="Debit Card">Debit Card</option>
        <option value="Credit Card">Credit Card</option>
        <option value="Net Banking">Net Banking</option>
    </select>

                    
                  </div>
                </div>
                <div class="footer-frame">
                  <button type="button" class="cancel-button" onclick="location.href='index.html';">
                    <b class="cance">Cancel</b>
                  </button>
                  <button type="submit" class="donate-button">
                    <b class="donate1">Donate</b>
                  </button>
                </div>
              </form>
            </div>
            <footer class="footer">
              <div class="footer-back"></div>
              <div class="frame-frame">
                <div class="f-b-links">
                  <img
                    class="fb-icon"
                    loading="eager"
                    alt=""
                    src="User_Donating_assets/fb.svg"
                  onclick="window.location.href='https://www.facebook.com/srjbtkshetra/'"/>
                </div>
                <div class="f-b-links1">
                  <img
                    class="insta-icon"
                    loading="eager"
                    alt=""
                    src="User_Donating_assets/insta.svg"
                  onclick="window.location.href='https://www.instagram.com/shriramteerthkshetra/'"/>
                </div>
                <img class="vector-icon" alt="" src="User_Donating_assets/vector-1.svg" onclick="window.location.href='https://twitter.com/ShriRamTeerth'"/>

                <img class="vector-icon1" alt="" src="User_Donating_assets/vector-2.svg"  onclick="openComposeEmail()"/>
              </div>
              <div class="footer-frame1">
                <div class="copyright-2020-all">
                  Copyright ©2020 All rights reserved
                </div>
              </div>
            </footer>
          </section>
        </main>
      </div>
       
      <div class="copyright-frame">
        <div class="footer-lines"></div>
      </div>
    </div>
  </body>
</html>
