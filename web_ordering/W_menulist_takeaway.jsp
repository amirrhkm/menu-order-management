<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="https://www.w3schools.com/lib/w3.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">

<title>Takeaway Menu List</title>
	<script type="text/javascript">
	/*
		function validateForm() {
			var quantityForm = document.getElementById("qty");
        	var choice = quantityForm.options[quantityForm.selectedIndex].value;
        	var choiceContent = quantityForm.options[quantityForm.selectedIndex].text;
        	var ddValidity = false;
        	
        	if(choice == 0) {
        		alert("quantity is undefined!");
				return ddValidity;
        	}
        	
        	if(choice == "0") {
        		alert("quantity is undefined!");
				return ddValidity;
        	}
		}
	*/
		</script>
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
			color: white;
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
		
		.w3-jumbocustom {
			font-size:128px!important;
		}
		
		.w3-thirdcustom {
			width:16.6667%!important;
		}
		
		.cart {
			background-color:orange;
			color:white;
			border:none; 
			padding: 5px 15px;
			font-family: "Amatic SC",sans-serif;
			border-radius: 70%;
			position: absolute;
			right: 0px;
			bottom: 0px;
		}
		
		var {
			color:transparent;
			cursor:default;
		}
		
		select {
			width: 70px;
			height: 70px;
			text-align-last: center;
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
			String query = "Select meal_id, meal_name, takeaway_price, meal_desc from meal ORDER BY meal_id";
			
			ResultSet rs = stmt.executeQuery(query);
			boolean rs_isEmpty = !rs.next();
			boolean rs_hasData = !rs_isEmpty;
			Object rs_data;
			
		%>
		<!-- Start Content -->
		<div id="home" class="menu-content">

		<!-- Menu -->
		<div id="menu" class="w3-container w3-black w3-xxlarge w3-padding-64">
			<h1 class="w3-center w3-jumbocustom w3-padding-32">TAKEAWAY MENU </h1>
			table no : <input class="tableNo" type="text" name="menutablenum" value="<%=request.getParameter("table_no")%>">
			<div class="w3-row w3-center w3-border w3-border-dark-grey">
				<a href="#DESSERT"><div class="w3-third w3-thirdcustom w3-padding-large w3-red">DESSERT</div></a>
				<a href="#ROTI"><div class="w3-third w3-thirdcustom w3-padding-large w3-hover-red">ROTI</div></a>
				<a href="#GORENG"><div class="w3-third w3-thirdcustom w3-padding-large w3-hover-red">GORENG</div></a>
				<a href="#MINUMAN"><div class="w3-third w3-thirdcustom w3-padding-large w3-hover-red">MINUMAN</div></a>
				<a href="#NASI"><div class="w3-third w3-thirdcustom w3-padding-large w3-hover-red">NASI</div></a>
				<a href="W_cart.jsp?table_no=<%=request.getParameter("table_no")%>"><div class="w3-third w3-thirdcustom w3-padding-large w3-orange">CART</div></a>
			</div>
		
		<div id="DESSERT" class="w3-container w3-white w3-padding-32">
		
		<%
		
		do {
			
			if(rs.getString(1).equals("R01")) {
				out.println("</div>");
				out.println("<h1 id=\"ROTI\" class=\"w3-center w3-jumbo w3-padding-32\">ROTI</h1>");
				out.println("<div class=\"w3-container w3-white w3-padding-32\">");
			}
			if(rs.getString(1).equals("N01")) {
				out.println("</div>");
				out.println("<h1 id=\"NASI\" class=\"w3-center w3-jumbo w3-padding-32\">NASI</h1>");
				out.println("<div class=\"w3-container w3-white w3-padding-32\">");
			}
			if(rs.getString(1).equals("G01")) {
				out.println("</div>");
				out.println("<h1 id=\"GORENG\" class=\"w3-center w3-jumbo w3-padding-32\">GORENG</h1>");
				out.println("<div class=\"w3-container w3-white w3-padding-32\">");
			}
			if(rs.getString(1).equals("M01")) {
				out.println("</div>");
				out.println("<h1 id=\"MINUMAN\" class=\"w3-center w3-jumbo w3-padding-32\">MINUMAN</h1>");
				out.println("<div class=\"w3-container w3-white w3-padding-32\">");
			}
			
			
			out.println("<b>(" + rs.getString(1) + ") " + rs.getString(2) + "</b> <span class=\"w3-right w3-tag w3-dark-grey w3-round\">RM " + rs.getDouble(3) + "</span>");
			out.println("<p class=\"w3-text-grey\">" + rs.getString(4) + "</p>");
			out.println("<form method=\"post\" action=\"W_add2cart_takeaway.jsp\" onSubmit=\"return validateForm()\">");
				
				out.println("<input class=\"float\" type=\"text\" name=\"price\" value=\"" + rs.getDouble(3) + "\">");
				out.println("<input class=\"float\" type=\"text\" name=\"meal_name\" value=\"" + rs.getString(2) + "\">");
				out.println("<input class=\"float\" type=\"text\" name=\"meal_id\" value=\"" + rs.getString(1) + "\">");
				out.println("<input class=\"float\" type=\"text\" name=\"tableNum\" value=\"" + request.getParameter("table_no") + "\">");
				
				out.println("<p align=\"right\"><select id=\"qty\" name=\"quantity\">" + 
						"<option name=\"qty\" value=\"1\">1</option>" +
						"<option name=\"qty\" value=\"2\">2</option>" +
						"<option name=\"qty\" value=\"3\">3</option>" +
						"<option name=\"qty\" value=\"4\">4</option>" +
						"<option name=\"qty\" value=\"5\">5</option>" +
						"<option name=\"qty\" value=\"6\">6</option>" +
						"<option name=\"qty\" value=\"7\">7</option>" +
						"<option name=\"qty\" value=\"8\">8</option>" +
						"<option name=\"qty\" value=\"9\">9</option>" +
						"<option name=\"qty\" value=\"10\">10</option>" +
					"</select><var>~~</var>");
				
				out.println("<input name=\"add2order\" type=\"submit\" value=\"Add To Cart\"></p>");
				out.println("<hr>");
			out.println("</form>");
		} while(rs.next());
			
		out.println("</div>");
		out.println("<h1 id=\"G2B\" class=\"w3-center w3-jumbo w3-padding-32\"></h1>");
		out.println("</div></div>");
		%>
		
		
		<%
			conn.close();
		%>
</body>
</html>