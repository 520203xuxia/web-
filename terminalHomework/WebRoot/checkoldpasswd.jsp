<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	session=request.getSession();
	String oldpasswd = request.getParameter("oldpasswd");
	String newpasswd = request.getParameter("newpasswd");		
	String IDNumber=session.getAttribute("IDNumber").toString();
	try{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://172.31.238.142:3306/mail";
		String username = "longhao";
		String password = "h199127";	    
		conn = DriverManager.getConnection(url, username, password);
		String check="select IDNumber from clients where IDNumber=? and passwd=password(?)";
		PreparedStatement ps1=conn.prepareStatement(check);
		ps1.setString(1, IDNumber);
		ps1.setString(2, oldpasswd);
		ResultSet rs=ps1.executeQuery();
		if(rs.next())//密码正确，则修改密码
		{
			String sql="update clients set passwd=password(?) where IDNumber=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, newpasswd);
			ps.setString(2, IDNumber);
			ps.executeUpdate();
			out.print("修改成功！");
		}
		else
		{
			out.print("密码错误！修改失败");
		}		
	}catch(Exception e){}
    
	
%>
