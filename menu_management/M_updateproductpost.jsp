<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>

<%
String message = null;
String id = request.getParameter("id");
String meal_id = request.getParameter("new_meal_id");
String meal_name = request.getParameter("new_meal_name");
String takeaway_price = request.getParameter("new_takeaway_price");
String dinein_price = request.getParameter("new_dinein_price");
String meal_desc = request.getParameter("new_meal_desc");

PreparedStatement ps = null;
Connection conn = null;

try {
	//Connect to the database
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String hostname = "119.40.117.30";
	int port = 1521;
	String sid = "fsktm";
	String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
	String user = "D206908";
	String pass = "206908";
	conn = DriverManager.getConnection(oracleURL, user, pass);
	conn.setAutoCommit(false);
	
	// Make the query
	String sql = "Update meal set meal_id=?,meal_name=?,takeaway_price=?,dinein_price=?,meal_desc=? where meal_id='" + id + "'";
	ps = conn.prepareStatement(sql);
	ps.setString(1, meal_id);
	ps.setString(2, meal_name);
	ps.setString(3, takeaway_price);
	ps.setString(4, dinein_price);
	ps.setString(5, meal_desc);
	int i = ps.executeUpdate();
	if(i > 0) {
		out.print("Record Updated Successfully");
	} else {
		out.print("There is a problem in updating Record.");
	}

%>
	<script type="text/javascript">
		alert("Product successfully updated!");
		location='M_Main.html';
	</script>
<%
	conn.commit();
	ps.close();
	conn.close();
} catch (SQLException ex) {
	out.println("<p><b> Could not be updated due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
	ps.close();
	conn.close();
}
%>