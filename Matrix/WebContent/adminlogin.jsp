<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="icon" type="image/x-icon" href="link.png">
</head>
<body>
	<% 
String id1=request.getParameter("username2");
String id=request.getParameter("password2");
String password,username;
boolean check=true;
if(id1!=null){
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/world?"+"user=root&password=123456&serverTimezone=GMT%2B8");
	Statement stmt =conn.createStatement();
	String sql1="select * from no2";
	ResultSet RS_result=stmt.executeQuery(sql1);
	while(RS_result.next()){
		username=RS_result.getString("username");
		password = RS_result.getString("password");
		if (id1.equals(password)&&id.equals(username)){
			check=false;
			response.sendRedirect("student_information.jsp");
			}
		}
	if(check) response.sendRedirect("login.jsp");
	stmt.close();
	conn.close();
	}
%>
</body>
</html>