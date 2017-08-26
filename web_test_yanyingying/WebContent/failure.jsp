<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

 

<!DOCTYPE HTMLPUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<base href="<%=basePath%>">

 

<title>My JSP 'success.jsp' starting page</title>

 

<meta http-equiv="pragma" content="no-cache">

<meta http-equiv="cache-control" content="no-cache">

<meta http-equiv="expires" content="0">

<meta http-equiv="keywords" content="www.mwcly.cn,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<!--

<link rel="stylesheet" type="text/css" href="styles.css">

-->

 <script type="text/javascript">
	$(function() {
		console.log("failure.jsp---input[name=module]===>"
				+ $('input[name=module]').val());
	});
	
	function redirectFn123() {
		var moudle = $('input[name=module]').val();
		console.log("failure.jsp---onclick---moudle===>"+moudle);

	}
</script>

</head>

 

<body>

	<form action="index.jsp" method="post">
		<input type="hidden" name="module" value="${module}">
		<table width="400" align="center" border="0" cellpadding="0"
			cellspacing="0" class="table">
			<tr> 请先发送验证码！
			</tr>
			<tr>
				 <input type="submit" value="返回继续" /> 
			</tr>
		</table>
	</form>

<!--
 请先发送验证码！<a href="index.jsp">返回继续</a>
-->


</body>

</html>