	function change()
  	{
  		var img=document.getElementById("code_name");
  		var time=new Date().getTime();
  		img.src="../validate.jsp?time="+time;
  	}  	
  	
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
			document.getElementById("error_code").innerHTML="";
		}
		form.submit();		
	}	
  
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	