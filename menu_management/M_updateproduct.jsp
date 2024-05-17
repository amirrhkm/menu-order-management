<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>Update Product</title>
<script type="text/javascript">
		function validateForm() {
			if (document.addproduct.new_meal_id.value == null || document.addproduct.new_meal_id.value =="") {
				alert("Please key-in meal ID");
				return false;
			}
			if (document.addproduct.new_meal_name.value == null || document.addproduct.new_meal_name.value =="") {
				alert("Please key-in meal name");
				return false;
			}
			if (document.addproduct.new_takeaway_price.value == null || document.addproduct.new_takeaway_price.value =="") {
				alert("Please key-in take away price");
				return false;
			}
			if (document.addproduct.new_dinein_price.value == null || document.addproduct.new_dinein_price.value =="") {
				alert("Please key-in dine in price");
				return false;
			}
		}
	</script>

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
					padding: 5px;
					background-color: white;
					color: black;
				}
				
				.inputB {
					line-height:140%;
				}

				table {
					border-spacing: 10px;
				}
				
				strong {
					color: white;
				}
				
				.button {
					-moz-border-radius: 15px;
					border-radius: 15px;
					border: solid 1px black;
					padding: 10px;
					background-color: #ffc421;
					color: black;
				}
				
				.button:hover {
					background-color: white;
					color: black;
				}
				
				td {
					color: white;
				}
				
				.fl {
					width: 100%;
				}
				::placeholder {
				  color: #a6a6a6;
				  opacity: 1; /* Firefox */
				}
				
				:-ms-input-placeholder { /* Internet Explorer 10-11 */
				 color: #a6a6a6;
				}
				
				::-ms-input-placeholder { /* Microsoft Edge */
				 color: #a6a6a6;
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
		String query = "Select meal_id, meal_name, takeaway_price, dinein_price, meal_desc from meal where meal_id='" + request.getParameter("uid%") + "'";
		
		ResultSet rs = stmt.executeQuery(query);
		boolean rs_isEmpty = !rs.next();
		boolean rs_hasData = !rs_isEmpty;
		Object rs_data;
		
	%>

	<h2 align="center" style="color: #ffc421">PRODUCT INFORMATION UPDATE</h2>

	<h3 align="center" style="color: #ffc421">Current Details</h3>

	<form method="get" action="M_productlist.jsp">
		<table align="center" style="width:35%;">
			<tr>
				<td><strong>MEAL ID</strong></td>
				<td>:</td>
				<td><%=rs.getString(1)%></td>
			</tr>
			<tr>
				<td><strong>MEAL NAME</strong></td>
				<td>:</td>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<td><strong>TAKEAWAY PRICE (RM)</strong></td>
				<td>:</td>
				<td><%=rs.getDouble(3)%></td>
			</tr>
			<tr>
				<td><strong>DINE-IN PRICE (RM)</strong></td>
				<td>:</td>
				<td><%=rs.getDouble(4)%></td>
			</tr>
			<tr>
				<td><strong>DESCRIPTION</strong></td>
				<td>:</td>
				<td style="height:auto; width:50%"><%=rs.getString(5)%></td>
			</tr>
		</table>
	</form>

	<h3 align="center" style="color: #ffc421">New Details</h3>
	<form name="updateproduct" action="M_updateproductpost.jsp" onSubmit="return validateForm()" method="post">
		<table align="center" border=0px style='color: white; width: 35%;'>
			<tr>
				<td colspan="2"><input class="fl" type="text" name="new_meal_id" placeholder="  new meal id" /></td>
			</tr>
			<tr>
				<td colspan="2"><input class="fl" type="text" name="new_meal_name" placeholder="  new meal name" /></td>
			</tr>
			<tr>
				<td colspan="2"><input class="fl" type="text" name="new_takeaway_price" placeholder="  new takeaway price (RM)" /></td>
			</tr>
			<tr>
				<td colspan="2"><input class="fl" type="text" name="new_dinein_price" placeholder="  new dine-in price (RM)" /></td>
			</tr>
			<tr>
				<td colspan="2"><input class="fl" type="text" name="new_meal_desc" placeholder="  new meal description" /></td>
			</tr>
			<tr>
				<input type="text" style="color: transparent; background-color: transparent; border-color: transparent; cursor: default;"name="id" value=<%=rs.getString(1)%>>
			</tr>
			<tr>
				<td></td>
				<td align="right"><input class="button" name="Back" type="button" value="Back" onclick="history.back()">
				<input class="button" name="update" type="submit" value="Update Product">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>