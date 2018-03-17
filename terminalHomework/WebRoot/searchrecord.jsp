<%@ page language="java" import="java.sql.*,java.util.*,java.text.SimpleDateFormat,java.lang.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%
	String card_number = request.getParameter("card_number");
  	String end = request.getParameter("end")+":00";
  	String start = request.getParameter("start")+":00";  	
    Connection conn = null;
    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://172.31.238.142:3306/mail";
	    String username = "longhao";
	    String password = "h199127";
	    conn = DriverManager.getConnection(url, username, password);
	    CallableStatement cs = conn.prepareCall("{call show_trading_record(?,?,?)}");
	    cs.setString(1,card_number);
	    cs.setString(2,start);
	    cs.setString(3,end);	  
        ResultSet rs = cs.executeQuery(); //执行查询操作，并获取结果集	   
	    int flag=0;		    
	    out.print("<table style='font-size: 15px;' class='table table-bordered table-auto'><tr><th>交易时间</th><th>对方账户名称</th><th>对方账户卡号</th><th>交易金额</th><th>手续费</th><th>余额</th></tr>");
	    while(rs.next())
	    {
	    	out.print("<tr><td>"+rs.getString(1).substring(0,rs.getString(1).indexOf('.')) +"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getFloat(4)+"</td><td>"+rs.getFloat(5)+"</td><td>"+rs.getString(6)+"</td></tr>");	    		    	
	    }	 
	    out.print("<table>");
    }catch(Exception e){out.print("false");out.print(e);}
%>
