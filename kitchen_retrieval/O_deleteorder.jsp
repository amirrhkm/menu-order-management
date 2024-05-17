<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String id = request.getParameter("id");
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
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
		//stmt = conn.prepareStatement("DELETE a.*, b.* FROM orderedmeal a  LEFT JOIN ordertable b ON b.table_no = a.table_no WHERE a.table_no ='" + id + "'");
		stmt = conn.prepareStatement("delete from orderedmeal where table_no='" + id + "'");
		stmt.executeUpdate();
		
		stmt2 = conn.prepareStatement("delete from ordertable where table_no='" + id + "'");
		stmt2.executeUpdate();
			
		
		response.sendRedirect("O_MainOrder.jsp");
		
		//response.sendRedirect("Main.html");
		
		conn.commit();
	} catch(Exception e) {
		stmt.close();
		conn.close();
		System.out.print(e);
		e.printStackTrace();
	}
%>