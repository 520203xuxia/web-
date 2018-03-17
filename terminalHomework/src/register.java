
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class register extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();		
		String IDNumber=request.getParameter("IDNumber");
		String username=new String (request.getParameter("username").getBytes("iso-8859-1"),"utf-8"); 
		String passwd=request.getParameter("passwd");		
		String email=request.getParameter("email");				
		String code="";	
		HttpSession sessioncode=request.getSession();
		String randStr=(String)sessioncode.getAttribute("randStr");
		code=new String(request.getParameter("code").getBytes("iso-8859-1"),"utf-8");	
		if(!code.equals(randStr))
		{				
			response.sendRedirect("register.jsp?info=codeerror");
		}		
		String time = Time.getDate();
		User user = new User();
		user.setIDNumber(IDNumber);
        user.setUsername(username);
        user.setPasswd(passwd);
        user.setEmail(email);
        user.setFlag("0");
        user.setDate(time);
        UserDao userdao = new UserDao();
        int i=userdao.add(user);
        if(i==0)
        	{
        		response.sendRedirect("register.jsp?info=iderror");
        		return;
        	}
       /* HttpSession session = request.getSession();
        session.setAttribute("user", user);       */
        else
        	{
	        	SendMail.sendMail(user.getIDNumber(), user.getUsername(),email);
		        RequestDispatcher rd=request.getRequestDispatcher("clientLogin.jsp");
		        try{
		        	rd.forward(request, response);
		        	return;
		        }catch(Exception e){}
        	}
		
	}
}








