<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	String IDNumber = request.getParameter("IDNumber");	
	String telno = request.getParameter("telno");
	String type = request.getParameter("type");			
	String passwd=request.getParameter("passwd");  
	String counterID=session.getAttribute("counterID").toString();
    //Thread.currentThread().sleep(1000);
    Connection conn = null;
    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://172.31.238.142:3306/mail";
	    String user = "longhao";
	    String password = "h199127";	    
	    conn = DriverManager.getConnection(url, user, password);
	    String check="select username from clients where IDNumber=?";
		PreparedStatement ps_check=conn.prepareStatement(check);
		ps_check.setString(1, IDNumber);		
		ResultSet rs0=ps_check.executeQuery();
		if(rs0.next())//用户已注册
		{				
			CallableStatement cs = conn.prepareCall("{call add_card(?,?,?,password(?),?)}");
		    cs.setString(1,IDNumber);
		    cs.setString(2,counterID);
		    cs.setString(3,telno);
		    cs.setString(4,passwd);
		    cs.setString(5,type);
	        cs.executeQuery(); //执行查询操作，并获取结果集
	        out.print("办卡成功！");
	      	String sql="select card_number from Cards1 where IDNumber=? order by cardCreateTime desc limit 1";	      	
	       	PreparedStatement ps_sql=conn.prepareStatement(sql);
	       	ps_sql.setString(1, IDNumber);
	       	ResultSet rs1=ps_sql.executeQuery();
	       	if(rs1.next())
	       		out.print(rs1.getString("card_number"));
		}
		else
		{
			out.print("该用户未注册！");
		}
    }catch(Exception e){out.print("false");out.print(e);}
%>




















