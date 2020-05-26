
import java.sql.*;

public class test_main {
    public static void main(String args[]) {
        try {
            Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序
            System.out.println("加载驱动成功！");
        }
        catch (Exception e) {
            System.out.print("加载驱动失败！");
            e.printStackTrace();
        }
        try {
            Connection connect = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8&useSSL=false","root","123456");
            //连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密
            System.out.println("成功连接数据库！");

        }
        catch (Exception e) {
            System.out.print("get data error!");
            e.printStackTrace();
        }
    }
}
 
 