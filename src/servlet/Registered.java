package servlet;

import dao.AddressDao;
import dao.UserDao;
import entity.Address;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Registered")
public class Registered extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registered() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String re_name=request.getParameter("re_name");
        String re_pwd=request.getParameter("re_pwd");
        String re_tel=request.getParameter("re_tel");
        String re_address=request.getParameter("re_address");
        String re_address_all=request.getParameter("re_address_all");
        String re_address_who=request.getParameter("re_address_who");



        //更新注册时的账号验证
        if(UserDao.check_user(re_name)==true)
        {
            System.out.println("注册用户已存在！！！");
            HttpSession session=request.getSession();
            session.setAttribute("check_user",re_name);
            response.sendRedirect("check_user.jsp");
        }


        else{
            User user = new User();
            Address address = new Address();
            user.setPwd(re_pwd);
            user.setName(re_name);
            address.setName(re_name);
            address.setTel(re_tel);
            address.setAddress(re_address);
            address.setAddress_all(re_address_all);
            address.setAddress_who(re_address_who);
            UserDao.User_insert(user);
            AddressDao.Address_insert(address);
            response.sendRedirect("index.jsp");
        }

    }
}
