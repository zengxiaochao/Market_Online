package dao;

import entity.Address;
import entity.Indent;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AddressDao {


    /**
     * 根据用户名查找地址
     */

    public static Address Get_Address(String name) {
        Connection con=null;
        try{
            con= Connect_Db.getConnection();
            String sql="select * from imf where name=?";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs=pst.executeQuery();
            if(rs.next()==false){
                return null;
            }else{
                Address address=new Address();
                address.setAddress(rs.getString("address"));
                address.setAddress_all(rs.getString("address_all"));
                address.setAddress_who(rs.getString("address_who"));
                address.setName(rs.getString("name"));
                address.setTel(rs.getString("tel"));
                return address;
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            Connect_Db.closeConnection(con);
        }
    }

    /**
     * 添加新地址
     * @param address
     * @return
     */
    public static boolean Address_insert(Address address){
        Connection c = null;
        try{
            c= Connect_Db.getConnection();
            String sql="insert into imf(name,address,tel,address_all,address_who) values (?,?,?,?,?)";
            PreparedStatement pst=c.prepareStatement(sql);
            pst.setString(1,address.getName());
            pst.setString(2,address.getAddress());
            pst.setString(3,address.getTel());
            pst.setString(4,address.getAddress_all());
            pst.setString(5,address.getAddress_who());

            pst.execute();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }finally{
            Connect_Db.closeConnection(c);
        }
    }
    public static void main(String[] args) {
        Address a = Get_Address("曾凡超");
        System.out.println(a.getAddress_all());

    }

}
