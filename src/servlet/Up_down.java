package servlet;

import dao.GoodsDao;
import entity.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Up_down")
public class Up_down extends HttpServlet {

    public Up_down()
    {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String re_name=request.getParameter("name");
        System.out.println(re_name);
        Goods g = GoodsDao.goods_query(re_name);
        if(g.getProject_deleted().equals("0"))
            GoodsDao.goods_ud(g,"1");
        else
            GoodsDao.goods_ud(g,"0");
        response.sendRedirect("admin.jsp");
    }
}

