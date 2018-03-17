<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<!-- <link href="my.css" rel="stylesheet"> -->
	<link href="css/animate.css" rel="stylesheet">
  </head>
  <body>
   <%
   	String username="未登录";
   	try{
   		username=session.getAttribute("counterusername").toString();
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
      <ul class="nav navbar-nav navbar-right">
      	
        <li style="margin-top: 10px;">
       		<span style="color:white;font-size:15px;"><a class="icon icon-off" style="color:red; padding-right: 14px;" href="counterquit.jsp"></a><span id="status"><%=username %></span></span> 
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
	      	<li onclick="counterchange('createcard')"><a href="javascript:;">办卡</a></li>
	        <li onclick="counterchange('deposit')"><a href="javascript:;">存款</a></li>
	        <li onclick="counterchange('withdraw')"><a href="javascript:;">取款</a></li>
	        <li onclick="counterchange('reportloss')"><a href="javascript:;">挂失</a></li>
	        <li onclick="counterchange('cancelhang')"><a href="javascript:;">解挂</a></li>	        
	        <li  onclick="counterchange('transfer')"><a href="javascript:;">转账</a></li>
	      </ul>
	    </li>	
	  </ul>
	</nav>		
</div>
<div class="col-sm-1"></div>
<div class="col-sm-4 index_right_box animated rollIn " >
	<div id="default" style="display:block">
		<h2>欢迎进入网上银行管理系统</h2>
		
	</div>
	<!--办卡  -->
	<div id="createcard" style="display:none" >
		
			<table class="table table-borderless" >
				<tr>
				  <td>身份证号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="makeIDNumber"></div></td>
				</tr>
				
				<tr>
				  <td>手机号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="maketelno"></div></td>
				</tr>
				<tr>
				  <td>卡类型：</td>
				  <td>
				   <div class="">
				      <select class="form-control" name="maketype">
					    <option value="0">借记卡</option>
					    <option value="1">信用卡</option>
					  </select>
				   </div>
				  </td>
				</tr>
				<tr>
				  <td>密码：</td>
				  <td><div class=""><input type="password" class="form-control" placeholder="" name="makepasswd"></div></td>
				</tr> 
				<tr>
				  <td>确认密码：</td>
				  <td><div class=""><input type="password" class="form-control" placeholder="" name="makepasswdagain"></div></td>
				</tr> 
				<tr>
					<td></td>
					<td><button class="btn btn-primary name="makecard" onclick="makecard()">提交</button></td>
				</tr> 
				 
			</table>
     
     	<span style="display:none" id="makeinfo"></span>
     	<span style="display:block" id="makeinfo1"></span>
	</div>
	
	<!-- 存款 -->
	<div id="deposit" style="display:none" >
		<form action="" method="post" autocomplete="off">
			<table class="table table-borderless ">
				<tr>
				  <td>身份证号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="depositIDNumber"></div></td>
				</tr>				
				<tr>
				  <td>卡号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="depositcard_number"></div></td>
				</tr>
				<tr>
				  <td>存款金额：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="depositamount"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-info" type="button" onclick="deposit()">确认</button></td>
				</tr> 					  
			</table>
     	</form>		
		<span style="display:none" id="depositinfo"></span>		
	</div>
	<!-- 取款 -->
	<div id="withdraw" style="display:none">
		<form action="" method="post" autocomplete="off">
			<table class="table table-borderless ">
				<tr>
				  <td>身份证号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="withdrawIDNumber"></div></td>
				</tr>	
				<tr>
				  <td>卡号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="withdrawcard_number"></div></td>
				</tr>			
				<tr>
				  <td>取款金额：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="withdrawamount"></div></td>
				</tr>			
				<tr>
				  <td>密码：</td>
				  <td><div class=""><input type="password" class="form-control" placeholder="" name="withdrawpasswd"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-info" type="button" onclick="withdraw()">确认</button></td>
				</tr> 			  
			</table>
     	</form>
     	<span id="withdrawinfo" style="display:none;"></span>
	</div>
	<!-- 挂失 --> 
	<div id="reportloss" style="display:none">
		<form action="" method="post">
			<table class="table table-borderless ">
				<tr>
				  <td>身份证号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="lossIDNumber"></div></td>
				</tr>				
				<tr>
				  <td>卡号：</td>
				  <td><div class=""><input type="text" class="form-control " placeholder="" name="losscard_number"></div></td>
				</tr>					
				  <td>密码：</td>
				  <td><div class=""><input type="password" class="form-control" placeholder="" name="losspasswd"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-info" type="button" onclick="reportloss(this)">挂失</button></td>
				</tr> 			  
			</table>
     	</form>
     	<span style="display:none" id="reportlossinfo"></span>
	</div>
	<!-- 解挂 -->
	<div id="cancelhang" style="display:none">
		<form action="" method="post" autocomplete="off">	
			<table class="table table-borderless ">
					<tr>
					  <td>身份证号：</td>
					  <td><div class=""><input type="text" class="form-control " placeholder="" name="cancellossIDNumber"></div></td>
					</tr>					
					<tr>
					  <td>卡号：</td>
					  <td><div class=""><input type="text" class="form-control " placeholder="" name="cancellosscard_number"></div></td>
					</tr>					
					  <td>密码：</td>
					  <td><div class=""><input type="password" class="form-control" placeholder="" name="cancellosspasswd"></div></td>
					</tr>
					<tr>
						<td></td>
						<td><button class="btn btn-info" type="button" onclick="cancelloss()">解挂</button></td>
					</tr>  			  
			</table>
		</form>
		<span id="cancellossinfo" style="display:none;"></span>
	</div>
	<!-- 转账 -->
	<div id="transfer" style="display:none">
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
</div>
<div class="col-sm-4">
<div class="boards" id="myBoards">
 <div class="board panel">
    <div class="panel-heading">
      <strong>申请信用卡的注意事项：</strong>
    </div>
    <div class="panel-body">
      <div class="board-list"><p>1、信用卡额度的审批工作由银行专职部门多人多环节进行，会根据申请人的总体情况进行评分。评分标准包括多方面：申请人的银行征信记录、工作单位性质、年龄、婚否、职务、收入、房产、汽车等资产情况。如果申请信用卡时还可以备齐以下各项材料，一定会提高办卡效率，还可以提高信用卡审批授信额度：行驶证复印件、房产证复印件、大额存单、股票基金、有价资产证明、其他银行信用卡复印件等。</p>
      <p>2、填写申请表时所留的办公室电话必须是有效的固定电话，有人接听，银行回访时会简单提问，例如，该单位有此人吗，什么岗位。申请表必须本人如实填写签名，银行回访会提问申请表中几个所填项，例如家庭地址，是否本人申请及签名等。</p>
<p>3、信用卡申请银行回访后就进入制卡过程，在此期间可致电银行客服电话查询办卡进度和额度，信用卡会以挂号信的方式寄到家庭或者工作地址。收到卡片需要打电话给银行开卡激活（激活步骤信件里有详细说明），除了少数信用卡完全免除年费外，信用卡大多有年费，一般平均刷卡过6次就免年费。</p>
<p>4、申请银行信用卡都是免费的，但是不是申请信用卡越多越好，申请卡片太多会影响再办新卡和授信额度，建议最好申请数量不超过3张。</p>
      </div>
    </div>
  </div>
</div>
</div>
<!-- <input type="text" id="bank_no_select">
<button onclick="getBank_account()">生成</button>
<input type="text" name="bank_account"> -->

 <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
 <script src="https://cdn.bootcss.com/zui/1.7.0/js/zui.js"></script>
 
 <script>
 var xmlHttp;
        function initAjax(){
            if(window.XMLHttpRequest){//IE7+, Firefox, Chrome, Opera, Safari
                xmlHttp = new XMLHttpRequest();
                
            }
            else if(window.ActiveXObject){
                try{
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e){
                    try{//IE5 and IE6
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch(e){
                        window.alert("该浏览器不支持Ajax");
                    }
                }
            }
            else{
                window.alert("该浏览器不支持Ajax.");
            }        
        }
  function counterchange(obj)
  {
 	var divs=document.getElementsByClassName("index_right_box")[0];
 	var div_no=divs.childElementCount;
  	for(var i=0;i<div_no;i++)
  		divs.children[i].style.display="none";
  	document.getElementById(obj).style.display="block";
  }
  function reportloss(obj)
  { 
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  		var r=document.getElementById("reportlossinfo");		
  		var card_number=document.getElementsByName("losscard_number")[0].value;		
  		var passwd=document.getElementsByName("losspasswd")[0].value;
  		var IDNumber=document.getElementsByName("lossIDNumber")[0].value;		
  		
  		if(IDNumber=="")
  		{
  			r.innerHTML="身份证号不能为空！";
  			var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  		}
  		else
  		{
  			var patrn=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;  
			if (!patrn.test(IDNumber))
			{
				r.innerHTML="身份证输入有误！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  		}
  		
  		if(card_number=="")
  		{
  			r.innerHTML="卡号不能为空！";
  			var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  		}
  		else
  		{
  			var patrn=/^([1-9]{1})(\d{18})$/;  
			if (!patrn.exec(card_number))
			{
				r.innerHTML="卡号只能由数字组成的19个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  		}	
  		if(passwd=="")
  		{
  			r.innerHTML="密码不能为空！";
  			var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  		}
  		else
  		{
  			var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(passwd))
			{
				r.innerHTML="密码只能由字母、数字、下划线组成的6-20个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  		}
  		
  		var url = "counter_reportloss.jsp?IDNumber="+IDNumber+"&card_number="+card_number+"&passwd="+passwd;
	  	initAjax();
		xmlHttp.open("POST", url, true);				
		xmlHttp.onreadystatechange=mystatechange;
	    
	    function mystatechange() {
			if (xmlHttp.readyState==4) {
	            r.innerHTML = xmlHttp.responseText;
	            if(r.innerText.trim()=="卡号或密码错误！")
	            {
		             var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000); 
			    }
			    else
			    {			    	
				  var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'ok-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);
			    }
			    
			}
			else{
				r.innerHTML += "请稍候......";
			}				
		}
		xmlHttp.send();	
	  	//window.open(url); 
	  	
  }
  function transfer(obj)
  {
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
	  	var tcard_number=document.getElementsByName("tcard_number")[0].value;
	  	var scard_number=document.getElementsByName("scard_number")[0].value;
	  	var spasswd=document.getElementsByName("spasswd")[0].value;
	  	var amount=document.getElementsByName("amount")[0].value;
	  	var r=document.getElementById("transferinfo");
	  	if(scard_number==""||tcard_number=="")
	  	{
	  		r.innerHTML="卡号不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
	  	}
	  	else
	  	{
	  		var patrn=/^([1-9]{1})(\d{18})$/;  
			if (!patrn.exec(scard_number)||!patrn.exec(tcard_number))
			{
				r.innerHTML="卡号只能由数字组成的19个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}
	  	if(spasswd=="")
	  	{
	  		r.innerHTML="密码不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
	  	}
	  	else
	  	{
	  		var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(spasswd))
			{
				r.innerHTML="密码只能由字母、数字、下划线组成的6-20个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}
	  	if(amount=="")
	  	{
	  		r.innerHTML="转账金额不能为空";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
	  	}
	  	else
	  	{
	  		
	  		var patrn=/^[0-9]+([.]{1}[0-9]{1,2})?$/;  
			if (!patrn.exec(amount))
			{
				r.innerHTML="转账金额不合法！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}	  	
	  	var url = "transfer.jsp?scard_number="+scard_number+"&tcard_number="+tcard_number+"&spasswd="+spasswd+"&amount="+amount;
	  	initAjax();
		xmlHttp.open("POST", url, true);				
		xmlHttp.onreadystatechange=mystatechange;
	   
	    function mystatechange() {
	    	
			if (xmlHttp.readyState==4) {
	            r.innerHTML = xmlHttp.responseText;
	            if(r.innerText.trim()=="卡号或密码错误！"||r.innerText.trim()=="无法向本卡转账!"||r.innerText.trim()=="余额不足!"||r.innerText.trim()=="该卡已挂失！")
	            {
		             var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000); 
			    }
			    else
			    {
			    	
					  var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'ok-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);
			    }
			    
			}
			else{
				r.innerHTML += "请稍候......";
			}				
		}
		xmlHttp.send();	
  }
  function makecard()
  {
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  	var IDNumber=document.getElementsByName("makeIDNumber")[0].value;
  	
  	var telno=document.getElementsByName("maketelno")[0].value;
  	var type=document.getElementsByName("maketype")[0].value;
  	var passwd=document.getElementsByName("makepasswd")[0].value;
  	var passwdagain=document.getElementsByName("makepasswdagain")[0].value;
  	var r=document.getElementById("makeinfo");
  	var r1=document.getElementById("makeinfo1");
  	if(IDNumber=="")
  	{
  		r.innerHTML="身份证号不能为空！";
  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  	}
  	else
  	{
  		var patrn=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;  
			if (!patrn.test(IDNumber))
			{
				r.innerHTML="身份证输入有误！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  	}
  	if(telno=="")
  	{
  		r.innerHTML="手机号不能为空！";
  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  	}
  	else
  	{
  		var patrn=/^1[34578]\d{9}$/;
  		if (!patrn.test(telno))
			{
				r.innerHTML="手机号输入有误！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  	}
  	if(passwd=="")
  	{
  		r.innerHTML="密码不能为空！";
  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  	}
  	else
  	{
  		var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(passwd))
			{
				r.innerHTML="密码只能由字母、数字、下划线组成的6-20个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  	}
  	if(passwdagain=="")
  	{
  		r.innerHTML="确认密码不能为空！";
  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  	}
	if(passwd!=passwdagain)
	{
		r.innerHTML="两次密码不一致！";
  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
	}
	
	var url="makecard.jsp?IDNumber="+IDNumber+"&telno="+telno+"&type="+type+"&passwd="+passwd;
  		initAjax();
  		xmlHttp.open("POST",url,true);
  		xmlHttp.onreadystatechange=mystatechange; 		
  		function mystatechange() {
  			if (xmlHttp.readyState==4) {
  				r.innerHTML = xmlHttp.responseText;
  				r1.innerHTML = xmlHttp.responseText;
  				 if(!(r.innerText.trim()=="该用户未注册！"))
	            {
		             var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'ok-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);						  
					 
			    }
			    else
			    {
			    	 var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000); 
					
			    }
  			}		
  	 }
  	 xmlHttp.send();	
  	
   }
  function deposit()
  {
  	var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
	  	var IDNumber=document.getElementsByName("depositIDNumber")[0].value;
	  	var card_number=document.getElementsByName("depositcard_number")[0].value;
	  	
	  	var amount=document.getElementsByName("depositamount")[0].value;
	  	var r=document.getElementById("depositinfo");
	  	if(IDNumber=="")
	  	{
	  		r.innerHTML="身份证号不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
				  			type:'warning',
				  			icon:'warning-sign',
				  			placement:'top',
				  			close:false//禁用关闭
				  		})
						 myMessage.show();
				return false;
	  	}
	  	else
	  	{
	  		var patrn=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;  
				if (!patrn.test(IDNumber))
				{
					r.innerHTML="身份证输入有误！";
					var myMessage=new $.zui.Messager(r.innerHTML,{
				  			type:'warning',
				  			icon:'warning-sign',
				  			placement:'top',
				  			close:false//禁用关闭
				  		})
						 myMessage.show();
					return false;
				}
	  	}
	  	if(card_number=="")
	  	{
	  		r.innerHTML="卡号不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
	  	}
	  	else
	  	{
	  		var patrn=/^([1-9]{1})(\d{18})$/;  
			if (!patrn.exec(card_number))
			{
				r.innerHTML="卡号只能由数字组成的19个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}
	  	
	  	if(amount=="")
	  	{
	  		r.innerHTML="转账金额不能为空";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
	  	}
	  	else
	  	{
	  		
	  		var patrn=/^[0-9]+([.]{1}[0-9]{1,2})?$/;  
			if (!patrn.exec(amount))
			{
				r.innerHTML="转账金额不合法！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}	  	
	  	var url = "deposit.jsp?IDNumber="+IDNumber+"&card_number="+card_number+"&amount="+amount;
	  	initAjax();
		xmlHttp.open("POST", url, true);				
		xmlHttp.onreadystatechange=mystatechange;
	   
	    function mystatechange() {
	    	
			if (xmlHttp.readyState==4) {
	            r.innerHTML = xmlHttp.responseText;
	            if(r.innerText.trim()=="身份证或卡号错误！")
	            {
		             var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000); 
			    }
			    else
			    {
			    	
					  var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'ok-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);
			    }
			    
			}
			else{
				r.innerHTML += "请稍候......";
			}				
		}
		xmlHttp.send();	
  } 
  
  
  
  function withdraw()
  {
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
	  	var IDNumber=document.getElementsByName("withdrawIDNumber")[0].value;
	  	var card_number=document.getElementsByName("withdrawcard_number")[0].value;
	  	var passwd=document.getElementsByName("withdrawpasswd")[0].value;
	  	var amount=document.getElementsByName("withdrawamount")[0].value;
	  	var r=document.getElementById("withdrawinfo");
	  	if(IDNumber=="")
	  	{
	  		r.innerHTML="身份证号不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
				  			type:'warning',
				  			icon:'warning-sign',
				  			placement:'top',
				  			close:false//禁用关闭
				  		})
						 myMessage.show();
				return false;
	  	}
	  	else
	  	{
	  		var patrn=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;  
				if (!patrn.test(IDNumber))
				{
					r.innerHTML="身份证输入有误！";
					var myMessage=new $.zui.Messager(r.innerHTML,{
				  			type:'warning',
				  			icon:'warning-sign',
				  			placement:'top',
				  			close:false//禁用关闭
				  		})
						 myMessage.show();
					return false;
				}
	  	}
	  	if(card_number=="")
	  	{
	  		r.innerHTML="卡号不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
	  	}
	  	else
	  	{
	  		var patrn=/^([1-9]{1})(\d{18})$/;  
			if (!patrn.exec(card_number))
			{
				r.innerHTML="卡号只能由数字组成的19个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}
	  	if(amount=="")
	  	{
	  		r.innerHTML="转账金额不能为空";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
	  	}
	  	else
	  	{
	  		
	  		var patrn=/^[0-9]+([.]{1}[0-9]{1,2})?$/;  
			if (!patrn.exec(amount))
			{
				r.innerHTML="转账金额不合法！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}	  	
	  	if(passwd=="")
	  	{
	  		r.innerHTML="密码不能为空！";
	  		var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
	  	}
	  	else
	  	{
	  		var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(passwd))
			{
				r.innerHTML="密码只能由字母、数字、下划线组成的6-20个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
	  	}
	  	
	  	var url = "withdraw.jsp?IDNumber="+IDNumber+"&card_number="+card_number+"&passwd="+passwd+"&amount="+amount;
	  	initAjax();
		xmlHttp.open("POST", url, true);				
		xmlHttp.onreadystatechange=mystatechange;
	   
	    function mystatechange() {
	    	
			if (xmlHttp.readyState==4) {
	            r.innerHTML = xmlHttp.responseText;
	            if(r.innerText.trim()=="卡号或密码错误！"||r.innerText.trim()=="余额不足!"||r.innerText.trim()=="该卡已挂失！")
	            {
		             var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000); 
			    }
			    else
			    {
			    	
					  var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'ok-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);
			    }
			    
			}
			else{
				r.innerHTML += "请稍候......";
			}				
		}
		xmlHttp.send();	
  }  
 function cancelloss()
  { 
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  		var r=document.getElementById("cancellossinfo");		
  		var card_number=document.getElementsByName("cancellosscard_number")[0].value;		
  		var passwd=document.getElementsByName("cancellosspasswd")[0].value;
  		var IDNumber=document.getElementsByName("cancellossIDNumber")[0].value;		
  		
  		if(IDNumber=="")
  		{
  			r.innerHTML="身份证号不能为空！";
  			var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  		}
  		else
  		{
  			var patrn=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;  
			if (!patrn.test(IDNumber))
			{
				r.innerHTML="身份证输入有误！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  		}
  		
  		if(card_number=="")
  		{
  			r.innerHTML="卡号不能为空！";
  			var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  		}
  		else
  		{
  			var patrn=/^([1-9]{1})(\d{18})$/;  
			if (!patrn.exec(card_number))
			{
				r.innerHTML="卡号只能由数字组成的19个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  		}	
  		if(passwd=="")
  		{
  			r.innerHTML="密码不能为空！";
  			var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
			return false;
  		}
  		else
  		{
  			var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(passwd))
			{
				r.innerHTML="密码只能由字母、数字、下划线组成的6-20个字符！";
				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();
				return false;
			}
  		}
  		
  		var url = "cancelloss.jsp?IDNumber="+IDNumber+"&card_number="+card_number+"&passwd="+passwd;
	  	initAjax();
		xmlHttp.open("POST", url, true);				
		xmlHttp.onreadystatechange=mystatechange;	    
	    function mystatechange() {
			if (xmlHttp.readyState==4) {
	            r.innerHTML = xmlHttp.responseText;
	            if(r.innerText.trim()=="卡号或密码错误！")
	            {
		             var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'warning',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000); 
			    }
			    else
			    {			    	
				  var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'ok-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);
			    }
			    
			}
			else{
				r.innerHTML += "请稍候......";
			}				
		}
		xmlHttp.send();	
	  	//window.open(url); 
	  	
  }
  </script>
  </body>
</html>











