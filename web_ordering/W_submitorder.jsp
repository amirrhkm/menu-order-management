<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="https://www.w3schools.com/lib/w3.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">

<title>ORDER CHIT</title>
	<style>
		body,h1,h2,h3,h4,h5,h6 {
			font-family: "Amatic SC", sans-serif;
		}
		
		input {
			-moz-border-radius: 15px;
			border-radius: 15px;
			border: solid 1px black;
			padding: 10px;
			background-color: #ffc421;
		}
		
		.tableNo {
			-moz-border-radius: default;
			border-radius: 0px;
			border: solid 0px black;
			padding: 0px;
			background-color: transparent;
			color: black;
			cursor: default;
		}
		
		b,span {
			font-size: 72px;
		}
		
		.float {
			transform: translate(0, 0px) scale(0);
			position: relative;
			height: 0%;
			width: 0%;
			border: 0px;
			outline: 0px;
			padding: 0px;
			background-color: transparent;
			color: transparent;
			cursor: default;
			
		}
		
		var {
			color:transparent;
			cursor:default;
		}
		
		table {
			color: white;
			border: 1px solid black;
			border-spacing: 15px;
			font-size: 50px;
			color: black;
		}
		
		.w3-jumbocustom {
			font-size:128px!important;
		}
		
		.button3 {
			color: orange;
			background-color: transparent;
			border-color: transparent;
			cursor: default;
		}
		
		.banner {
			color:white!important;
			text-align:center;
			align:center;
			font-size: 45px!important;
		}
	</style>
</head>
<body>
	<%
			int table_no = Integer.parseInt(request.getParameter("table_no"));		
	
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String hostname = "119.40.117.30";
			int port = 1521;
			String sid = "fsktm";
			String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
			String username = "D206908";
			String password = "206908";
			Connection conn = DriverManager.getConnection(oracleURL, username, password);
			Statement stmt = conn.createStatement();
			String query = "Select meal_id, meal_name, quantity, price from orderedmeal where table_no=" + table_no + " order by meal_id";
			
			ResultSet rs = stmt.executeQuery(query);
			boolean rs_isEmpty = !rs.next();
			boolean rs_hasData = !rs_isEmpty;
			Object rs_data;
			
		%>
		<!-- Start Content -->
		<div id="home" class="menu-content">

		<!-- Menu -->
		<div id="menu" class="w3-container w3-black w3-xxlarge w3-padding-64">
			<h1 class="w3-center w3-jumbocustom w3-padding-32">ORDER CHIT</h1>
		<div id="ORDERCHIT" class="banner w3-container w3-orange w3-padding-32">your order has been submitted successfully!</div>
		<div id="ORDERCHIT" class="w3-container w3-white w3-padding-32">
		<%
			out.println("<table align=\"center\">");
			out.println("<tr><td colspan=\"3\" align=\"center\" style='border-bottom:1px solid black;'>table no : " +
			"<input class=\"tableNo\" type=\"button\" name=\"carttablenum\" value=\"" + request.getParameter("table_no") +"\"></td></tr>");
			out.println("<tr><th>ORDER</th><th>QTY</th><th>PRICE</th></tr>");
			
			double total=0, temp=0;
			out.println("<form method=\"post\" action=\"W_submitorder.jsp\">");
			out.println("<input class=\"float\" type=\"text\" name=\"table_no\" value=\"" + request.getParameter("table_no") +"\">");
			do {
				out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>" + rs.getDouble(3) + "</td><td> " + rs.getDouble(4) + "</td></tr>");
				temp = rs.getDouble(4);
				total = total + temp;
			} while(rs.next());
			
			out.println("</form>");
			out.println("</table>");
			out.println("</br>");
			out.println("<table align=\"center\" >");
			out.println("<tr><th>TOTAL PRICE</th><td> : </td><td>RM " + total + "</td></tr>");
			out.println("</table>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
		
			conn.close();
		%>
</body>
</html>