<%@page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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
     String job_id=request.getParameter("target_id");
    // int user_id=Integer.parseInt(request.getParameter("user_id"));

     // int bean_count=Integer.parseInt(request.getParameter("bean_count"));
    // int status=Integer.parseInt(request.getParameter("status"));
      String date8=request.getParameter("date8");
      String env = request.getParameter("env");//环境

     String className="com.mysql.jdbc.Driver";

    Class.forName(className);

   	Connection conn = null;
	  if (env.equals("kaifa")) {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.1.31:3306/boss_business", "boss", "boss");
		} else if (env.equals("qa")) {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.1.26:3306/boss_business", "boss_qa","boss_qa");
		}

  Statement st;

//String sql="INSERT INTO user_bean_bag(id,user_id,bean_count,status,add_time,update_time) VALUES('"+id+"','"+user_id+"','"+bean_count+"','"+status+"','"+add_time+"','"+update_time+"')";
String sql="update job_top_card_used set date8='"+date8+"' where target_id='"+job_id+"'";
//st.executeupdate(sql);

 st = (Statement) conn.createStatement();    // 创建用于执行静态sql语句的Statement对象   
int count = st.executeUpdate(sql);  // 执行插入操作的sql语句，并返回插入数据的个数   

if(count>0)

    {
	request.setAttribute("module","profile");
	request.getRequestDispatcher("success.jsp").forward(request, response);
 
    }                   
   
   conn.close();   //关闭数据库连接   

 
 
 


%>


</body>

</html>