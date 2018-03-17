<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	String IDNumber = request.getParameter("IDNumber");
	String card_number = request.getParameter("card_number");
	String amount=request.getParameter("amount");  
	Float famount=Float.parseFloat(amount);
    //Thread.currentThread().sleep(1000);
    Connection conn = null;
 
	    try{
		    Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://172.31.238.142:3306/mail";
		    String username = "longhao";
		    String password = "h199127";	    
		    conn = DriverManager.getConnection(url, username, password);
		    String check="select card_number from Cards1 where card_number=? and IDNumber=?";
			PreparedStatement ps_check=conn.prepareStatement(check);
			ps_check.setString(1, card_number);
			ps_check.setString(2,IDNumber);		
			//out.print(card_number+IDNumber);
			ResultSet rs0=ps_check.executeQuery();
			if(rs0.next())
			{				
				CallableStatement cs = conn.prepareCall("{call add_record(?,?,?)}");
			    cs.setString(1,card_number);
			    cs.setString(2,card_number);
			    cs.setFloat(3,famount);        
				cs.executeQuery(); //执行查询操作，并获取结果集	
		        out.print("存款成功！");	       	
			}
			else
			{
				out.print("身份证或卡号错误！");
			}
	    }catch(Exception e){
	    	
	   	}

%>
