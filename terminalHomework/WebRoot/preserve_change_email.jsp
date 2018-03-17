<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	session=request.getSession();
	String email = request.getParameter("email");		
	String IDNumber=session.getAttribute("IDNumber").toString();
	try{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://172.31.238.142:3306/mail";
		String username = "longhao";
		String password = "h199127";	    
		conn = DriverManager.getConnection(url, username, password);
		String sql="update clients set email=? where IDNumber=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, IDNumber);
		int i=ps.executeUpdate();
		session.setAttribute("email", email);
		if(i==1)
			out.print("修改成功！");
	}catch(Exception e){}
    
	
%>
