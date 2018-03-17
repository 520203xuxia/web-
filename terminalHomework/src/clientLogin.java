
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class clientLogin extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();			
		String IDNumber="";
		String passwd="";
		String code="";	
		HttpSession session=request.getSession();
		String randStr=(String)session.getAttribute("randStr");
		code=new String(request.getParameter("code").getBytes("iso-8859-1"),"utf-8");	
		if(!code.equals(randStr))
		{
			response.sendRedirect("clientLogin.jsp?info=codeerror");				
		}
		else
		{
			try{			
				Connection conn = ConnectionManager.getConnection();			   
				Statement stat=conn.createStatement();
				IDNumber=new String(request.getParameter("IDNumber").getBytes("iso-8859-1"),"utf-8");
				passwd=new String(request.getParameter("passwd").getBytes("iso-8859-1"),"utf-8");								
				String check="select username,email from clients where IDNumber=? and passwd=password(?) and flag=1";
				PreparedStatement ps_check=conn.prepareStatement(check);
				ps_check.setString(1, IDNumber);
				ps_check.setString(2, passwd);
				ResultSet rs=ps_check.executeQuery();	
				if(rs.next())
				{			
					session.setAttribute("clientusername", rs.getString(1));
					session.setAttribute("IDNumber", IDNumber);
					session.setAttribute("email", rs.getString(2));
					String remember="";
					
					try{remember=request.getParameter("remember_count").toString();				
					}					
					catch(Exception e){}					
					if(remember.equals("on"))
					{
						//��ס�û���������
						String acc=URLEncoder.encode(request.getParameter("IDNumber"),"utf-8");//Ҫencode����Ȼaddcookie��ʧ��
						String pass=URLEncoder.encode(request.getParameter("passwd"),"utf-8");
						Cookie cookie_IDNumber=new Cookie("IDNumber",acc);
						Cookie cookie_passwd=new Cookie("passwd",pass);
						cookie_IDNumber.setMaxAge(7*24*60*60);//��Ч��7��
						cookie_passwd.setMaxAge(7*24*60*60);//��Ч��7��					
						response.addCookie(cookie_IDNumber);
						response.addCookie(cookie_passwd);						
					}	        
					response.sendRedirect("clientIndex.jsp");
				}
				else
				{
					response.sendRedirect("clientLogin.jsp?info=error");
				}
			}catch(Exception e){							
			}
		}
	}
}








