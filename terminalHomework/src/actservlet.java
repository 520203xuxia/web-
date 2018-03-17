import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(
        name = "actServlet"
)
public class actservlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = null;
        String username = request.getParameter("username");
        String IDNumber = request.getParameter("IDNumber");
        //从数据库中获取该用户信息
        String sql="select username,flag from clients where IDNumber=? and username=?";
        ResultSet rs=null;
        try{
        	ps = conn.prepareStatement(sql);
        	ps.setString(1, IDNumber);
        	ps.setString(2, username);
        	rs=ps.executeQuery();
        	if(rs.next())//如果此账号被注册了
        	{
        		if(rs.getString(2).equals("1"))//如果账号被激活过了
        		{
        			response.sendRedirect("validate_error.jsp?error=had_been_validate");
        		}
        		else//如果没有被激活
        		{
        			 UserDao userDao = new UserDao();
        		     Date date = new Date();
        		     Date date1 = userDao.select(IDNumber);
        		     long nowtime = date.getTime() / 1000L;
        		     long addtime = date1.getTime() / 1000L; 
        		     if (nowtime - addtime > 108000L) {//超过48小时未激活，会删除此账号
        		            userDao.delete(IDNumber);
        		            response.sendRedirect("validate_error.jsp?error=over_time");
        		     }
        		     else//如果在48小时以内激活
        		     {
        		    	 userDao.update(IDNumber);
        		    	 response.sendRedirect("validate_success.jsp");
        		     }
        		     
        		     
        		}
        	}
        	else//如果此账号没有被注册
        	{
        		response.sendRedirect("validate_error.jsp?error=no_register");
        		
        	}
        }catch(Exception e){}
        
        
        
        
        /*HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");   
        UserDao userDao = new UserDao();
        Date date = new Date();
        Date date1 = userDao.select(IDNumber);
        long nowtime = date.getTime() / 1000L;
        long addtime = date1.getTime() / 1000L;  
        //user.getEmail();
        if (nowtime - addtime > 108000L) {
            userDao.delete(IDNumber);
            response.sendRedirect("validate_error.jsp");
        }
        else if (user.getIDNumber().equals(IDNumber) && user.getUsername().equals(username)) {
            userDao.update(IDNumber);
            response.sendRedirect("clientLogin.jsp");
        } else {
            response.sendRedirect("validate_error.jsp");
        }*/

    }
}
