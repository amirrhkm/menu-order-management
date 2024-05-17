<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>

<%
String message = null;
int table_no = Integer.parseInt(request.getParameter("table_no"));

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
	
	stmt =conn.prepareStatement("insert into ordertable (table_no) values(?)");
	stmt.clearParameters();
	stmt.setInt(1,table_no);
	
	stmt.executeUpdate();
	conn.commit();
	response.sendRedirect("W_submitorder.jsp?table_no=" + table_no);
	
	stmt.close();
	conn.close();
} catch (SQLException ex) {
	out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
	stmt.close();
	conn.close();
}
%>