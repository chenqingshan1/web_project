<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

 

<!DOCTYPE HTMLPUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<base href="<%=basePath%>">

 

<title>测试环境修改数据</title>

<meta http-equiv="pragma" content="no-cache">

<meta http-equiv="cache-control" content="no-cache">

<meta http-equiv="expires" content="0">

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">

<!--www.mwcly.cn

<link rel="stylesheet" type="text/css" href="styles.css">

-->
</head>
<body>

<form action="fuction.jsp" method="post">
<table width="400" align="center" border="1" cellpadding="0" cellspacing="0">
<tr><td colspan="2" align="center">测试环境加直豆</td></tr>
<tr>
	<td>环境：</td>
	<td>
		<label><input type="radio" name="test" value="kaifa" />开发环境</label>
		<label><input type="radio" name="test" value="qa" />qa环境</label>
	</td>
</tr>
<tr><td>user_id：</td><td><input type="text" style="border:0" name="user_id"/></td></tr>
<tr><td>bean_count：</td><td><input type="text" style="border:0" name="bean_count"/></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="添加"/></td></tr>
</table>
</form>



</body>

</html>