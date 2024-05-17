<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>Product List</title>
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

.button2 {
	background-color: black;
	border: 2px solid;
	border-color: #ffc421;
	color: white;
	font-weight: bold;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 12px;
	height: 200px;
	width: 200px;
	transition-duration: 0.4s;
}

.button2:hover {
	background-color: white;
	color: black;
}

.button3 {
	color: #ffc421;
	background-color: transparent;
	border-color: transparent;
	cursor: default;
}

table {
	color: white;
	border: 0px;
	border-spacing: 10px;
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
			String query = "Select meal_id, meal_name, takeaway_price, dinein_price from meal where meal_id like '" + request.getParameter("id%") + "' ORDER BY meal_id";
		
			out.println("");
			out.println("");
			if(request.getParameter("id%").equals("%")) {
				out.println("<h1 align=\"center\" style=\"color:#ffc421\">ALL PRODUCTS</h1>");}
			if(request.getParameter("id%").equals("R%")) {
				out.println("<h1 align=\"center\" style=\"color:#ffc421\">ROTI</h1>");}
			if(request.getParameter("id%").equals("N%")) {
				out.println("<h1 align=\"center\" style=\"color:#ffc421\">NASI</h1>");}
			if(request.getParameter("id%").equals("M%")){
				out.println("<h1 align=\"center\" style=\"color:#ffc421\">MINUMAN</h1>");}
			if(request.getParameter("id%").equals("G%")){
				out.println("<h1 align=\"center\" style=\"color:#ffc421\">GORENG</h1>");}
			if(request.getParameter("id%").equals("D%")){
				out.println("<h1 align=\"center\" style=\"color:#ffc421\">DESSERT</h1>");}
			
			ResultSet rs = stmt.executeQuery(query);
			boolean rs_isEmpty = !rs.next();
			boolean rs_hasData = !rs_isEmpty;
			Object rs_data;
			
			if(rs_isEmpty == false) {
					out.println("<form method=\"post\" action=\"M_updateproduct.jsp\">");
					int ctr = 1;
					out.println("<table align=\"center\">");
					out.println("<tr><th>NO.</th><th>MEAL ID</th><th>MEAL NAME</th><th>TAKEAWAY PRICE (RM)</th><th>DINE-IN PRICE (RM)</th><th>MODIFY</th></tr>");
					
					
					do {
						out.println("<tr><td>" +
						ctr + "</td><td> " +
						rs.getString(1) + "</td><td> " +
						rs.getString(2) + "</td><td> " +
						rs.getDouble(3) + "</td><td> " +
						rs.getDouble(4) + "</td><td> " +
						"<button class=\"button3\" type=\"submit\" formaction=\"M_deleteproduct.jsp?id=" + rs.getString(1) + "\">delete</button>  " +
						"<button class=\"button3\" type=\"submit\" name=\"uid%\" value=\"" + rs.getString(1) + "\">update</button>  ");
						out.println("</td></tr>");
						ctr = ctr + 1;
					} while (rs.next());
					out.println("</form>");
					
					out.println("<tr><td></td><td></td><td></td><td align=\"center\"><input name = \"Back\" type=\"button\" value=\"Back\" onclick=\"history.back()\">");
					out.println("  <input name = \"addproduct\" type=\"button\" value=\"Add Product\" onclick=\"location.href='M_addproduct.html'\"></td><td></td><td></td></tr>");
		
			} else {
				out.println("<h3 align=\"center\" style=\"color:white\">This category is empty</h3>");
				out.println("<table align=\"center\">");
				out.println("<tr><td align=\"center\"><input name = \"Back\" type=\"button\" value=\"Back\" onclick=\"history.back()\">");
				out.println("  <input name = \"addproduct\" type=\"button\" value=\"Add Product\" onclick=\"location.href='M_addproduct.html'\"></td></tr>");
				out.println("</table>");
			}
			
			
		
			conn.close();
		%>
</body>
</html>