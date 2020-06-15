package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;


/**
 * Servlet implementation class LoginPost
 */
@WebServlet("/LoginPost")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**	
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		UserDao dao=new UserDao();
		User user=dao.Get_User(name);
		if(user==null){
			response.sendRedirect("index.jsp");
		}else if(!user.getPwd().equals(pwd)){
			response.sendRedirect("index.jsp");
		}else{
			System.out.println("登陆成功！！！");
			HttpSession session=request.getSession();
			session.setAttribute("name",name);
			//管理登陆
			session.setAttribute("sort","1");
			response.sendRedirect("index.jsp");
		}
		
	}

}
