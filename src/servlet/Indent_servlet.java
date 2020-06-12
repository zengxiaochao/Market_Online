package servlet;

import dao.AddressDao;
import dao.IndentDao;
import entity.Address;
import entity.Indent;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Indent_servlet")
public class Indent_servlet extends HttpServlet {

    public Indent_servlet(){
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String buy_num = request.getParameter("buy_num");
        String prize = request.getParameter("prize");
        String goods_name = request.getParameter("goods_name");




        HttpSession session = request.getSession();
        String user_name = (String) session.getAttribute("name");
        Address address = AddressDao.Get_Address(user_name);
        String tel = address.getTel();
        String address_1 = address.getAddress();
        String address_all = address.getAddress_all();
        String address_who = address.getAddress_who();






        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());
        long time = System.currentTimeMillis();
        String indent_id = String.valueOf(time);
        Indent indent = new Indent();

        indent.setUser_name(user_name);
        indent.setMoney(prize);
        indent.setGoods_kind(goods_name);
        indent.setUser_address_all(address_all);
        indent.setCreate_time(date);
        indent.setIndent_id(indent_id);
        indent.setUser_address(address_1);
        indent.setAddress_who(address_who);
        indent.setTel(tel);
        indent.setGoods_num(buy_num);
        IndentDao.indent_insert(indent);
        response.sendRedirect("index.jsp");
    }
}
