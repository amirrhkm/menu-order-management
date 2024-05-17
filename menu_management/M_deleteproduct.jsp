<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String id = request.getParameter("id");
	PreparedStatement stmt = null;
	Connection conn = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String hostname = "119.40.117.30";
		int port = 1521;
		String sid = "fsktm";
		String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
		String user = "D206908";
		String pass = "206908";
		conn = DriverManager.getConnection(oracleURL, user, pass);
		conn.setAutoCommit(false);
		
		stmt = conn.prepareStatement("delete from meal where meal_id='" + id + "'");
		stmt.executeUpdate();
			%>
				<script type="text/javascript">
					alert("Product succefully deleted!");
					location='M_Main.html';
				</script>
			<%
		//response.sendRedirect("Main.html");
		
		conn.commit();
	} catch(Exception e) {
		stmt.close();
		conn.close();
		System.out.print(e);
		e.printStackTrace();
	}
%>