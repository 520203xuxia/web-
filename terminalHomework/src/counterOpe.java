import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class counterOpe extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
				doPost(request,response);
			}
			public void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
				response.setContentType("text/html;charset=utf-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out=response.getWriter();
				String type=request.getParameter("type");
				out.print(type);
			}
}
