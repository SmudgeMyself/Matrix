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
<style>
body{
background-image:url("background.png");
background-size:1366px 768pxx;
}

</style>
<meta http-equiv="Content-Type" content="text/html;charset="UTF-8">
<title>管理员页面</title>
<link rel="icon" type="image/x-icon" href="link.png">
</head>
<body>
<img class="img-responsive" style="max-width: 100%;height: auto;" src="login_logo.png">
		<button type="button" style="position:absolute;background-color:#86A697;border-radius:30px;font-weight:900;top:20px;width:100px;left:200px;" onclick="show_information()">显示学生信息</button>
		<button type="button" style="position:absolute;background-color:#86A697;border-radius:30px;font-weight:900;top:20px;width:100px;left:350px;" onclick="show_add()">新增学生信息</button>
		<button type="button" style="position:absolute;background-color:#86A697;border-radius:30px;font-weight:900;top:20px;width:100px;left:500px;" onclick="show_delete()">删除学生信息</button>
		<button type="button" style="position:absolute;background-color:#86A697;border-radius:30px;font-weight:900;top:20px;width:100px;left:650px;" onclick="show_search()">查询学生信息</button>
		<a href="login.jsp" ><button style="position:absolute;background-color:#86A697;border-radius:30px;font-weight:900;top:20px;width:100px;left:800px;">返回登录页面</button></a>
	<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/world?"+"user=root&password=123456&serverTimezone=GMT%2B8");
Statement stmt =conn.createStatement();
%>
	<form id="form_delete" style="display: none;"
		action="student_information.jsp" method="get">
		<div align="center">
			<table border="2">
				<tr align="center">
					<td>学号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>籍贯</td>
					<td>民族</td>
					<td>专业</td>
					<td>选中</td>
				</tr>
				<%request.setCharacterEncoding("UTF-8");
String sql1="select* from no1";
ResultSet RS_result1=stmt.executeQuery(sql1);
while(RS_result1.next())
{
	String number1 = RS_result1.getString("number"); 
	String password1 = RS_result1.getString("password");
	String name1 = RS_result1.getString("name"); 
	String sex1 = RS_result1.getString("sex"); 
	String address1 = RS_result1.getString("address"); 
	String nation1 = RS_result1.getString("nation");
	String profession1=RS_result1.getString("profession");%>
				<tr align="center">
					<td><%=number1%></td>
					<td><%=name1%></td>
					<td><%=sex1 %></td>
					<td><%=address1%></td>
					<td><%=nation1%></td>
					<td><%=profession1%></td>
					<td><input type="checkbox" name=<%=number1%>></td>
				</tr>
				<%}%>
			</table>
			<input type="submit" style="width: 100px" value="删除"
				onclick="winclose()" />
		</div>
	</form>
	<%
Enumeration paramNames = request.getParameterNames();
while(paramNames.hasMoreElements()){
	String paramnumber = (String)paramNames.nextElement();
	if(paramnumber!=null){
		paramnumber=new String(paramnumber.getBytes("ISO8859_1"),"utf-8");
		}//很重要将取到的name进行中文转换
	String paramValue_delete_on = request.getParameter(paramnumber);
		String sql2="delete from no1 WHERE (number= '"+paramnumber+ "')";
		try {
			stmt.execute(sql2);
			}catch(Exception e) {
				e.printStackTrace();
				}
		}
%>

	<table id="table1" style="display: none;" border="2">
	<div align="center">
		<tr align="center">
			<td>学号</td>
			<td>姓名</td>
			<td>性别</td>
			<td>籍贯</td>
			<td>民族</td>
			<td>专业</td>
		</tr>
		<% 
ResultSet RS_result2=stmt.executeQuery(sql1);
while(RS_result2.next())
{
	String number2 = RS_result2.getString("number"); 
	String password2 = RS_result2.getString("password");
	String name2 = RS_result2.getString("name"); 
	String sex2 = RS_result2.getString("sex"); 
	String address2 = RS_result2.getString("address"); 
	String nation2 = RS_result2.getString("nation");
	String profession2=RS_result2.getString("profession");
%>
		<tr align="center">
			<td><%=number2%></td>
			<td><%=name2%></td>
			<td><%=sex2%></td>
			<td><%=address2%></td>
			<td><%=nation2%></td>
			<td><%=profession2%></td>
		</tr>
		<% }%>
		</div>
	</table>

	<form id="form_update" style="display: none;"
		action="student_information.jsp" method="post">
		<div style="position: absolute; left:545px; top: 200px;">
			<input type="text" name="number3" placeholder="请输入学生学号"><br />
			<input type="text" name="score3" placeholder="请输入学生成绩"><br />
			<input style="position: absolute; left:60px; top: 50px;" type="submit" style="width: 100px" value="更改">
		</div>
	</form>
	<%-- <% 
