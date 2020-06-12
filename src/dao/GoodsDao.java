package dao;

import entity.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GoodsDao {

    /*
     * 根据编号查找货物
     * */
    public static Goods goods_query_id(int id) {
        Connection c = null;
        try {
            c = Connect_Db.getConnection();
            String sql = "select * from goods where goods_id=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Goods g = new Goods();
                g.setGoods_name(rs.getString("goods_name"));
                g.setPrice(rs.getDouble("price"));
                g.setNum(rs.getInt("num"));
                g.setProject_id(rs.getInt("goods_id"));
                g.setProject_deleted(rs.getString("goods_deleted"));
                g.setSales(rs.getInt("sales"));
                g.setDetails_img_url(rs.getString("details_img_url"));
                g.setDetails_text(rs.getString("details_text"));
                g.setIcon_url(rs.getString("icon_url"));
                g.setSpec(rs.getString("spec"));
                return g;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Connect_Db.closeConnection(c);
        }
    }
    /*
     * 根据名字查找货物
     * */
    public static Goods goods_query(String name) {
        Connection c = null;
        try {
            c = Connect_Db.getConnection();
            String sql = "select * from goods where goods_name=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Goods g = new Goods();
                g.setGoods_name(rs.getString("goods_name"));
                g.setPrice(rs.getDouble("price"));
                g.setNum(rs.getInt("num"));
                g.setProject_id(rs.getInt("goods_id"));
                g.setProject_deleted(rs.getString("goods_deleted"));
                g.setSales(rs.getInt("sales"));
                g.setDetails_img_url(rs.getString("details_img_url"));
                g.setDetails_text(rs.getString("details_text"));
                g.setIcon_url(rs.getString("icon_url"));
                g.setSpec(rs.getString("spec"));
                return g;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Connect_Db.closeConnection(c);
        }
    }

    /*
     * 查找返回整张表的数据
     * */
    public static List<Goods> allgoods_query() {
        Connection c = null;
        List<Goods> list = new ArrayList<Goods>();
        try {
            c = Connect_Db.getConnection();
            String sql = "select * from goods";
            PreparedStatement pst = c.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Goods g = new Goods();
                g.setGoods_name(rs.getString("goods_name"));
                g.setPrice(rs.getDouble("price"));
                g.setNum(rs.getInt("num"));
                g.setSales(rs.getInt("sales"));
                g.setDetails_img_url(rs.getString("details_img_url"));
                g.setDetails_text(rs.getString("details_text"));
                g.setIcon_url(rs.getString("icon_url"));
                g.setSpec(rs.getString("spec"));
                g.setProject_id(rs.getInt("goods_id"));
                g.setProject_deleted(rs.getString("goods_deleted"));
                list.add(g);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Connect_Db.closeConnection(c);
        }
    }

    /*
     * 货物添加
     * */
    public static boolean goods_insert(Goods goods) {
        Connection c = null;
        try {
            c = Connect_Db.getConnection();
            String sql = "insert into goods(goods_name,price,num,sales) values (?,?,?,?)";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, goods.getGoods_name());
            pst.setDouble(2, goods.getPrice());
            pst.setInt(3, goods.getNum());
            pst.setInt(4, goods.getSales());
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            Connect_Db.closeConnection(c);
        }
    }

    /*
     * 更改货物属性
     * */
    public static boolean goods_update(Goods goods) {
        String name = goods.getGoods_name();
        Connection c = null;
        try {
            c = Connect_Db.getConnection();
            String sql = "update goods set goods_name=?,price=?,num=?,sales=? where goods_name=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, goods.getGoods_name());
            pst.setDouble(2, goods.getPrice());
            pst.setInt(3, goods.getNum());
            pst.setInt(4, goods.getSales());
            pst.setString(5, goods.getGoods_name());
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            Connect_Db.closeConnection(c);
        }
    }

    /*
     * 货物删除
     * */
    public static boolean goods_delete(String name) {
        Connection c = null;
        try {
            c = Connect_Db.getConnection();
            String sql = "delete from goods where goods_name=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, name);
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            Connect_Db.closeConnection(c);
        }
    }




    public static void main(String[] args) {
        Goods g = new Goods();
        g.setGoods_name("好丽友派");
        g.setNum(120);
        g.setPrice(39.99);
        g.setSales(5);
//        System.out.println(goods_insert(g));
//        System.out.println(goods_delete("魔法师方便面"));
//        System.out.println(goods_update(g));
        Goods g2 = goods_query("脉动");
        System.out.println(g2.getGoods_name());
        System.out.println(g2.getPrice());
        System.out.println(g2.getNum());
        System.out.println(g2.getSales());

//        System.out.println(allgoods_query());
    }
}
