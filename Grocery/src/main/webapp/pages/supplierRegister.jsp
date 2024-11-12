<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href = "../styles/SupS.css">
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
  <img src="../images/logo.png" class="logo" >

    <h1 class="logo_topic">FreshCraze</h1>

    <nav class="navbar">
        <a href="#">Home</a>
        <a href="#">Login</a>
        <a href="#">Register</a>
        <a href="#">About Us</a>
        <span></span>
    </nav>

   <hr class="topic_line">



   <div class="container">
     <h2>Supplier Registration Form</h2>
     <form action="../register" method="post">

       <div class="form-group">
           <label for="suppliername">Supplier Name:</label>
           <input type="text" id="suppliername" name="name" required>
       </div>
       <div class="form-group">
           <label for="address">Address:</label>
           <input type="text" id="address" name="address" required>
       </div>
       <div class="form-group">
           <label for="email">Email:</label>
           <input type="email" id="email" name="email" required>
       </div>
         <div class="form-group">
             <label for="password">Password:</label>
             <input type="password" id="password" name="password" required>
         </div>
         <div class="form-group">
             <label for="confirmPassword">Confirm Password:</label>
             <input type="password" id="confirmPassword" name="confirmPassword" required>
         </div>
       <div class="form-group">
           <label for="phonenumber">Phone Number:</label>
           <input type="tel" id="phonenumber" name="phone_number" pattern="[0-9]{10}" required>
       </div>
         <div class="form-group">
             <label>Product Category:</label>
             <select name="product_category">
        <option value="Food Items">Food staples</option>
        <option value="Beverages">Beverages</option>
        <option value="Snacks">Breakfast,Choco & Snacks</option>
        <option value="House hold and cleaning">Landury & Household</option>
      </select>
         </div>
       <div class="form-group">
           <input type="submit" value="Submit">
       </div>

  </form>
  </div>
  <script>
    function validateForm() {
        var email = document.getElementById("email").value;
        var phoneNumber = document.getElementById("phonenumber").value;

        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(email)) {
            document.getElementById("emailError").innerText = "Invalid email format";
            return false;
        }

        // Phone number validation
        var phoneNumberRegex = /^[0-9]{10}$/;
        if (!phoneNumberRegex.test(phoneNumber)) {
            document.getElementById("phoneError").innerText = "Phone number must be 10 digits";
            return false;
        }

        return true;
    }
</script>
  
  <hr class="footer_line">

<div class="footer">
    <a href="link" target="_blank">
    <button type="button" class="help_button">Help and Support</button>
    </a>

    <div class="fb_icon">
        <a href="https://www.facebook.com/" target="_blank"><img src="../images/facebook.png"></a>
    </div>

    <div class="insta_icon">
        <a href="https://www.instagram.com/" target="_blank"><img src="../images/insta.png"></a>
    </div>

    <div class="twitt_icon">
        <a href="https://www.twitter.com/" target="_blank"><img src="../images/Twitter.png"></a>
    </div>

    <div class="yt_icon">
        <a href="https://www.youtube.com/" target="_blank"><img src="../images/yt.png"></a>
    </div>
</div>

<div class="contacts">
    <h1 class="link">www.freshcraze.lk</h1>
    <h1>Hotline: +94 225 225 25 / +94 225 225 35</h1>
</div>
  



</body>
</html>