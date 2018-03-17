<%@ page language="java" import="java.util.*,java.sql.*,javax.servlet.*,java.io.*,java.text.*,java.util.Date,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>网上银行管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="https://cdn.bootcss.com/zui/1.7.0/css/zui.css" rel="stylesheet"> 
	<!-- <link href="css/my.css" rel="stylesheet"> -->
	<link href="css/animate.css" rel="stylesheet">
</head> 
 <body>
<%
			String error="";	
			String username="";
			String passwd="";
			Cookie cookie=null;
			Cookie []cookies=request.getCookies();
			try{			
				 error =request.getParameter("info");
				 if(error==null)
				 	error="";
				 else if(error.equals("codeerror"))
				 {
				 	error="验证码错误！";
				 }
				 else if(error.equals("error"))
				 {
				 	error="账号或密码错误！";
				 }
				 if(cookies!=null)
				 {
				 	for(int i=0;i<cookies.length;i++)
				 	{
				 		cookie=cookies[i];
				 		if(cookie.getName().equals("counterusername"))
				 		{
				 			username =new String(URLDecoder.decode(cookie.getValue()).getBytes("iso-8859-1"),"utf-8");				          	
				 		}
				 		if(cookie.getName().equals("counterpasswd"))
				 		{
				 			passwd= new String(URLDecoder.decode(cookie.getValue()).getBytes("iso-8859-1"),"utf-8");
				 		}
				 	}
				 }
				 
				 				 
			}catch(Exception e){}
		%>
  
   <nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <!-- 导航头部 -->
    <div class="navbar-header">
      <!-- 移动设备上的导航切换按钮 -->
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-example">
        <span class="sr-only">切换导航</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- 品牌名称或logo -->
      <a class="navbar-brand" href="your/nice/url">Bank 网上银行管理系统</a>
    </div>
    <!-- 导航项目 -->
    <div class="collapse navbar-collapse navbar-collapse-example">
      <!-- 一般导航项目 -->
      <ul class="nav navbar-nav">
        <li class="active"><a href="javascript:;">项目</a></li>
        <li><a href="javascript:;">需求</a></li>
        <!-- 导航中的下拉菜单 -->
        <li class="dropdown">
          <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">管理 <b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="javascript:;">任务</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- END .navbar-collapse -->
  </div>
</nav>
<div class="col-sm-1"></div>
<div class="col-sm-6">
<img src="images/img1.png">
</div> 
<div class="panel col-sm-4 login_box">
  <div class="panel-body">
		<form action="counterLogin" method="post">
			<div class="input-group  animated bounceInDown">
		        <span class="input-group-addon"><i class="icon-user"></i></span>
		        <input type="text" class="form-control input-lg" name="username" placeholder="柜员ID" value=<% out.print(username); %>>		       
     		</div>
     		<div style="color:red;height:20px " id="error_username"></div>
     		<div class="input-group animated bounceInLeft">
				 <span class="input-group-addon"><i class="icon-key"></i></span>
			     <input type="password" class="form-control input-lg" name="passwd" placeholder="密码" value=<% out.print(passwd); %>>
			</div>
			<div style="color:red;height:20px " id="error_passwd"></div>			
			<div>
				 <input type="text" class=" input-lg" placeholder="验证码" name="code"/>
				 <img  id="code_name" border=0 src="validate.jsp" onclick="change()">
			</div>			
			<div style="color:red;height:20px" id="error_code"><% out.print(error); %></div>
			<lable><input type="checkbox" name="remember_count"/>记住用户名</lable>
			<div class="animated bounceInUp">
				<input class="btn btn-block btn-primary input-lg" type="button" value="登录"  onclick="Submit(this)">
			</div>
			<div style="color:red;height:20px " id="error"></div>
		</form>	
  </div>
</div>
<div class="col-sm-1">		
</div>
   <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
  <script src="https://cdn.bootcss.com/zui/1.7.0/js/zui.js"></script>
	<script>
  	function change()
  	{
  		var img=document.getElementById("code_name");
  		var time=new Date().getTime();
  		img.src="validate.jsp?time="+time;
  		
  	}
  	function Submit(obj)
	{
		var form=obj.parentNode.parentNode;
		if(form.username.value==""){
			document.getElementById("error_username").innerHTML="柜员ID不能为空！";
			return false;
		}
		else{
			document.getElementById("error_username").innerHTML="";
		}
		if(form.passwd.value==""){
			document.getElementById("error_passwd").innerHTML="密码不能为空！";
			return false;
		}
		else{
			document.getElementById("error_passwd").innerHTML="";
		}
		
		if(form.code.value==""){
			document.getElementById("error_code").innerHTML="验证码不能为空！";
			return false;
		}
		else{
			document.getElementById("error_code").innerHTML="";
		}
		form.submit();
	
	}  	
  </script>
  </script>
  </body>
</html>
