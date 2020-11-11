<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生注册</title>
<link rel="icon" type="image/x-icon" href="link.png">
</head>
<style>
body {
	background-image: url("background.png");
	background-size: 1366px 768px;
}

h1 {
	position: absolute;
	top: 48px;
	width: 600px;
	left: 360px;
	"
}
</style>
<body>
	<img class="img-responsive" style="max-width: 100%; height: auto;"
		src="login_logo.png">
	<form action="login.jsp" method="post">
		<div align="center">
			<h1>欢迎用户注册</h1>
			<table border="4"
				style="border-radius: 5px; position: absolute; top: 120px; width: 600px; left: 360px;">
				<tr>
					<td>学号 ：</td>
					<td><input type="number" name="student_number2" />请输入学号</td>
				</tr>
				<tr>
					<td>密码 ：</td>
					<td><input type="password" name="student_password2" />由8~16位数字、字母、符号组成</td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="student_name2" />请输入姓名</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><select name="student_sex2" style="width: 150px;">
							<option>--请选择性别--</option>
							<option>男</option>
							<option>女</option>
					</select></td>
				</tr>
				<tr>
					<td>籍贯：</td>
					<td><select name="student_address2">
							<option value="">--请选择省份--</option>
							<option value="北京市">北京市</option>
							<option value="天津市">天津市</option>
							<option value="河北省">河北省</option>
							<option value="山西省">山西省</option>
							<option value="内蒙古自治区">内蒙古自治区</option>
							<option value="辽宁省">辽宁省</option>
							<option value="吉林省">吉林省</option>
							<option value="黑龙江省">黑龙江省</option>
							<option value="上海市">上海市</option>
							<option value="江苏省">江苏省</option>
							<option value="浙江省">浙江省</option>
							<option value="安徽省">安徽省</option>
							<option value="福建省">福建省</option>
							<option value="江西省">江西省</option>
							<option value="山东省">山东省</option>
							<option value="河南省">河南省</option>
							<option value="湖北省">湖北省</option>
							<option value="湖南省">湖南省</option>
							<option value="广东省">广东省</option>
							<option value="广西壮族自治区">广西壮族自治区</option>
							<option value="海南省">海南省</option>
							<option value="重庆市">重庆市</option>
							<option value="四川省">四川省</option>
							<option value="贵州省">贵州省</option>
							<option value="云南省">云南省</option>
							<option value="西藏自治区">西藏自治区</option>
							<option value="陕西省">陕西省</option>
							<option value="甘肃省">甘肃省</option>
							<option value="青海省">青海省</option>
							<option value="宁夏回族自治区">宁夏回族自治区</option>
							<option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
							<option value="香港特别行政区">香港特别行政区</option>
							<option value="澳门特别行政区">澳门特别行政区</option>
							<option value="台湾省">台湾省</option>
							<option value="其它">其它</option>
							<select></td>
				</tr>
				<tr>
					<td>民族：</td>
					<td><select name="student_nation2" style="width: 150px;">
							<option>--请选择民族--</option>
							<option value="汉族">汉族</option>
							<option value="蒙古族">蒙古族</option>
							<option value="回族">回族</option>
							<option value="藏族">藏族</option>
							<option value="维吾尔族">维吾尔族</option>
							<option value="苗族">苗族</option>
							<option value="彝族">彝族</option>
							<option value="壮族">壮族</option>
							<option value="布依族">布依族</option>
							<option value="朝鲜族">朝鲜族</option>
							<option value="满族">满族</option>
							<option value="侗族">侗族</option>
							<option value="瑶族">瑶族</option>
							<option value="白族">白族</option>
							<option value="土家族">土家族</option>
							<option value="哈尼族">哈尼族</option>
							<option value="哈萨克族">哈萨克族</option>
							<option value="傣族">傣族</option>
							<option value="黎族">黎族</option>
							<option value="傈僳族">傈僳族</option>
							<option value="佤族">佤族</option>
							<option value="畲族">畲族</option>
							<option value="高山族">高山族</option>
							<option value="拉祜族">拉祜族</option>
							<option value="水族">水族</option>
							<option value="东乡族">东乡族</option>
							<option value="纳西族">纳西族</option>
							<option value="景颇族">景颇族</option>
							<option value="柯尔克孜族">柯尔克孜族</option>
							<option value="土族">土族</option>
							<option value="达斡尔族">达斡尔族</option>
							<option value="仫佬族">仫佬族</option>
							<option value="羌族">羌族</option>
							<option value="布朗族">布朗族</option>
							<option value="撒拉族">撒拉族</option>
							<option value="毛南族">毛南族</option>
							<option value="仡佬族">仡佬族</option>
							<option value="锡伯族">锡伯族</option>
							<option value="阿昌族">阿昌族</option>
							<option value="普米族">普米族</option>
							<option value="塔吉克族">塔吉克族</option>
							<option value="怒族">怒族</option>
							<option value="乌孜别克族">乌孜别克族</option>
							<option value="俄罗斯族">俄罗斯族</option>
							<option value="鄂温克族">鄂温克族</option>
							<option value="德昂族">德昂族</option>
							<option value="保安族">保安族</option>
							<option value="裕固族">裕固族</option>
							<option value="京族">京族</option>
							<option value="塔塔尔族">塔塔尔族</option>
							<option value="独龙族">独龙族</option>
							<option value="鄂伦春族">鄂伦春族</option>
							<option value="赫哲族">赫哲族</option>
							<option value="门巴族">门巴族</option>
							<option value="珞巴族">珞巴族</option>
							<option value="基诺族">基诺族</option>
					</select></td>
				</tr>
				<tr>
					<td>专业：</td>
					<td><input type="text" name="student_profession2" />请输入专业名称</td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="注册" name="submit" />
						<input type="reset" value="重置" name="reset" /></td>
				</tr>
			</table>
			<a href="login.jsp"
				style="border-radius: 5px; position: absolute; top: 380px; width: 600px; left: 360px;"><button>返回登录页面</button></a>
		</div>
	</form>
	<script>
function login_window(){
	window.open("login.jsp");
}
</script>
</body>
</html>