	function change()
  	{
  		var img=document.getElementById("code_name");
  		var time=new Date().getTime();
  		img.src="../validate.jsp?time="+time;
  	}  	
  	
	function Submit(obj)
	{
		var error=document.getElementById("error");
	  	if(error.innerText=="ע��ɹ���")
	  	{
	  		error.style.color="green";
	  	}
	  	else
	  		error.style.color="red";		
		var form=obj.parentNode.parentNode;
		if(form.IDNumber.value==""){
			document.getElementById("error_IDNumber").innerHTML="���֤�Ų���Ϊ�գ�";
			return false;
		}
		else{
			 var regTel1 = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(form.IDNumber.value);
      		 if(!regTel1)
      		 {
			 	document.getElementById("error_IDNumber").innerHTML="���֤��������";
			 	return false;
			 }
			 else
			 	document.getElementById("error_IDNumber").innerHTML="";
		}
		if(form.username.value==""){
			document.getElementById("error_username").innerHTML="�û�������Ϊ�գ�";
			return false;
		}
		else{
			var all = /^[\u4E00-\u9FA5]{2,10}$/;
			if(!all.test(form.username.value))
			{
				document.getElementById("error_username").innerHTML="�û���ֻ���ɺ�����ɣ�";
				return false;
			}
			else
				document.getElementById("error_username").innerHTML="";
		}
		if(form.passwd.value==""){
			document.getElementById("error_passwd").innerHTML="���벻��Ϊ�գ�";
			return false;
		}
		else
		{
			var patrn=/^(\w){6,20}$/;  
			if (!patrn.exec(form.passwd.value))
			{
				document.getElementById("error_passwd").innerHTML="����ֻ������ĸ�����֡��»�����ɵ�6-20���ַ���";
				return false;
			}
			else
				document.getElementById("error_passwd").innerHTML="";
		}
		if(form.passwdagain.value==""){
			document.getElementById("error_passwdagain").innerHTML="ȷ�����벻��Ϊ�գ�";
			return false;
		}
		else{
			document.getElementById("error_passwdagain").innerHTML="";
			if(form.passwd.value!=form.passwdagain.value){
					document.getElementById("error").innerHTML="�����������벻һ�£�";				
					return false;
				}
		}
		if(form.email.value==""){
			document.getElementById("error_email").innerHTML="���䲻��Ϊ�գ�";
			return false;
		}
		else{
			var pattern= /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;  
        	var  strEmail=pattern.test(form.email.value);
        	if(!strEmail)
        	{
        		document.getElementById("error_email").innerHTML="������Ч��";
        		return false;
        	}
        	else
        	{
        		document.getElementById("error_email").innerHTML="";
        	}
			
		}		
		if(form.code.value==""){
			document.getElementById("error_code").innerHTML="��֤�벻��Ϊ�գ�";
			return false;
		}
		else{
			document.getElementById("error_code").innerHTML="";
		}
		form.submit();		
	}	
  
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	