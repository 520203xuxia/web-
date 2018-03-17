<%@ page language="java" import="java.util.*,java.sql.*,javax.servlet.*,java.io.*,java.text.*,java.util.Date" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>                                 
  <head>
    <title>网上银行管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
<link href="https://cdn.bootcss.com/zui/1.7.0/css/zui.css" rel="stylesheet">
<!-- <link href="css/my.css" rel="stylesheet"> -->
<link href="css/animate.css" rel="stylesheet">
</head> 
<body>
<%	
response.setContentType("text/html;charset=utf-8");
	String info="";
	try{
		info=request.getParameter("info");	
		if(info==null)
		{
			info="";
		}
		else if(info.equals("codeerror"))
		{
			info="验证码错误！";
		}
		else if(info.equals("iderror"))
		{
			info="该用户已注册！";
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
      <a class="navbar-brand" href="#">Bank 网上银行管理系统</a>
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
<div class="col-sm-4 right_box" >
	<h3>欢迎注册</h3>
	<form action="register" method="post"> 
			<div class="input-group  animated bounceInDown ">
				 <span class="input-group-addon"><i class="icon-phone"></i></span>
			     <input type="text" class="form-control input-lg" placeholder="身份证号" name="IDNumber">
			</div>
			<div style="color:red;height:20px " id="error_IDNumber"></div> 
			<div class="input-group  animated bounceInRight">			
					<span class="input-group-addon"><i class="icon icon-user"></i></span>
			        <input type="text" class="form-control input-lg" placeholder="用户名" name="username">			        					        		       
     		</div>
     		<div style="color:red;height:20px" id="error_username"></div>
     		<div class="input-group  animated bounceInLeft">
				 <span class="input-group-addon"><i class="icon-key"></i></span>
			     <input type="password" class="form-control input-lg" placeholder="密码" name="passwd">
			</div>
			<div style="color:red;height:20px " id="error_passwd"></div>
			<div class="input-group  animated bounceInRight">
				 <span class="input-group-addon"><i class="icon-key"></i></span>
			     <input type="password" class="form-control input-lg" placeholder="确认密码" name="passwdagain">
			</div>
			<div style="color:red;height:20px " id="error_passwdagain"></div>
			<div class="input-group  animated bounceInLeft">
				 <span class="input-group-addon"><i class="icon-envelope"></i></span>
			     <input type="email" class="form-control input-lg" placeholder="邮箱" name="email">
			</div>
			<div style="color:red;height:20px " id="error_email"></div>			
			<div>
				 <input type="text" class="input-lg" placeholder="验证码" name="code">
				 <img  id="code_name" border=0 src="validate.jsp" onclick="changecode()">
			</div>
			<div style="color:red;height:20px " id="error_code"></div>
			<div  class="animated bounceInUp">
				<input class="btn btn-block btn-primary input-lg" type="button" value="注册" onclick="Submit(this)">
			</div>
			<div style="color:red;height:20px" id="error"><% out.print(info); %></div>
			</form>
			<div class="animated bounceInUp">
				<a class="a_register" href="clientLogin.jsp">
					注册了？点击这里登录！
				</a>
			</div>			
</div>
<div class="col-sm-1"></div>
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
  <script src="https://cdn.bootcss.com/zui/1.7.0/js/zui.js"></script>
  <script src="js/my.js" type="text/javascript"></script>
 <script>
 function Submit(obj)
	{
		var error=document.getElementById("error");
	  	if(error.innerText=="注册成功！")
	  	{
	  		error.style.color="green";
	  	}
	  	else
	  		error.style.color="red";		
		var form=obj.parentNode.parentNode;

		if(form.IDNumber.value==""){
			document.getElementById("error_IDNumber").innerHTML="身份证号不能为空！";
			return false;
		}
		else{
			 var regTel1 = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(form.IDNumber.value);
      		 if(!regTel1)
      		 {
			 	document.getElementById("error_IDNumber").innerHTML="身份证输入有误！";
			 	return false;
			 }
			 else
			 	document.getElementById("error_IDNumber").innerHTML="";
		}
		if(form.username.value==""){
			document.getElementById("error_username").innerHTML="用户名不能为空！";
			return false;
		}
		else{
			var all = /^[\u4E00-\u9FA5]{2,10}$/;
			if(!all.test(form.username.value))
			{
				document.getElementById("error_username").innerHTML="用户名只能由汉字组成！";
				return false;
			}
			else
				document.getElementById("error_username").innerHTML="";
		}
		if(form.passwd.value==""){
			document.getElementById("error_passwd").innerHTML="密码不能为空！";
			return false;
		}
		else
		{
			var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(form.passwd.value))
			{
				document.getElementById("error_passwd").innerHTML="密码只能由字母、数字、下划线组成的6-20个字符！";
				return false;
			}
			else
				document.getElementById("error_passwd").innerHTML="";
		}
		if(form.passwdagain.value==""){
			document.getElementById("error_passwdagain").innerHTML="确认密码不能为空！";
			return false;
		}
		else{
			document.getElementById("error_passwdagain").innerHTML="";
			if(form.passwd.value!=form.passwdagain.value){
					document.getElementById("error").innerHTML="两次输入密码不一致！";				
					return false;
				}
		}
		if(form.email.value==""){
			document.getElementById("error_email").innerHTML="邮箱不能为空！";
			return false;
		}
		else{
			var pattern= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;  
        	var  strEmail=pattern.test(form.email.value);
        	if(!strEmail)
        	{
        		document.getElementById("error_email").innerHTML="邮箱无效！";
        		return false;
        	}
        	else
        	{
        		document.getElementById("error_email").innerHTML="";
        	}
			
		}		
		if(form.code.value==""){
			document.getElementById("error_code").innerHTML="验证码不能为空！";
			return false;
		}
		else{
			var patrn=/^[0-9]{4}$/;
			if(!patrn.test(form.code.value))
			{
				document.getElementById("error_code").innerHTML="验证码只能为四位数字";
				return false;
			}
			else
				document.getElementById("error_code").innerHTML="";
		}
		form.submit();		
	}	</script>
  </body>
</html>
