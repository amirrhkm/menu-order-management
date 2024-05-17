<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>

<%
try {
	int managerid = Integer.parseInt(request.getParameter("managerid"));
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String hostname = "119.40.117.30 ";
	int port = 1521;
	String sid = "fsktm";
	String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
	String username = "D206908";
	String password = "206908";
	Connection conn = DriverManager.getConnection(oracleURL, username, password);
	Statement stmt = conn.createStatement();
	String sql = "select * from staff where staffid=? and position in ('RM','M','AM')";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("managerid"));
	ResultSet rs = ps.executeQuery();
	if(rs.next()) {
		%>
		<script type="text/javascript">
			location='S_Create.html';
		</script>
		<%	
	} else {
		%>
		<script type="text/javascript">
			alert("Manager ID is invalid!");
			location='S_ManVerify.html';
		</script>
		<%
	}
	
	conn.close();
} catch (ClassNotFoundException cnfe) {
	System.out.println("Error loading driver: "+cnfe);
}
%>