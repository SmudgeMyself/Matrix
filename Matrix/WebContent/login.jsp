<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
 <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
background-image:url("background.png");
background-size:1366px 768px;
}
#student{
position:absolute;top:260px;width:85px;left:670px;
}
#admin{
position:absolute;top:260px;width:85px;left:755px;
}
#Username1,#Username2{
position:absolute;left:670px;top:200px;
}
#Password1,#Password2{
position:absolute;left:670px;top:230px;
}
#a,#d{
position:absolute;left:670px;top:300px;width:50px;height:30px
}
#c{
position:absolute;left:730px;top:300px;width:50px;height:30px
}
#b,#e{
position:absolute;left:790px;top:300px;width:50px;height:30px
}
</style>
<meta charset="UTF-8">
<title>学生学籍登录</title>
<link rel="icon" type="image/x-icon" href="link.png">
</head>
<body>
<img class="img-responsive" style="max-width: 100%;height: auto;" src="login_logo.png">
<img class="img-responsive" style="max-width: 100%;height: auto;" src="login_icon.png">
<button type="button" id="student" onclick="student_login()">学生登录</button>
<button type="button" id="admin" onclick="admin_login()">管理员登录</button>

<form id="studentform" align="center"  style="" action="login.jsp" method="post">
<input type="text" id="Username1" name="student_number1"  placeholder="请输入学生学号" />
<input type="password" id="Password1" name="student_password1" placeholder="请输入学生密码"/>
<input type="submit" id="a" value="登录">
<input type="reset" id="b" value="清空">
<button id="c" onclick="open_register()">注册</button>
</form>

<form id="adminform"  align="center"  style="display: none;" action="adminlogin.jsp" method="post">
<input type="text" id="Username2" name="username2"  placeholder="请输入管理员用户名" />
<input type="password" id="Password2" name="password2" placeholder="请输入管理员密码"/>
<input type="submit" id="d" value="登录">
<input type="reset" id="e" value="清空">
</form>
<%
String student_number1=request.getParameter("student_number1");
String student_password1=request.getParameter("student_password1");
String student_number2=request.getParameter("student_number2");
String student_password2=request.getParameter("student_password2");

String student_name2=request.getParameter("student_name2");
String student_sex2=request.getParameter("student_sex2");
String student_address2=request.getParameter("student_address2");
String student_nation2=request.getParameter("student_nation2");
String student_profession2=request.getParameter("student_profession2");

if(student_password1!=null){
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn =DriverManager.getConnection
("jdbc:mysql://localhost:3306/world?"+"user=root&password=123456&serverTimezone=GMT%2B8");
Statement stmt =conn.createStatement();
//登录
String sql1="select password from no1 where number ='"+student_number1+"'";
ResultSet RS_result=stmt.executeQuery(sql1);
String password;
while(RS_result.next()){
	password = RS_result.getString("password");
	if (student_password1.equals(password)) {
		response.sendRedirect("student.jsp?number=" + student_number1);
    }
 }
//注册学生姓名==学生用户名
String sql2 = "insert into no1(number,password,name,sex,address,nation,profession) values('" + student_number2 + "','" + student_password2 + "','"+student_name2+"','"+student_sex2+"','"+student_address2+"','"+student_nation2+"','"+student_profession2+"')";
try {
	if(student_password2!=null)
		stmt.execute(sql2);
	}catch(Exception e) {
		e.printStackTrace();
		}
stmt.close();
conn.close();
}
%>
<script>
function student_login(){
	studentform.style="";
	adminform.style="display: none;";
}
function admin_login(){
	studentform.style="display: none;";
	adminform.style="";
}
function open_register(){
	window.open("register.jsp");
}
</script>
</body>
</html>