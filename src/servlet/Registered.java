package servlet;

import dao.AddressDao;
import dao.UserDao;
import entity.Address;
import entity.User;
import javafx.application.Application;
import org.apache.catalina.core.ApplicationPart;

import javax.servlet.ServletException;  
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Registered")
@MultipartConfig()
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
        String icon_url="./image/head.jpg";

        //上传的头像资源获取
        String path = this.getServletContext().getRealPath("/");
        Part p = request.getPart("file1");
        if(p.getContentType().contains("image")){
            ApplicationPart ap = (ApplicationPart) p;

            //文件名
            String hz = ap.getSubmittedFileName();
            String[] hz2 = hz.split("\\.");
            System.out.println(hz2[hz2.length-1].toString());
            String fname1 = re_name+"."+hz2[hz2.length-1].toString();


            int path_idx = fname1.lastIndexOf("\\")+1;
            String fname2 = fname1.substring(path_idx,fname1.length());
            p.write(path+"/image/user_icon/"+fname2);
            icon_url = "./image/user_icon/"+fname2;
            System.out.println("文件上传成功！");
        }

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
            user.setIcon_url(icon_url);
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
