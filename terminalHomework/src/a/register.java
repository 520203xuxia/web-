package a;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class register extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		response.setContentType("text/html;charset=GBK");
		PrintWriter out=response.getWriter();
		String Driver=getServletContext().getInitParameter("Driver");
		String sqluser=getServletContext().getInitParameter("username");
		String sqlpasswd=getServletContext().getInitParameter("passwd");
		String port=getServletContext().getInitParameter("port");	
		String localhost=getServletContext().getInitParameter("localhost");		
		String username="";
		String passwd="";
		String passwdagain="";
		String email="";
		String telno="";
		String success="";
		String info="";
		try{
			Class.forName(Driver);
			Connection conn=DriverManager.getConnection("jdbc:mysql://"+localhost+":"+port+"/"+sqluser+"?useUnicode=true&characterEncoding=utf-8",sqluser,sqlpasswd);
			Statement stat=conn.createStatement();
			username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
			passwd=new String(request.getParameter("passwd").getBytes("iso-8859-1"),"utf-8");
			email=new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");	
			telno=new String(request.getParameter("telno").getBytes("iso-8859-1"),"utf-8");			
			String insert="insert into users values(?,password(?),?,?)";
			PreparedStatement ps_insert=conn.prepareStatement(insert);
			ps_insert.setString(1, username);
			ps_insert.setString(2, passwd);		
			ps_insert.setString(3, email);
			ps_insert.setString(4, telno);
			ps_insert.executeUpdate();
			info="注册成功！";
		}catch(Exception e){
			if(e.toString().equals("java.lang.NullPointerException"))
				info="";
			else
				info="用户名已存在！";	
		}
		String url="terminalHomework/register.jsp?info="+info;
		HttpSession  session=request.getSession();
		session.setAttribute(info, info);
		response.sendRedirect(url);
	}
}








