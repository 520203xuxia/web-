<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Thread"%>
<%String IDNumber = request.getParameter("IDNumber");
  
    //Thread.currentThread().sleep(1000);
    Connection conn = null;
    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://172.31.238.142:3306/mail";
	    String username = "longhao";
	    String password = "h199127";
	    conn = DriverManager.getConnection(url, username, password);
	    CallableStatement cs = conn.prepareCall("{call show_cards(?)}");
	    cs.setString(1,IDNumber);
        ResultSet rs = cs.executeQuery(); //执行查询操作，并获取结果集	   
	    int flag=0;	   
	    out.print("<table class='table table-bordered'><tr><th>银行</th><th>银行卡号</th><th>操作</th></tr>");
	    while(rs.next())
	    {
	    	out.print("<tr><td>"+rs.getString("bankname")+"</td><td>"+rs.getString("card_number")+"</td><td><button class='btn btn-link' type='button' onclick='find(this)'>查看</button></td>"+"</tr>");   	
	    }	 
	    out.print("<table>");
    }catch(Exception e){out.print("false");out.print(e);}
%>
