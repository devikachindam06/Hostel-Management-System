<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sid = (request.getParameter("sid"));
try{
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
	            PreparedStatement ps = con.prepareStatement("select * from student where studentid = (?) ");
	            ps.setString(1, sid);

	            ResultSet rs = ps.executeQuery();
	           
	            while (rs.next()) {
	                out.println("Student Id: "+rs.getString(1));
	                out.println("Password: "+rs.getString(2));}
}
catch(Exception e)
{
	out.println(e);
}
 %>
</body>
</html>