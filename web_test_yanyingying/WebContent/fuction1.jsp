<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="web_test.*"%>
<%@page import="java.io.IOException"%>
<%@page import="ch.ethz.ssh2.StreamGobbler.*"%>


<%
	String path = request.getContextPath();

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>

<body>

	<%
 		String usr = null;
		String password = null;
		String serverIP = null;
		String shPath = null;
		RmtShellExecutor exe = null;
		String env = request.getParameter("env");//环境
		if (env.equals("kaifa")) {
			usr = "chenqingyun";
			password = "chenqingyun";
			serverIP = "192.168.1.166";
			shPath = "/data1/tomcat4bossmcs/logs/mcp/boss_info.log";
			exe = new RmtShellExecutor(serverIP, usr, password);
		} else if (env.equals("qa")) {
			usr = "yanyingying";
			password = "Boss@123qa";
			serverIP = "192.168.1.22";
			shPath = "/data/tomcat4bossmcs/logs/mcp/boss_info.log";
			exe = new RmtShellExecutor(serverIP, usr, password);
		}
		System.out.println(shPath);
		String outInf;
		String iphonecode = request.getParameter("iphonecode");
		//String module =request.getParameter("module");

		try {
			//outInf = exe.exec("sh " + shPath + " xn");
			outInf = exe.exec("grep 'activeCode' " + shPath + " | grep " + iphonecode + " | tail -1"); //查最后一个
			// System.out.println("outInf= " + outInf);
			if (!outInf.isEmpty()) {
				int index = outInf.indexOf("="); //获取出现key字符串的第一个位置，这里要保证前面没有跟KEY重复
				// String left = s.substring(index) 截取KEY出现位置前面的字符串
				String b = outInf.substring(index + 1, index + 5); //截取后==后的4位数字

				System.out.println("outInf= " + b);
				request.setAttribute("txtname", b);
				request.setAttribute("module", "messages");
				request.getRequestDispatcher("index.jsp").forward(request, response); //返回到首页
			} else {
				//response.sendRedirect("failure.jsp");
				request.setAttribute("module","messages");
				request.getRequestDispatcher("failure.jsp").forward(request, response); //返回获取验证码 页面
			}
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("module","messages");
			request.getRequestDispatcher("failure.jsp").forward(request, response);
		} 
		

	%>


</body>

</html>