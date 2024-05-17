<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Staff Dashboard</title>
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://www.w3schools.com/lib/w3.js"></script>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
		
		<style>
		form {text-align:center}
		button {
			background-color:transparent;
			color:white;
			border: none;
			padding: 5px;
			width: 100%;
			text-align:center;
			line-height : 25px;
			cursor: pointer;
		}
		h2 {font-family: Helvetica, sans-serif}
		img {
			-moz-border-radius: 15px;
			border-radius: 15px;
			align: center;
			text-align: center;
		}
		input {
			width:100px;
			background-color: transparent;
			color: white;
			border: 0px;
		}
		</style>
	</head>
	
<body class="w3-black">
<br><br><br><br>
<table align="center">
<tr><td><img style="text-align:center;" src="https://expertphotography.b-cdn.net/wp-content/uploads/2021/08/aspect.ratio_.mishra.waterfall.square.jpg" alt="Show.jpg" width="450" height="450"></td></tr>
<tr><td><h4 align="center">Welcome, <%=request.getParameter("lastname")%> !</h4></td></tr>
<tr><td style="color:black;">|</td></tr>
<tr><td><button onclick="window.location.href='Main.html'"><h2><b>Menu Management</b></h2></button></td></tr>
<tr><td><button onclick="window.location.href='SMenu.html'"><h2><b>Log Out</b></h2></button></td></tr>
</table>
<br><br><br><br><br><br><br><br>
</body>

</html>