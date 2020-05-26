package dao;

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

	public static void main(String[] args) {
		UserDao u=new UserDao();
		User user=u.Get_User("admin");
		System.out.println(user.getPwd());
	}
}
