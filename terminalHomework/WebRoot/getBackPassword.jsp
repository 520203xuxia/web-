<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    
    <title>密码找回</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="./assets/images/logo.png">
	<link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.css">
	<script type="text/javascript" src="./assets/js/jquery-1.12.4.js"></script>
	<style>
		html，body{
			height:100%;
			user-select:none;
		}
		img{
			display:inline-block;
			height:70px;
			margin-right:20px;
		}
		.header{
			background:#2f86f6;
			color:white;
			height:70px;
		}
		.title,.password{
			font-size:25px;
			padding-right:15px;
			vertical-align:middle;
			user-select:none;
		}
		.password{
			border-left:1px solid white;
			padding-left:20px;
		}
		.signIn,.signUp{
			display:table-cell;
			vertical-align:middle;			
		}
		.table{
			display:table;
			float:right;
			width:auto;
			height:100%;
		}
		.header>.container{
			height:100%;
		}
		.signIn > a,.signUp > a{
			padding:0 10px;
			color:white !important;
			user-select:none;
		}
		.signIn > a{
			border-right:1px solid white;
		}
		.header + .container{
			width:750px;
			margin-top:100px;
		}
		.userName,.email{
			position:relative;
			left:5px;
		/*	font-family:Times, serif;*/
			user-select:none;
		}
		.row{
			margin-bottom:20px;
			margin-top:5px;
		}
		.btn{
			border:none !important;
			outline:none !important;
		}	
		.form-control{
			font-family:Times, serif;
		}
		.loading{
			position:absolute;
			width:100%;
			height:100%;
			top:0;
			left:0;
			background:rgba(0,0,0,0.5);
			display:none;			
		}
		.circle{
			width:60px;
			height:60px;
			position:absolute;
			top:0;
			left:0;
			bottom:0;
			right:0;
			margin:auto;
			opacity:1;			
		}
		.circle:before{
			width:10px;
			height:10px;
			background:white;
			content:" ";
			position:absolute;
			top:0;
			left:0;
			border-radius:100%;
			opacity:0;
		}
		@keyframes opacity {
			0% {
				opacity:1;
			}
			50%{
				opacity:0;
			}
			100%{
				opacity:0;
			}
		}
		.deg0{
			
		}
		.deg30{
			transform:rotate(30deg);
			
		}
		.deg60{
			transform:rotate(60deg);
			
		}
		.deg90{
			transform:rotate(90deg);
			
		}
		.deg120{
			transform:rotate(120deg);
			
		}
		.deg150{
			transform:rotate(150deg);
			
		}
		.deg180{
			transform:rotate(180deg);
			
		}
		.deg210{
			transform:rotate(210deg);
			
		}
		.deg240{
			transform:rotate(240deg);
			
		}
		.deg270{
			transform:rotate(270deg);
			
		}
		.deg300{
			transform:rotate(300deg);
			
		}
		.deg330{
			transform:rotate(330deg);
			
		}
		.deg0:before{
			animation: opacity 1.2s infinite;
		}
		.deg30:before{
			animation: opacity 1.2s infinite 0.1s;
		}
		.deg60:before{
			animation: opacity 1.2s infinite 0.2s;
		}
		.deg90:before{
			animation: opacity 1.2s infinite 0.3s;
		}
		.deg120:before{
			animation: opacity 1.2s infinite 0.4s;
		}
		.deg150:before{
			animation: opacity 1.2s infinite 0.5s;
		}
		.deg180:before{
			animation: opacity 1.2s infinite 0.6s;
		}
		.deg210:before{
			animation: opacity 1.2s infinite 0.7s;
		}
		.deg240:before{
			animation: opacity 1.2s infinite 0.8s;
		}
		.deg270:before{
			animation: opacity 1.2s infinite 0.9s;
		}
		.deg300:before{
			animation: opacity 1.2s infinite 1.0s;
		}
		.deg330:before{
			animation: opacity 1.2s infinite 1.1s;
		}
		.deg360{
			display:none;
		}
		
	</style>
  </head>
  
  <body>

	<div class="header">
	  <div class="container">
		<img src="./assets/images/logo.png"><!-- end 网站logo -->
		<span class="title">Elearning安全中心</span>
		<span class="password">密码找回</span>
		<div class="table">
			<span class="signIn"><a href="./signIn.jsp" >登录</a></span>
			<span class="signUp"><a href="./signUp.jsp" > 注册</a></span>
		</div>
	  </div><!-- end container -->
	</div><!-- end header -->
	<div class="container">
		<span class="userName col-xs-offset-3 input-lg">用户名:</span>
		<div class="row"><!-- end row -->
			<div class="col-xs-6 col-xs-offset-3">
				<input type="text" class="form-control input-lg" spellcheck=false autocomplete=off id="userName">
			</div><!-- end col-xs-6 -->
		</div><!-- end row -->
		<span class="email col-xs-offset-3 input-lg">预留邮箱:</span>
		<div class="row">
			<div class="col-xs-6 col-xs-offset-3">
				<input type="text" class="form-control input-lg" id="email" spellcheck=false autocomplete=off id="email">
			</div>
		</div><!-- end row -->
		<div class="row">
			<div class="col-xs-6 col-xs-offset-3">
				<button type="button" class="btn btn-success btn-lg center-block">
					确定
				</button>
			</div><!-- end col-xs-6 -->
		</div><!-- end  row -->
	</div><!-- end container -->
	<div class="loading"><!-- 发送请求时的蒙板 -->
		<div class="circle deg0"></div>
		<div class="circle deg30"></div>
		<div class="circle deg60"></div>
		<div class="circle deg90"></div>
		<div class="circle deg120"></div>
		<div class="circle deg150"></div>
		<div class="circle deg180"></div>
		<div class="circle deg210"></div>
		<div class="circle deg240"></div>
		<div class="circle deg270"></div>
		<div class="circle deg300"></div>
		<div class="circle deg330"></div>
		<div class="circle deg360"></div>
	</div><!-- end loading -->	
	<script>
		var click=false;//发送请求的开关，避免用户短时内多次发送请求
		var xhr=new XMLHttpRequest();
		function sendRequest(){
			var userName=$("#userName").val();
			var email=$("#email").val();
			if(userName.trim()==""){
				window.alert("用户名不能为空");
				return;
			}
			if(email.trim()==""){
				window.alert("预留邮箱不能为空");
				return;
			}
			if(!click){
				xhr.open("get","./getBackPassword.servlet?name="+userName+"&email="+email+"&role=1",true);
				xhr.send();
				click=true;
				$(".loading").toggle();
			}
		}//end sendRequest
		xhr.onload=function(){
			click=false;
			$(".loading").toggle();
			var obj=JSON.parse(xhr.response);
			if(obj.message){//密码找回成功
				window.alert("旧密码已发送到邮箱,请注意查看");
			}else{
				window.alert(obj.error);
			}			
		}
		$(".btn").click(sendRequest);
		$("#email").keypress(function(event){
			if(event.which==13)
				sendRequest();
		});
	</script>
  </body>
</html>
