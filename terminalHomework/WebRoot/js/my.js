	function changecode()
  	{
  		var img=document.getElementById("code_name");
  		var time=new Date().getTime();
  		img.src="../validate.jsp?time="+time;
  	}
/*clientLogin.jsp 的提交表单事件*/  	
  	function clSubmit(obj)
	{
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
	
	}  	
	/*register.jsp的提交表单事件*/
	
  
  	
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
  	
	 function findbankcardinfo(){
  			var IDNumber = document.getElementById("IDNumber").innerText; 					
	  		var url = "../bankcardinfo.jsp?IDNumber="+IDNumber;
	  		initAjax();
			xmlHttp.open("POST", url, true);				
			xmlHttp.onreadystatechange=mystatechange;
            var bankcardinfo=document.getElementById("bankcardinfo");
            function mystatechange() {
				if (xmlHttp.readyState==4) {
                    bankcardinfo.innerHTML = xmlHttp.responseText;
				}
				else{
					bankcardinfo.innerHTML += "请稍候......";
				}				
			}
			xmlHttp.send();	
  		}
		/*clientIndex的*/
  		 function change(obj)
		  {
		 	var divs=document.getElementsByClassName("index_right_box")[0];
		 	var div_no=divs.childElementCount;
		  	for(var i=0;i<div_no;i++)
			{
		  		divs.children[i].style.display="none";
				document.getElementById("recordinfo").style.display="none";
			}
		  	document.getElementById(obj).style.display="block";
		  	if(obj=="bankcardinfo")
		  		findbankcardinfo();
			if(obj=="record")
				document.getElementById("recordinfo").style.display="block";
		  }
  
  function find(obj)
  {
  	var card_number=obj.parentElement.parentElement.children[1].innerText;
  	var url = "../cardinfo.jsp?card_number="+card_number;
  	initAjax();
	xmlHttp.open("POST", url, true);				
	xmlHttp.onreadystatechange=mystatechange;
    var bankcardinfo=document.getElementById("bankcardinfo");
    function mystatechange() {
		if (xmlHttp.readyState==4) {
            bankcardinfo.innerHTML = xmlHttp.responseText;
		}
		else{
			bankcardinfo.innerHTML += "请稍候......";
		}				
	}
	xmlHttp.send();	
  	//window.open(url); 	
  }
  function reportloss(obj)
  { 
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  		var r=document.getElementById("lossinfo");		
  		var card_number=document.getElementsByName("card_number")[0].value;
  			
  		var passwd=document.getElementsByName("passwd")[0].value;
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
  		
  		var url = "../reportloss.jsp?card_number="+card_number+"&passwd="+passwd;
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
	  	var url = "../transfer.jsp?scard_number="+scard_number+"&tcard_number="+tcard_number+"&spasswd="+spasswd+"&amount="+amount;
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
  
  function editinfo()
  {
	var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  	var tabContent1=document.getElementById("tabContent1");
  	var infotable=tabContent1.children[0].style.display="none";
  	var edittable=tabContent1.children[1].style.display="block";
  }
  function canceledit()
  {
  	var tabContent1=document.getElementById("tabContent1");
  	var infotable=tabContent1.children[0].style.display="block";
  	var edittable=tabContent1.children[1].style.display="none";
  }
  function preserve()
  {
  	var r=document.getElementById("change_email_info");	
  	var changeemail=document.getElementsByName("changeemail")[0].value;
  	if(changeemail=="")
  	{
  		r.innerHTML="邮箱不能为空！";
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
  		var pattern= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;  
        	var  strEmail=pattern.test(changeemail);
        	if(!strEmail)
        	{
        		r.innerHTML="邮箱无效！";
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
  	var url="../preserve_change_email.jsp?email="+changeemail;  	
  	initAjax();
  	xmlHttp.open("POST", url, true);			
	xmlHttp.onreadystatechange=mystatechange;	
  	function mystatechange() {		
  		if(xmlHttp.readyState==4)
  		{
  			r.innerHTML = xmlHttp.responseText; 			
  				var myMessage=new $.zui.Messager(r.innerHTML,{
			  			type:'success',
			  			icon:'warning-sign',
			  			placement:'top',
			  			close:false//禁用关闭
			  		})
					 myMessage.show();		
					 setTimeout(function(){
					  	myMessage.hide();
					  },5000);   			
  		}
  		else{
				r.innerHTML += "请稍候......";
			}		
  	}
  	xmlHttp.send();	
  } 
  
  function modifypasswd(obj)
  {
	 var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  	var r=document.getElementById("changepasswdinfo");
  	var oldpasswd=document.getElementsByName("oldpasswd")[0].value;
  	var newpasswd=document.getElementsByName("newpasswd")[0].value;
  	var newpasswdagain=document.getElementsByName("newpasswdagain")[0].value;
  	if(oldpasswd==""||newpasswd=="")
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
			if (!patrn.exec(newpasswd)||!patrn.exec(oldpasswd))
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
	if(newpasswd!=newpasswdagain)
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
  	var x=confirm("确定修改吗？");
  	if(x==false)
  	{
  		return false;
  	}
  	else
  	{
  		
  		var url="../checkoldpasswd.jsp?oldpasswd="+oldpasswd+"&newpasswd="+newpasswd;
  		initAjax();
  		xmlHttp.open("POST",url,true);
  		xmlHttp.onreadystatechange=mystatechange;
  		
  		function mystatechange() {
  			if (xmlHttp.readyState==4) {
  				r.innerHTML = xmlHttp.responseText;
  				 if(r.innerText.trim()=="修改成功！")
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
					  setTimeout(function(){ window.location.href="../clientLogin.jsp";},5000);			  
					 
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
   }
   xmlHttp.send();	
  }
  
  
  
  
  function search()
  { 
  var status=document.getElementById("status").innerHTML.trim();
	if(status=="未登录")
	{
		alert("请先登录！");
		return false;
	}
  		var r=document.getElementById("recordinfo");		
  		var card_number=document.getElementsByName("recordcard_number")[0].value; 			
  		var start=document.getElementById("start").value;	
  		var end=document.getElementById("end").value;	
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
  		
  		var url = "../searchrecord.jsp?card_number="+card_number+"&start="+start+"&end="+end;
	  	initAjax();
		xmlHttp.open("POST", url, true);				
		xmlHttp.onreadystatechange=mystatechange;
	    
	    function mystatechange() {
			if (xmlHttp.readyState==4) {
	            r.innerHTML = xmlHttp.responseText;	    
			}
			else{
				r.innerHTML += "请稍候......";
			}				
		}
		xmlHttp.send();		  	
  }
  	/*counteIndex.jsp*/
  	
  	/*counteIndex.jsp*/
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	