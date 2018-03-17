<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	String IDNumber=request.getParameter("IDNumber");
	String card_number = request.getParameter("card_number");
	String passwd=request.getParameter("passwd");
	String amount=request.getParameter("amount");  
	Float famount=-Float.parseFloat(amount);
    //Thread.currentThread().sleep(1000);
    Connection conn = null;
  
	    try{
		    Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://172.31.238.142:3306/mail";
		    String username = "longhao";
		    String password = "h199127";	    
		    conn = DriverManager.getConnection(url, username, password);
		    String check="select card_number from Cards1 where card_number=? and passwd=password(?) and IDNumber=?";
			PreparedStatement ps_check=conn.prepareStatement(check);
			ps_check.setString(1, card_number);
			ps_check.setString(2,passwd);
			ps_check.setString(3,IDNumber);			
			ResultSet rs0=ps_check.executeQuery();
			if(rs0.next())
			{				
				CallableStatement cs = conn.prepareCall("{call add_record(?,?,?)}");
			    cs.setString(1,card_number);
			    cs.setString(2,card_number);
			    cs.setFloat(3,famount);        
				cs.executeQuery(); //执行查询操作，并获取结果集	
		        out.print("取款成功！");	       	
			}
			else
			{
				out.print("卡号或密码错误！");
			}
	    }catch(Exception e){
	    	String info=e.toString();
	    	//out.print(info);
	    	if(info.substring(info.indexOf(":")+1).equals(" Insufficient funds!"))
	   			out.print("余额不足!");
	   		else if(info.substring(info.indexOf(":")+1).equals(" Report loss!"))
	   			out.print("该卡已挂失！");	   		 
	   	}
	
%>
