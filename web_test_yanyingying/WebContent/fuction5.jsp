<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLDecoder"%>  
<%@page import="org.apache.commons.httpclient.HttpClient"%>
<%@page import="org.apache.commons.httpclient.methods.PostMethod"%>

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
<script type="text/javascript" src="js/jquery.min.js"></script>
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>

<body>
<%
	String bossId=request.getParameter("bossId");
    bossId=URLDecoder.decode(bossId);   
//	System.out.println(jid);
//	System.out.println(date);
   String env = request.getParameter("env");//环境
	int responseCode = 0;  
   String url=null;
     try {  
    	 if (env.equals("kaifa")) {
    		 url =  "http://192.168.1.166:28080/dealdata/testAutoClose.json"; 
             HttpClient client = new HttpClient();  
             PostMethod postMethod = new PostMethod(url);  
             postMethod.addParameter("bossId",bossId);
             responseCode = client.executeMethod(postMethod); 
 		} else if (env.equals("qa")) {
 			  url = "http://192.168.1.22:28080/dealdata/testAutoClose.json"; 
             HttpClient client = new HttpClient();  
             PostMethod postMethod = new PostMethod(url);  
             postMethod.addParameter("bossId",bossId);
             responseCode = client.executeMethod(postMethod); 
 		}
      
         if (responseCode == 200) {  
        //     String callBackString = postMethod.getResponseBodyAsString();  
         //    System.out.println("请求返回结果为:" + URLDecoder.decode(callBackString));  
        		request.setAttribute("module","settings");
        		request.getRequestDispatcher("success.jsp").forward(request, response);
         } else {  
         }  
     } catch (Exception e) {  
         e.printStackTrace();  
     }  
   //  System.out.println("网页代码" + responseCode);  
%>

</body>

</html>