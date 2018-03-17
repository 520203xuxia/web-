
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- <meta http-equiv="refresh" content="5;url=/register.jsp"/> -->
    <title>账号激活激活</title>
</head>
<body>
<%	
	String error=request.getParameter("error");
	if(error.equals("had_been_validate"))
	{
		out.print("账号已经被激活！点击跳转到登录界面......<a href='clientLogin.jsp'>点击此处跳转</a>");
	}
	else if(error.equals("over_time"))
	{
		out.print("超过48小时未激活！请重新注册！点击跳转到注册界面......<a href='register.jsp'>点击此处跳转</a>");
	}
	else if(error.equals("no_register"))
	{
		out.print("该账号未注册！点击跳转到注册界面......<a href='register.jsp'>点击此处跳转</a>");
	}
%>

</body>
</html>
