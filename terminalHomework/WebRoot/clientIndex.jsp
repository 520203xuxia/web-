<%@ page language="java" import="java.util.*,java.util.Date, java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>网上银行模拟系统</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="https://cdn.bootcss.com/zui/1.7.0/css/zui.css" rel="stylesheet">
	<!-- <link href="css/my.css" rel="stylesheet"> -->
	<link href="css/animate.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/zui/1.7.0/lib/datetimepicker/datetimepicker.css" rel="stylesheet">
  </head>
  <body>
   <%   
    String username="未登录";
    String IDNumber="";
    String email="";
   	try{
   		username=session.getAttribute("clientusername").toString();
   		IDNumber=session.getAttribute("IDNumber").toString();
   		email=session.getAttribute("email").toString();
   	}catch(Exception e){}
   	 ResultSet rs=null;		
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://172.31.238.142:3306/mail";
            String sqlusername = "longhao";
            String password = "h199127";
            Connection conn = DriverManager.getConnection(url, sqlusername, password);
            String sql = "select * from bank";
	       	
	        Statement stat=conn.createStatement();        
	        rs = stat.executeQuery(sql);	 
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } 	
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
      <ul class="nav navbar-nav navbar-right">
       <li style="margin-top: 10px;">
       		<span style="color:white;font-size:15px;"><a class="icon icon-off" style="color:red; padding-right: 14px;" href="clientquit.jsp"></a><span id="status"><%=username %></span></span> 
        </li>
      </ul>
    </div><!-- END .navbar-collapse -->
  </div>
</nav>

<div class="col-sm-3 index_left_box">
	<nav class="menu" data-ride="menu">
	  <ul class="nav nav-primary animated bounceInUp">    
	   <li class="nav-parent show ">
	      <a href="javascript:;"><i class="icon icon-yen"></i>操作</a>
	      <ul class="nav" style="display:block; background: rgba(100,0,0,0.1);" id="ope1">      	        
	        <li onclick="change('primaryinfo')"><a href="javascript:;">基本信息</a></li>
	        <li onclick="change('bankcardinfo')"><a href="javascript:;">银行卡信息</a></li>
	        <li  onclick="change('transfer')"><a href="javascript:;">转账</a></li>
	        <li onclick="change('reportloss')"><a href="javascript:;">挂失</a></li>
	        <li onclick="change('record')"><a href="javascript:;">交易记录</a></li>
	      </ul>
	    </li>	
	  </ul>	 
	</nav>		
