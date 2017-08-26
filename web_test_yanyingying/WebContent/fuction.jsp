<%@page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
	String path = request.getContextPath();

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTMLPUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<base href="<%=basePath%>">

<title>My JSP 'fuction.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">

<meta http-equiv="cache-control" content="no-cache">

<meta http-equiv="expires" content="0">

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">

<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>

<body>

	<%
		//int id=Integer.parseInt(request.getParameter("id"));
		//int id=request.getParameter("id");
		String user_id = request.getParameter("user_id");
		// int user_id=Integer.parseInt(request.getParameter("user_id"));
		String bean_count = request.getParameter("bean_count");
		// int bean_count=Integer.parseInt(request.getParameter("bean_count"));
		// int status=Integer.parseInt(request.getParameter("status"));
		// System.out.println("user_id====>"+user_id);
		String env = request.getParameter("env");//环境
	//	System.out.println("参数：[user_id=" + user_id + "]参数：[bean_count=" + bean_count + "]参数：[env=" + env + "]");
		//Date time = new Date();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//String add_time =sdf.format(time);

		// System.out.println("格式化后的日期：" + add_time);  
		//String update_time =sdf.format(datetime);
		//window.location.href="http://192.168.1.166:28080/test/interview/overtimenew.json?time=add_time";
		// Date date=new Date();
		// String add_time=request.getParameter("add_time");
		//String update_time=request.getParameter("update_time");
		//int roleID=Integer.parseInt(request.getParameter("bean_count"));

		String className = "com.mysql.jdbc.Driver";

		Class.forName(className);
		// String url="jdbc:mysql://localhost:3306/boss_business";
		//String user="root";
		//String password="";
		Connection conn = null;
		if (env.equals("kaifa")) {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.1.31:3306/boss_business", "boss", "boss");
		} else if (env.equals("qa")) {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.1.26:3306/boss_business", "boss_qa","boss_qa");
		}
		//Connection conn=DriverManager.getConnection("jdbc:mysql://192.168.1.31:3306/boss_business", "boss", "boss"); 

		Statement st;

		//Class.forName(className);
		//conn=DriverManager.getConnection(url, user, password);
		//String sql="INSERT INTO user_bean_bag(id,user_id,bean_count,status,add_time,update_time) VALUES('"+id+"','"+user_id+"','"+bean_count+"','"+status+"','"+add_time+"','"+update_time+"')";
		
		String sql = "update user_bean_bag set bean_count='" + bean_count + "' where user_id='" + user_id + "'";
		//st.executeupdate(sql);

		st = (Statement) conn.createStatement(); // 创建用于执行静态sql语句的Statement对象   

		int count = st.executeUpdate(sql); // 执行插入操作的sql语句，并返回插入数据的个数   

		if (count > 0)

		{

			response.sendRedirect("success.jsp");

		}

		conn.close(); //关闭数据库连接
	%>


</body>

</html>