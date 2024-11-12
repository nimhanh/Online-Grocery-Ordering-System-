<%@ page import="model.Supplier" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href = "../styles/supdetails.css">
<meta charset="ISO-8859-1">
<title>Supplier DashBoard</title>
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

<h1> <center> Supplier Dashboard </center></h1><br><br><br>
<table border="1" width =50px>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Email</th>
		<th>Address</th>
		<th>Phone</th>
		<th>Product Category</th>
		<th>Update</th>
		<th>Delete</th>
		<!-- Add more column headers as needed -->
	</tr>
	<%

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery?useSSL=false","root","hs3076");

			String sql = "SELECT * FROM supplier";

			Statement statement = connection.createStatement();

			ResultSet result = statement.executeQuery(sql);

			while (result.next()) {
	%>

	<tr>
		<td><%=result.getString("id")%></td>
		<td><%=result.getString("name")%></td>
		<td><%=result.getString("email")%></td>
		<td><%=result.getString("address")%></td>
		<td><%=result.getString("phone_number")%></td>
		<td><%=result.getString("product_category")%></td>
		<td><a href="../getSupplier?id=<%=result.getString("id")%>" style="color: #fff; background-color: #007bff; border-color: #007bff; padding: 5px 10px; border-radius: 3px; text-decoration: none;">update</a></td>
		
		<td><a href="../delete?id=<%=result.getString("id")%>" style="color: #fff; background-color: #dc3545; border-color: #dc3545; padding: 5px 10px; border-radius: 3px; text-decoration: none;">delete</a></td>
		
		<%
			}
			result.close();
			statement.close();
			connection.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</tr>

</table>
   <br><br><br><br><br><br><br><br><br><br><br><br>

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