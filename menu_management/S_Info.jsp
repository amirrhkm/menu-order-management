<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%
//Create an empty new variable 
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String staffid = request.getParameter("staffid");
String staffpos = request.getParameter("staffpos");
String hourlyrate = request.getParameter("hourlyrate");
String accnum = request.getParameter("accnum");

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

	stmt=conn.prepareStatement("insert into staff values(?,?,?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,staffid);
	stmt.setString(2,firstname);
	stmt.setString(3,lastname);
	stmt.setString(4,staffpos);
	stmt.setString(5,hourlyrate);
	stmt.setString(6,accnum);

	stmt.executeUpdate();
	conn.commit();
	response.sendRedirect("S_Congrates.html");
	
%>
	<script type="text/javascript">
		alert("<p> <b> You have been registered !</b></p>");
		location='S_Congrates.html';
	</script>
<%		
	stmt.close();
	conn.close();
	} 

	catch (SQLException ex) {
	out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
	stmt.close();
	conn.close();
	} 
%>

