<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	String IDNumber = request.getParameter("IDNumber");	
	String card_number = request.getParameter("card_number");
	String passwd=request.getParameter("passwd");  
    //Thread.currentThread().sleep(1000);
    Connection conn = null;
    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://172.31.238.142:3306/mail";
	    String user = "longhao";
	    String password = "h199127";	    
	    conn = DriverManager.getConnection(url, user, password);
	    String check="select card_number from Cards1 where IDNumber=? and card_number=? and passwd=password(?)";
		PreparedStatement ps_check=conn.prepareStatement(check);
		ps_check.setString(1, IDNumber);
		ps_check.setString(2, card_number);
		ps_check.setString(3,passwd);
		ResultSet rs0=ps_check.executeQuery();
		if(rs0.next())
		{
			CallableStatement cs = conn.prepareCall("{call card_loss(?)}");
		    cs.setString(1,card_number);
	        cs.executeQuery(); //执行查询操作，并获取结果集	
	       	out.print("挂失成功！");
		}
		else
		{
			out.print("卡号或密码错误！");
		}
    }catch(Exception e){out.print("false");out.print(e);}
%>
