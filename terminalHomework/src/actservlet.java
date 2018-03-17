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
        //�����ݿ��л�ȡ���û���Ϣ
        String sql="select username,flag from clients where IDNumber=? and username=?";
        ResultSet rs=null;
        try{
        	ps = conn.prepareStatement(sql);
        	ps.setString(1, IDNumber);
        	ps.setString(2, username);
        	rs=ps.executeQuery();
        	if(rs.next())//������˺ű�ע����
        	{
        		if(rs.getString(2).equals("1"))//����˺ű��������
        		{
        			response.sendRedirect("validate_error.jsp?error=had_been_validate");
        		}
        		else//���û�б�����
        		{
        			 UserDao userDao = new UserDao();
        		     Date date = new Date();
        		     Date date1 = userDao.select(IDNumber);
        		     long nowtime = date.getTime() / 1000L;
        		     long addtime = date1.getTime() / 1000L; 
        		     if (nowtime - addtime > 108000L) {//����48Сʱδ�����ɾ�����˺�
        		            userDao.delete(IDNumber);
        		            response.sendRedirect("validate_error.jsp?error=over_time");
        		     }
        		     else//�����48Сʱ���ڼ���
        		     {
        		    	 userDao.update(IDNumber);
        		    	 response.sendRedirect("validate_success.jsp");
        		     }
        		     
        		     
        		}
        	}
        	else//������˺�û�б�ע��
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
