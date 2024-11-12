<%@ page import="static service.SupplierService.supplier" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
  <link rel ="stylesheet" href = "../styles/SupS.css">
  <meta charset="ISO-8859-1">
  <title>Update</title>
</head>
<body>
<img src="../images/logo.png" class="logo" >

<h1 class="logo_topic">FreshCraze</h1>

 <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="pages/supplierLogin.jsp">Supplier</a>
        <a href="link">About Us</a>
        <a href="link">FAQs</a>
        <span></span>
    </nav>

<hr class="topic_line">

<div class="container">
  <h2>Supplier Registration Form</h2>
  <form action="../update" method="post">

    <div class="form-group">
      <label for="supplierid">Supplier Name:</label>
      <input type="number" id="supplierid" name="id" value="<%=supplier.getId()%>" readonly required>
    </div>
    <div class="form-group">
      <label for="suppliername">Supplier Name:</label>
      <input type="text" id="suppliername" name="name" value="<%=supplier.getName()%>" required>
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" id="address" name="address" value="<%=supplier.getAddress()%>" required>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" value="<%=supplier.getEmail()%>" required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" value="<%=supplier.getPassword()%>" required>
    </div>
    <div class="form-group">
      <label for="confirmPassword">Confirm Password:</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required>
    </div>
    <div class="form-group">
      <label for="phonenumber">Phone Number:</label>
      <input type="tel" id="phonenumber" name="phone_number" pattern="[0-9]{10}" value="<%=supplier.getPhone_number()%>" required>
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
      <input type="submit" value="Update" >
    </div>

  </form>
</div>

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