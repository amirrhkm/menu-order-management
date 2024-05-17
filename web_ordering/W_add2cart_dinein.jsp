<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>

<%
String message = null;
String meal_id = request.getParameter("meal_id");
String meal_name = request.getParameter("meal_name");
int table_no = Integer.parseInt(request.getParameter("tableNum"));
String COI = "DI";
//double qty = Double.parseDouble(request.getParameter("quantity"));
//double price = Double.parseDouble(request.getParameter("price"));


double price = Double.parseDouble(request.getParameter("price"));
double qty = Double.parseDouble(request.getParameter("quantity"));
double totalprice = price * qty;

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
	
	stmt =conn.prepareStatement("insert into orderedmeal (meal_id,meal_name,quantity,price,table_no,COI) values(?,?,?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,meal_id);
	stmt.setString(2,meal_name);
	stmt.setDouble(3,qty);
	stmt.setDouble(4,totalprice);
	stmt.setInt(5,table_no);
	stmt.setString(6,COI);
	
	stmt.executeUpdate();
	conn.commit();
	response.sendRedirect("W_menulist_dinein.jsp?table_no=" + table_no);
	
	stmt.close();
	conn.close();
} catch (SQLException ex) {
	out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
	stmt.close();
	conn.close();
}
%>