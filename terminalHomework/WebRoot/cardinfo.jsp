<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%String card_number = request.getParameter("card_number"); 
    //Thread.currentThread().sleep(1000);
    Connection conn = null;
    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://172.31.238.142:3306/mail";
	    String username = "longhao";
	    String password = "h199127";
	    conn = DriverManager.getConnection(url, username, password);
	    CallableStatement cs = conn.prepareCall("{call show_card(?)}");
	    cs.setString(1,card_number);
        ResultSet rs = cs.executeQuery();//执行查询操作，并获取结果集
	    String cardCreateTime,bankName,telno,type,status,limitation,balance;	    
	    if(rs.next())
	    {
	    	type=rs.getString(5);	    	
	    	if(type.equals("0"))
	    	{
	    		type="借记卡";
	    		cardCreateTime=rs.getString(2);
	    		bankName=rs.getString(3);
	    		telno=rs.getString(4);
	    		status=rs.getString(6);
	    		balance=rs.getString(7);
	    		if(status.equals("1"))
	    			status="正常";
	    		else
	    			status="挂失";
	    		out.print("<table class='table table-borderless'>");
	    		out.print("<tr><td>卡号：</td><td id='card_number'>"+card_number+"</td></tr>");
	    		out.print("<tr><td>办卡时间：</td><td id='cardCreateTime'>"+cardCreateTime+"</td></tr>");
	    		out.print("<tr><td>银行：</td><td id='bankName'>"+bankName+"</td></tr>");
	    		out.print("<tr><td>绑定电话：</td><td id='telno'>"+telno+"</td></tr>");
	    		out.print("<tr><td>卡类型：</td><td id='type'>"+type+"</td></tr>");
	    		out.print("<tr><td>卡状态：</td><td id='status'>"+status+"</td></tr>");
	    		out.print("<tr><td>余额：</td><td id='balance'>"+balance+"</td></tr>");
	    		out.print("</table>");
	    	}
	    	else
	    	{
	    		type="信用卡";
	    		cardCreateTime=rs.getString(2);
	    		bankName=rs.getString(3);
	    		telno=rs.getString(4);
	    		status=rs.getString(6);
	    		limitation=rs.getString(7);
	    		balance=rs.getString(8);
	    		if(status.equals("1"))
	    			status="正常";
	    		else
	    			status="挂失";
	    		out.print("<table class='table table-borderless'>");
	    		out.print("<tr><td>卡号：</td><td id='card_number'>"+card_number+"</td></tr>");
	    		out.print("<tr><td>办卡时间：</td><td id='cardCreateTime'>"+cardCreateTime+"</td></tr>");
	    		out.print("<tr><td>银行：</td><td id='bankName'>"+bankName+"</td></tr>");
	    		out.print("<tr><td>绑定电话：</td><td id='telno'>"+telno+"</td></tr>");
	    		out.print("<tr><td>卡类型：</td><td id='type'>"+type+"</td></tr>");
	    		out.print("<tr><td>卡状态：</td><td id='status'>"+status+"</td></tr>");
	    		out.print("<tr><td>额度：</td><td id='limitation'>"+limitation+"</td></tr>");
	    		out.print("<tr><td>余额：</td><td id='balance'>"+balance+"</td></tr>");
	    		out.print("</table>");
	    	}
	    	
	    }	 
	
    }catch(Exception e){out.print("false");out.print(e);}
%>
