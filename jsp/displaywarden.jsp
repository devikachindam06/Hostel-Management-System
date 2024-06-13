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
String wid = (request.getParameter("wid"));
try{
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
	            PreparedStatement ps = con.prepareStatement("select * from warden where wid = (?) ");
	            ps.setString(1, wid);

	            ResultSet rs = ps.executeQuery();
	           
	            while (rs.next()) {
	                out.println("Warden Id: "+rs.getString(1));
	                out.println("Password: "+rs.getString(2));}
}
catch(Exception e)
{
	out.println(e);
}
 %>
</body>
</html>