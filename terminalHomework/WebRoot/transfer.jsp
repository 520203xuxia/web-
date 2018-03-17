<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	String scard_number = request.getParameter("scard_number");
	String tcard_number = request.getParameter("tcard_number");
	String spasswd=request.getParameter("spasswd");
	String amount=request.getParameter("amount");  
	Float famount=Float.parseFloat(amount);
    Connection conn = null;
    if(scard_number.equals(tcard_number))
    {
    	out.print("无法向本卡转账!");
    }
    else
    {
	    try{
		    Class.forName("com.mysql.jdbc.Driver");
		    String url = "jdbc:mysql://172.31.238.142:3306/mail";
		    String username = "longhao";
		    String password = "h199127";	    
		    conn = DriverManager.getConnection(url, username, password);
		    String check_t="select card_number from Cards1 where card_number=?";
		    PreparedStatement ps_check1=conn.prepareStatement(check_t);
		    ps_check1.setString(1, tcard_number);
		    ResultSet rs=ps_check1.executeQuery();
		    if(rs.next())//目的卡号存在
		    {
		    	String check="select card_number from Cards1 where card_number=? and passwd=password(?)";
				PreparedStatement ps_check=conn.prepareStatement(check);
				ps_check.setString(1, scard_number);
				ps_check.setString(2,spasswd);		
				ResultSet rs0=ps_check.executeQuery();
				if(rs0.next())
				{				
					CallableStatement cs = conn.prepareCall("{call add_record(?,?,?)}");
				    cs.setString(1,scard_number);
				    cs.setString(2,tcard_number);
				    cs.setFloat(3,famount);        
					cs.executeQuery(); //执行查询操作，并获取结果集	
			        out.print("转账成功！");	       	
				}
				else
				{
					out.print("卡号或密码错误！");
				}
		    }
		    else
		    {
		    	out.print("目的卡号不存在！");
		    }
		    
	    }catch(Exception e){
	    	String info=e.toString();
	    	//out.print(info);
	    	if(info.substring(info.indexOf(":")+1).equals(" Insufficient funds!"))
	   			out.print("余额不足!");
	   		else if(info.substring(info.indexOf(":")+1).equals(" Report loss!"))
	   			out.print("该卡已挂失！");	   		 
	   	}
	}
%>
