package dao;

import entity.Goods;
import entity.Indent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class IndentDao {
    /*
    * 根据订单号查询订单,一对一
    * */
    public static Indent indent_query(String indent_id) {
        Connection con = null;
        try{
            con = Connect_Db.getConnection();
            String sql="select * from indent where indent_id=?";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1,indent_id);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                Indent indent_1=new Indent();
                indent_1.setCreate_time(rs.getString("create_time"));
                indent_1.setGoods_kind(rs.getString("goods_kind"));
                indent_1.setMoney(rs.getString("money"));
                indent_1.setIndent_id(rs.getString("indent_id"));
                indent_1.setUser_name(rs.getString("user_name"));
                indent_1.setUser_address(rs.getString("user_address"));
                indent_1.setGoods_num(rs.getString("goods_num"));

                indent_1.setUser_address_all(rs.getString("user_address_all"));
                indent_1.setTel(rs.getString("user_tel"));
                indent_1.setAddress_who(rs.getString("address_who"));

                return indent_1;
            }
            else{
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            Connect_Db.closeConnection(con);
        }
    }

    /*
    * 根据用户名查询订单，一对多
    * */
    public static List<Indent> all_indent_query(String name) {
        Connection con = null;
        List<Indent> list = new ArrayList<Indent>();
        try{
            con = Connect_Db.getConnection();
            String sql="select * from indent where user_name=?";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1,name);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                Indent indent_1=new Indent();
                indent_1.setCreate_time(rs.getString("create_time"));
                indent_1.setGoods_kind(rs.getString("goods_kind"));
                indent_1.setMoney(rs.getString("money"));
                indent_1.setIndent_id(rs.getString("indent_id"));
                indent_1.setUser_name(rs.getString("user_name"));
                indent_1.setUser_address(rs.getString("user_address"));
                indent_1.setGoods_num(rs.getString("goods_num"));
                indent_1.setUser_address_all(rs.getString("user_address_all"));
                indent_1.setTel(rs.getString("user_tel"));
                indent_1.setAddress_who(rs.getString("address_who"));
                list.add(indent_1);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            Connect_Db.closeConnection(con);
        }
    }


    /*
    * 添加订单
    * */
    public static boolean indent_insert(Indent indent){
        Connection c = null;
        try{
            c= Connect_Db.getConnection();
            String sql="insert into indent(indent_id,create_time,money,goods_kind,user_name,user_address,user_address_all,user_tel,address_who,goods_num) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst=c.prepareStatement(sql);
            pst.setString(1,indent.getIndent_id());
            pst.setString(2,indent.getCreate_time());
            pst.setString(3,indent.getMoney());
            pst.setString(4,indent.getGoods_kind());
            pst.setString(5,indent.getUser_name());
            pst.setString(6,indent.getUser_address());
            pst.setString(7,indent.getUser_address_all());
            pst.setString(8,indent.getTel());
            pst.setString(9,indent.getAddress_who());
            pst.setString(10,indent.getGoods_num());
            pst.execute();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }finally{
            Connect_Db.closeConnection(c);
        }
    }


    public static void main(String[] args) throws Exception {


//        读取测试
//        Indent o = indent_query("20200429135233");
//        System.out.println(o.getCreate_time());
//        System.out.println(o.getGoods_kind());
//        System.out.println(o.getMoney());
//        System.out.println(o.getIndent_id());
//        System.out.println(o.getUser_name());
//        System.out.println(o.getUser_address());



//插入订单测试

        //生成订单时间
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        String date = df.format(new Date());
//        System.out.println("订单生成时间为："+date);
//       //订单号
//        long time = System.currentTimeMillis();
//        String indent_id = String.valueOf(time);
//        System.out.println("订单号为："+indent_id);
//        //做订单
//        Indent testI = new Indent();
//        testI.setCreate_time(date);
//        testI.setIndent_id(indent_id);
//
//        testI.setUser_address("熊出没大森林");
//        testI.setGoods_kind("可乐*3；小鱼干*1；");
//        testI.setMoney("36.33");
//        testI.setUser_name("杰瑞");
//        indent_insert(testI);
//
//        System.out.println("订单生成成功！！！");
        System.out.println(all_indent_query("admin"));
    }

}
