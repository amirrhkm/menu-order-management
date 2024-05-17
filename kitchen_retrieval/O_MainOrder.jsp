<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>Order List</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="https://www.w3schools.com/lib/w3.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #000000;
	font-family: Helvetica, sans-serif;
}

input {
	-moz-border-radius: 15px;
	border-radius: 15px;
	border: solid 1px black;
	padding: 10px;
	background-color: #ffc421;
}

.button {
	background-color: #ffc421;
	color: black;
	padding: 15px 32px;
	text-align: center;
	margin: 4px 2px;
	cursor: pointer;
	width: 150px;
	height: 50px;
	line-height: 1.1em;
}

table {
	color: black;
	border: 1px solid black;
	border-spacing: 10px;
	padding: 10px;
}

th, td, tr {
	padding-top: 5px;
	padding-bottom: 5px;
}

.button3 {
			color: orange;
			background-color: transparent;
			border-color: transparent;
			cursor: default;
		}
</style>
</head>
<body>
	<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String hostname = "119.40.117.30";
			int port = 1521;
			String sid = "fsktm";
			String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
			String username = "D206908";
			String password = "206908";
			Connection conn = DriverManager.getConnection(oracleURL, username, password);
			Statement stmt = conn.createStatement();
			//String query = "Select table_no, meal_id, meal_name, quantity, COI from orderedmeal order by table_no";
			String query = "select a.table_no, a.meal_id, a.meal_name, a.quantity, a.COI, b.order_id, b.order_time " +
							"from orderedmeal a JOIN ordertable b " +
							"on (a.table_no = b.table_no) " +
							"order by b.order_time";
			
			ResultSet rs = stmt.executeQuery(query);
			boolean rs_isEmpty = !rs.next();
			boolean rs_hasData = !rs_isEmpty;
			Object rs_data;
	%>
	<div id="home" class="menu-content">
	
	<div id="container" class="w3-container w3-black w3-xxlarge w3-padding-64">
		<h1 class="w3-center w3-jumbo w3-padding-32">KITCHEN ORDER</h1>
	<%
			
			if(rs_isEmpty == false) {
				int prevtable = rs.getInt(1);
				out.println("<div id=\"order\" class=\"w3-container w3-white w3-padding-32\">");
				
				out.println("<form method=\"POST\" action=\"O_deleteorder.jsp\">");
				out.println("<table align=\"center\">");
				out.println("<tr><td colspan=\"2\">" + rs.getString(7)+ "</td><td>" + rs.getInt(6) + "</td></tr>");
				out.println("<tr><td colspan=\"2\" align=\"center\"  style='border-bottom:1px solid black!important;border-top:1px solid black!important;'>TABLE " + rs.getInt(1) + "</td>"
						+ "<td style='border-bottom:1px solid black!important;border-top:1px solid black!important'>[ " + rs.getString(5)+ " ]</rd></tr>");
				out.println("<tr><th>ID</th><th>NAME</th><th>QTY</th></tr>");
				do {
					if(rs.getInt(1) == prevtable) {
						out.println("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getInt(4)+ "</td></tr>");
					} else {
						out.println("<tr><td align=\"center\" colspan=\"3\"><button class=\"button3\" type=\"submit\" formaction=\"O_deleteorder.jsp?id=" + prevtable + "\">remove</button></td></tr>");
						out.println("</table></div>");
						out.println("<div id=\"order\" class=\"w3-container w3-white w3-padding-32\">");
						out.println("<table align=\"center\">");
						out.println("<tr><td colspan=\"2\">" + rs.getString(7)+ "</td><td>" + rs.getInt(6) + "</td></tr>");
						out.println("<tr><td colspan=\"2\" align=\"center\"  style='border-bottom:1px solid black!important;border-top:1px solid black!important;'>TABLE " + rs.getInt(1) + "</td>"
								+ "<td style='border-bottom:1px solid black!important;border-top:1px solid black!important'>[ " + rs.getString(5)+ " ]</rd></tr>");
						out.println("<tr><th>ID</th><th>NAME</th><th>QTY</th></tr>");
						out.println("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getInt(4)+ "</td></tr>");
					}
					prevtable = rs.getInt(1);
				} while(rs.next());
				out.println("<tr><td align=\"center\" colspan=\"3\"><button class=\"button3\" type=\"submit\" formaction=\"O_deleteorder.jsp?id=" + prevtable + "\">remove</button></td></tr>");
				out.println("</table>");
				out.println("</form></div>");
			} else {
				out.println("<h5 align=\"center\">there is no current order</h5>");
			}
	%>
	</div></div>
	
	<%		
		
			conn.close();
		%>
</body>
</html>