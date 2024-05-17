<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>

<%
//Create an empty new variable
String message = null;
String meal_id = request.getParameter("meal_id");
String meal_name = request.getParameter("meal_name");
String takeaway_price = request.getParameter("takeaway_price");
String dinein_price = request.getParameter("dinein_price");
String meal_desc = request.getParameter("meal_desc");

PreparedStatement stmt = null;
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
	
	stmt=conn.prepareStatement("insert into meal values(?,?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,meal_id);
	stmt.setString(2,meal_name);
	stmt.setString(3,takeaway_price);
	stmt.setString(4,dinein_price);
	stmt.setString(5,meal_desc);
	
	stmt.executeUpdate();
	conn.commit();
	
%>
	<script type="text/javascript">
		alert("Product successfully added!");
		location='M_Main.html';
	</script>
<%		
	stmt.close();
	conn.close();
} catch (SQLException ex) {
	out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
	stmt.close();
	conn.close();
}
%>