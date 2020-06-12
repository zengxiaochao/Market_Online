package dao;

import entity.Address;
import entity.User;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao  {
/*
* 	根据用户名查找密码
* */
	public User Get_User(String name) {
		Connection con=null;
		try{
			con= Connect_Db.getConnection();
			String sql="select * from user where name=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, name);
			ResultSet rs=pst.executeQuery();
			if(rs.next()==false){
				return null;
			}else{
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				return user;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			Connect_Db.closeConnection(con);
		}
	}



	public static boolean User_insert(User user){
		Connection c = null;
		try{
			c= Connect_Db.getConnection();
			String sql="insert into user(name,pwd) values (?,?)";
			PreparedStatement pst=c.prepareStatement(sql);
			pst.setString(1,user.getName());
			pst.setString(2,user.getPwd());
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
		UserDao u=new UserDao();
		User user=u.Get_User("admin");
		System.out.println(user.getPwd());
		user.setName("mjn");
		user.setPwd("123456");
		User_insert(user);
	}
}
