import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class counterLogin extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();	
		String counterID="";
		String passwd="";
		String code="";	
		HttpSession session=request.getSession();
		//HttpSession countersession=new HttpSession();
		String randStr=(String)session.getAttribute("randStr");
		code=new String(request.getParameter("code").getBytes("iso-8859-1"),"utf-8");	
		if(!code.equals(randStr))
		{
			response.sendRedirect("counterLogin.jsp?info=codeerror");		
		}
		else
		{
			try{			
				Connection conn = ConnectionManager.getConnection();			   
				Statement stat=conn.createStatement();				
				counterID=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
				passwd=new String(request.getParameter("passwd").getBytes("iso-8859-1"),"utf-8");								
				String check="select name from counters where counterID=? and passwd=password(?)";
				PreparedStatement ps_check=conn.prepareStatement(check);
				ps_check.setString(1, counterID);
				ps_check.setString(2, passwd);
				ResultSet rs=ps_check.executeQuery();	
				if(rs.next())
				{			
					session.setAttribute("counterusername", rs.getString(1));
					session.setAttribute("counterID", counterID);
					String remember="";
					
					try{remember=request.getParameter("remember_count").toString();				
					}					
					catch(Exception e){}					
					if(remember.equals("on"))
					{
						//记住用户名和密码
						String acc=URLEncoder.encode(request.getParameter("username"),"utf-8");//要encode，不然addcookie会失败
						String pass=URLEncoder.encode(request.getParameter("passwd"),"utf-8");
						Cookie cookie_counterusername=new Cookie("counterusername",acc);
						Cookie cookie_counterpasswd=new Cookie("counterpasswd",pass);
						cookie_counterusername.setMaxAge(7*24*60*60);//有效期7天
						cookie_counterpasswd.setMaxAge(7*24*60*60);//有效期7天					
						response.addCookie(cookie_counterusername);
						response.addCookie(cookie_counterpasswd);
						
					}
					response.sendRedirect("counterIndex.jsp");
				}
				else
				{
					response.sendRedirect("counterLogin.jsp?info=error");
					
				}
			}catch(Exception e){							
			}
		}
		
	}
}








