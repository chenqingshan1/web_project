<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String modules = request.getParameter("module");

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
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<style>
	.table {
		width: 500px;
	}
	
	.table th {
		text-align: center;
	}
	
	.nav-tabs {
		width: 200px;
		float: left;
	}
	
	.nav-tabs > li {
		float: none;
	}
	
	.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
		background: #ccc;
	}
	
	.tab-content {
		margin-top: 40px;
	}
	
	.tab-content {
	    margin-left: 200px;
	}
</style>
<script>
	$(function() {
		console.log("index.jsp--input[name=module]===>"+$('input[name=module]').val());
		console.log("index.jsp--input===><%=modules %>");
		var m = '<%=modules %>';
		if (m!='null') {
			console.log("m===>"+m);
			$('a[aria-controls='+m+']').tab('show');
		 }
		if ($('input[name=module]').val()!='') {
			console.log("input===>"+$('input[name=module]').val());
			$('a[aria-controls=' + $('input[name=module]').val() + ']').tab('show');
		 }
		if (m=='null' && $('input[name=module]').val()=='') {
			$('a[aria-controls=home]').tab('show');
		 }
		
	});
</script>
</head>
<body>
	<input type="hidden" name="module" value="${module}">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">测试环境加直豆</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">修改置顶卡日期</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">获取验证码</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">处理火爆职位任务</a></li>
    <li role="presentation"><a href="#page1" aria-controls="page1" role="tab" data-toggle="tab">解除开启10个职位限制</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
		<form action="fuction.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
				<tr>
					<th colspan="2" align="center">测试环境加直豆</th>
				</tr>
				<tr>
					<td>环境：</td>
					<td>
						<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
						<label><input type="radio" name="env" value="kaifa" />开发环境</label>
					</td>
				</tr>
				<tr><td>user_id：</td><td><input type="text" style="border:0" name="user_id"/></td></tr>
				<tr><td>bean_count：</td><td><input type="text" style="border:0" name="bean_count"/></td></tr>
				<tr><td colspan="2" align="center"><input type="submit" value="添加"/></td></tr>
			</table>
		</form>
	</div>
    <div role="tabpanel" class="tab-pane" id="profile">
		<form action="fuction2.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
			<tr>
			    <th colspan="2" align="center">修改置顶卡日期</th>
			</tr>
			<tr>
				<td>环境：</td>
				<td>
					<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
					<label><input type="radio" name="env" value="kaifa" />开发环境</label>
				</td>
			</tr>
			<tr><td>job_id：</td><td><input type="text" style="border:0" name="target_id"/></td></tr>
			<tr><td>date(格式如20170704)：</td><td><input type="text" style="border:0" name="date8"/></td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="提交"/></td></tr>
			</table>
		</form>
	</div>
    <div role="tabpanel" class="tab-pane" id="messages">
		<form action="fuction1.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
			<tr><th colspan="2" align="center">获取验证码</th></tr>
			<tr>
				<td>环境：</td>
				<td>
					<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
					<label><input type="radio" name="env" value="kaifa" />开发环境</label>
				</td>
			</tr>
			<tr><td>输入手机号：</td><td><input type="text" style="border:0" name="iphonecode"/></td></tr>
			<tr><td>验证码：</td><td><input type="text" style="border:0" value="${txtname}"/></td></tr>
		    <tr><td colspan="2" align="center"><input type="submit" value="提交" target="navTab"/></td></tr>
			</table>
		</form>
	</div>
    <div role="tabpanel" class="tab-pane" id="settings">
		<form action="fuction3.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
			<tr><th colspan="2" align="center">更改指定职位的有效开始日期</th></tr>
			<tr>
				<td>环境：</td>
				<td>
					<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
					<label><input type="radio" name="env" value="kaifa" />开发环境</label>
				</td>
			</tr>
			<tr><td>输入职位id：</td><td><input type="text" style="border:0" name="jid"/></td></tr>
			<tr><td>date(格式如2017-07-04):</td><td><input type="text" style="border:0" name="date"/></td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="提交"/></td></tr>
			</table>
			</form>


			<form action="fuction4.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
			<tr><th colspan="2" align="center">处理火爆职位延长操作的任务</th></tr>
			<tr>
				<td>环境：</td>
				<td>
					<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
					<label><input type="radio" name="env" value="kaifa" />开发环境</label>
				</td>
			</tr>
			<tr><td>输入职位id：</td><td><input type="text" style="border:0" name="jobId"/></td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="提交"/></td></tr>
			</table>
			</form>

			<form action="fuction5.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
			<tr><th colspan="2" align="center">处理自动变为过期的任务</th></tr>
			<tr>
				<td>环境：</td>
				<td>
					<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
					<label><input type="radio" name="env" value="kaifa" />开发环境</label>
				</td>
			</tr>
			<tr><td>输入bossid：</td><td><input type="text" style="border:0" name="bossId"/></td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="提交"/></td></tr>
			</table>
		</form>
	</div>
	   <div role="tabpanel" class="tab-pane" id="page1">
		<form action="fuction6.jsp" method="post">
			<table width="400" align="center" border="1" cellpadding="0" cellspacing="0" class="table">
				<tr>
					<th colspan="2" align="center">解除开启10个职位限制</th>
				</tr>
				<tr>
					<td>环境：</td>
					<td>
						<label><input type="radio" name="env" value="qa" checked="checked"/>qa环境</label>
						<label><input type="radio" name="env" value="kaifa" />开发环境</label>
					</td>
				</tr>
				<tr>
				    <td> key(6453455_20170812)：</td>
				    <td>
				      <input type="text" style="border:0" name="key"/> 
				    </td>
				</tr>
				<tr><td colspan="2" align="center"><input type="submit" value="提交"/></td></tr>
			</table>
		</form>
	</div>
  </div>

</body>

</html>