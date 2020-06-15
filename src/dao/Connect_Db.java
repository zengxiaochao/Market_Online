package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect_Db {
    public static Connection getConnection() throws Exception {

        try {
            Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序
            System.out.println("加载驱动成功！");
        }
        catch (Exception e) {
            System.out.print("加载驱动失败！");
            e.printStackTrace();
        }
        try{
            Connection connect = DriverManager.getConnection("localhost:3306/market?useUnicode=true&characterEncoding=utf-8&useSSL=false","mall_admin","Aa123456");
            System.out.println("成功连接数据库！");
            return connect;
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("未能连接数据库！");
            return null;
        }
    }
    public static void closeConnection(Connection c){
        try{
            c.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws Exception {
        System.out.println("连接"+Connect_Db.getConnection());
    }
}
