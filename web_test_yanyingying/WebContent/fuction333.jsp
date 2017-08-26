<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String jid = request.getParameter("jid");
	String date = request.getParameter("date");
%>

<!DOCTYPE HTMLPUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<base href="<%=basePath%>">

<title>My JSP 'fuction1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">

<meta http-equiv="cache-control" content="no-cache">

<meta http-equiv="expires" content="0">

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery.min.js"></script>
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>
<script type="text/javascript">
	$(function() {

		submitFn();

	});

	function submitFn() {
		console.log("jid=<%= jid %>  date=<%= date %>");
		$.ajax({
			url : "http://192.168.1.166:28080/dealdata/resetExpireTime.json",
			data : {
				"jid" : "<%= jid %>",
				"date" : "<%= date %>"
			},
			dataType : "JSONP",
			success : function(data) {
				alert("修改成功！");
				window.location="index.jsp";
			},
			error: function(data) {
				alert('修改异常，请再次尝试');
				window.location="index.jsp";
			}
		});
	}
</script>
<body>
 <!--   添加成功！<a href="index.jsp">返回继续</a> -->

</body>

</html>