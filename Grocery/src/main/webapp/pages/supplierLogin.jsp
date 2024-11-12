<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href = "../styles/login.css">
<meta charset="ISO-8859-1">
<title>Supplier Login</title>
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



	<h3>Welcome to FreshCraze! Supplier Login</h3><br>
	
	<form action="" method="post">
		<label>Username</label>
		<input type="email" id="username" name="email"> <br><br>
		
		<label>Password</label>
		<input type="password" id="password" name="password">
		
		<button type="button" id="login">Login</button><br><br>
		<button type="button" onclick="window.location.href='supplierRegister.jsp'">Register</button>
	</form>
	
	
	<script>
		document.getElementById("login").addEventListener('click', function () {
			const username = document.getElementById("username").value;
			const password = document.getElementById("password").value;
			// Checking if the entered username and password match the expected values
			if(username === "abc@gmail.com" && password === "1234") {
				window.location.href = 'supplierHome.jsp';
			}
			 // If the username and password do not match, showing an alert message
			else {
				alert("Invalid username or password!")
			}
		})
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