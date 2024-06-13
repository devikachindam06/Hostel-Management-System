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

try{
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindetails","root","tiger");
	            PreparedStatement ps = con.prepareStatement("select * from available");
	            

	            ResultSet rs = ps.executeQuery();
	           
	            while (rs.next()) {
	                out.println("Room No: "+rs.getString(1)+"TotalBeds: "+rs.getString(2)+"Available"+rs.getString(3)+"<br>");
	                
	            }
}
catch(Exception e)
{
	out.println(e);
}
 %>
</body>
</html>