String number3=request.getParameter("number3");
String score3=(String)request.getParameter("score3");
String sql3="UPDATE no1 SET score ='" +score3+ "'WHERE (number = '"+number3+ "')";
try {
	if(number3!=null&&number3!=""){
		stmt.execute(sql3);
	}
}catch(Exception e) {
		e.printStackTrace();
		}
%>
 --%>
	<form id="form_add" style="display: none;"
		action="student_information.jsp" method="post">
		<div style="position:absolute;left:550px;top:200px;">
			<input type="text" name="number4" placeholder="请输入学生学号"><br />
			<input type="text" name="password4" placeholder="请输入学生密码"><br />
			<input type="text" name="name4" placeholder="请输入学生姓名"><br />
			<select name="sex4" style="width: 150px; height: 30px;">
				<option>男</option>
				<option>女</option>
			</select><br /> <input type="text" name="address4" placeholder="请输入学生籍贯"><br />
			<input type="text" name="nation4" placeholder="请输入学生民族"><br />
			<input type="text" name="profession4" placeholder="请输入学生专业"><br />
			<input type="submit" style="width: 100px" value="确定">
		</div>
	</form>
	<%
String number4=request.getParameter("number4");
String password4=request.getParameter("password4");
String name4=request.getParameter("name4");
String sex4=request.getParameter("sex4");
String address4=request.getParameter("address4");
String nation4=request.getParameter("nation4");
String profession4=request.getParameter("profession4");
String sql4 = "insert into no1( number, password,name,sex,address,nation,profession) values('"+number4+"','"+password4+ "','"+name4+ "','"+sex4+ "','"+address4+"','"+nation4+"','"+profession4+"')";
try {
	if(password4!=null&&password4!=""){
		stmt.execute(sql4);
	}
}catch(Exception e) {
		e.printStackTrace();
		}
%>
	<form id="form_search" style="display: none;"
		action="student_information.jsp" method="post">
		<input type="text" style="position:absolute;left:500px;top:200px;width:100px" name="number6" placeholder="请输入学生学号"> <input
			type="submit" style="position:absolute;left:650px;top:200px;width: 50px" value="查询">
	</form>
	<div align="center">
	<table id="table2" border="1" align="center" style="width:40%;position:absolute;left:350px;top:50px;">
		<% 
String number6=request.getParameter("number6");
String sql6="select * from no1 where number ='"+number6+"'";
ResultSet RS_result3=stmt.executeQuery(sql1);
while(RS_result3.next())
{

	String number_search = RS_result3.getString("number");
	String name_search = RS_result3.getString("name");
	String sex_search = RS_result3.getString("sex"); 
	String address_search  = RS_result3.getString("address"); 
	String nation_search  = RS_result3.getString("nation");
	String profession_search =RS_result3.getString("profession");
	if(number_search.equals(number6)){%>
		<tr align="center">
			<td>学号</td>
			<td>姓名</td>
			<td>性别</td>
			<td>籍贯</td>
			<td>民族</td>
			<td>专业</td>
		</tr>
		<tr align="center">
			<td><%=number_search%></td>
			<td><%=name_search%></td>
			<td><%=sex_search%></td>
			<td><%=address_search%></td>
			<td><%=nation_search%></td>
			<td><%=profession_search%></td>
		</tr>
		<%}
}%>
	</table>
	</div>
	<%
stmt.close();
conn.close();
%>

	<script>

function show_delete(){
	table1.style="display:none;";
	form_add.style="display:none;";
	form_delete.style="width:40%;position:absolute;left:350px;top:50px;";
	form_update.style="display:none;";
	form_search.style="display:none;";
	table2.style="display:none;";
}
function show_update(){
	table1.style="width:40%;position:absolute;left:350px;top:50px;";
	form_add.style="display:none;";
	form_delete.style="display:none;";
	form_update.style="";
	form_search.style="display:none;";
	table2.style="display:none;";
}
function show_add(){
	table1.style="width:40%;position:absolute;left:350px;top:50px;";
	form_add.style="";
	form_delete.style="display:none;";
	form_update.style="display:none;";
	form_search.style="display:none;";
	table2.style="display:none;";
}
function show_information(){
	table1.style="width:40%;position:absolute;left:350px;top:50px;";
	form_add.style="display: none;";
	form_delete.style="display:none;";
	form_update.style="display:none;";
	form_search.style="display:none;";
 	table2.style="display:none;";
 }
function show_search(){
	table1.style="display:none";
	form_add.style="display: none;";
	form_delete.style="display:none;";
	form_update.style="display:none;";
	form_search.style="";
 	table2.style="display:none;";
 }
</script>
</body>
</html>