<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<style>
input {
	background-color: transparent;
	color: white;
	border: 0px;
}
</style>
<body class="w3-black">
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String hostname = "119.40.117.30 ";
	int port = 1521;
	String sid = "fsktm";
	String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
	String username = "D206908";
	String password = "206908";
	Connection conn = DriverManager.getConnection(oracleURL, username, password);
	Statement stmt = conn.createStatement();
	String sql = "select lastname from staff where staffid=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("staffid"));
	ResultSet rs = ps.executeQuery();
	if(rs.next()) {
		response.sendRedirect("S_Ward.jsp?lastname=" + rs.getString(1));
	} else {
		%>
		<script type="text/javascript">
			alert("Staff ID is invalid!");
			location='S_Logs.html';
		</script>
		<%
	}
	
	conn.close();
} catch (ClassNotFoundException cnfe) {
	System.out.println("Error loading driver: "+cnfe);
}
%>
</body>