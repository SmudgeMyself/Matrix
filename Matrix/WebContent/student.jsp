<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学籍信息查询</title>
<link rel="icon" type="image/x-icon" href="link.png">
</head>
<style>
body{
background-image:url("background.png");
background-size:1366px 768px;
}
</style>
<body>
<img class="img-responsive" style="max-width: 100%;height: auto;" src="login_logo.png">
<%
String id1=new String(request.getParameter("number"));
if(id1!=null){
id1=new String(id1.getBytes("ISO8859_1"),"utf-8");      
 } 
Class.forName("com.mysql.jdbc.Driver");
Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/world?"+"user=root&password=123456&serverTimezone=GMT%2B8");
Statement stmt =conn.createStatement();
String sql1="select * from no1 where number ='"+id1+"'";
ResultSet RS_result=stmt.executeQuery(sql1);
while(RS_result.next())
{
	String number = RS_result.getString("number"); 
	String name = RS_result.getString("name"); 
	String sex = RS_result.getString("sex"); 
	String address = RS_result.getString("address"); 
	String nation = RS_result.getString("nation");
	String profession=RS_result.getString("profession");%>
<div align="center">
<table id="table1" border="2" style="width:40%">
<tr align="center"><td>学号</td><td>姓名</td><td>性别</td><td>籍贯</td><td>民族</td><td>专业</td></tr>
<tr align="center"><td><%=number%></td><td><%=name%></td><td><%=sex%></td><td><%=address%></td><td><%=nation%></td><td><%=profession%></td></tr>
</table>
</div>
<div align="center">
<a href="login.jsp"><button style="width:20%">返回登录页面</button></a>
</div>
 <%}%>
<%
stmt.close();
conn.close();
%>
</body>
</html>