</div>
<div class="col-sm-1"></div>
<div class="col-sm-5 index_right_box animated rollIn" >
	<div id="default" style="display:block" >
		<h2>欢迎进入网上银行管理系统</h2>
	</div>
	<div id="reportloss" style="display:none">
		<form action="" method="post">
			<table class="table table-borderless ">				
				<tr>
				  <td>卡号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="card_number"></div></td>
				</tr>					
				  <td>密码：</td>
				  <td><div class=""><input type="password" class="form-control" placeholder="" name="passwd"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-info" type="button" onclick="reportloss(this)">挂失</button></td>
				</tr> 			  
			</table>
     	</form>
     	<span id="lossinfo" style="display:none;"></span>    	
	</div>	
	<!-- 基本信息 -->
	<div id="primaryinfo" style="display:none">
		<ul class="nav nav-tabs">
			<li class="active"><a data-target="#tabContent1" data-toggle="tab">基本信息</a></li>
			<li ><a data-target="#tabContent2" data-toggle="tab">修改密码</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade active in" id="tabContent1">
				<!-- <form action="" method="post" name="primaryform"> -->
					<table class="table table-borderless " style="display:block">
						<tr>
						  <td>身份证号：</td>
						  <td id="IDNumber"><%=IDNumber %></td>				
						</tr>
						<tr>
						  <td>姓名：</td>
						  <td><%=username%></td>				 
						</tr>
						<tr>
						  <td>邮箱：</td>
						  <td><%=email%></td>				 
						</tr>
						<tr>
						  <td></td>
						  <td><button class="btn btn-info" onclick="editinfo()">编辑</button></td>				 
						</tr>						
					</table>
					<table class="table table-borderless " style="display:none">
						<tr>
						  <td>身份证号：</td>
						  <td id="IDNumber"><%=IDNumber %></td>				
						</tr>
						<tr>
						  <td>姓名：</td>
						  <td><%=username%></td>				 
						</tr>
						<tr>
						  <td>邮箱：</td>
						  <td><input type="email" value=<%=email%> name="changeemail" style="width: 250px;"></td>				 
						</tr>
						<tr>
						  <td><button class="btn" onclick="canceledit()">取消</button></td>
						  <td><button class="btn btn-info" onclick="preserve()">保存</button></td>				 
						</tr>
					</table>
					<span style="display:none" id="change_email_info"></span>
				<!-- </form> -->
			</div>
			<!-- 修改密码 -->
			<div class="tab-pane fade" id="tabContent2">
				<form action="" method="post">
					<table class="table table-borderless ">				
						<tr>
						  <td>原密码：</td>
						  <td><div class=""><input type="password" class="form-control " placeholder="" name="oldpasswd"></div></td>
						</tr>					
						  <td>新密码：</td>
						  <td><div class=""><input type="password" class="form-control" placeholder="" name="newpasswd"></div></td>
						</tr>
						</tr>					
						  <td>确认新密码：</td>
						  <td><div class=""><input type="password" class="form-control" placeholder="" name="newpasswdagain"></div></td>
						</tr>
						<tr>
							<td></td>
							<td><button class="btn btn-info" type="button" onclick="modifypasswd(this)">确认修改</button></td>
						</tr> 			  
					</table>
		     	</form>	
		     	<span id="changepasswdinfo" style="display:none;"></span>		    
			</div>
		</div>
		
	</div>
	<!-- 银行卡信息-->
	<div id="bankcardinfo" style="display:none">
		<!-- 异步处理 -->
	</div>
	<!-- 转账 -->
	<div id="transfer" style="display:none">
		<!-- 异步处理 -->
		<form action="" method="post">
			<table class="table table-borderless ">
				<tr>
				  <td>卡号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="scard_number"></div></td>
				</tr>			
				<tr>
				  <td>转账到：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="tcard_number"></div></td>
				</tr>
				<tr>
				  <td>转账金额：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="amount"></div></td>
				</tr>					
				  <td>密码：</td>
				  <td><div class=""><input type="password" class="form-control" placeholder="" name="spasswd"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-info" type="button" onclick="transfer(this)">确认转账</button></td>
				</tr> 			  
			</table>
     	</form>
     	<span id="transferinfo" style="display:none;"></span>
	</div>
	<!-- 交易记录         卡号，起止时间，          -->
	<div id="record" style="display:none">
			<table class="table table-borderless ">				
				<tr>
				  <td>卡号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="recordcard_number"></div></td>
				</tr>					
				  <td>开始于：</td>
				  <td><input type="text" id="start" class="form-control form-datetime" placeholder="开始于：yyyy-MM-dd hh:mm"></td>
				</tr>
				</tr>					
				  <td>结束于：</td>
				  <td><input type="text"  id="end" class="form-control form-datetime" placeholder="结束于：yyyy-MM-dd hh:mm"></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-info" type="button" onclick="search()">查询</button></td>
				</tr> 			  
			</table>
     	
	</div>
</div>
		
<div style="float:right;width:70%;" ><span id="recordinfo" style="display:block;"></span></div>
	
 <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
  <script src="https://cdn.bootcss.com/zui/1.7.0/js/zui.js"></script>
  <script src="https://cdn.bootcss.com/zui/1.7.0/lib/datetimepicker/datetimepicker.js"></script>
  <script src="js/my.js">
  </script>
  <script>
  $(".form-datetime").datetimepicker(
{
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    forceParse: 0,
    showMeridian: 1,
    format: "yyyy-mm-dd hh:ii"
});
  </script>
  </body>
</html>
