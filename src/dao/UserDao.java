package dao;

import entity.Address;
import entity.User;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao  {


	/**
	 * 查找是否存在用户
	 * false——————没有
	 * true——————已经存在
	 * @param name
	 * @return
	 */

	public static boolean check_user(String name) {
		Connection con=null;
		try{
			con= Connect_Db.getConnection();
			String sql="select * from user where name=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, name);
			ResultSet rs=pst.executeQuery();
			if(rs.next()==false){
				return false;
			}else{
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			Connect_Db.closeConnection(con);
		}
	}



	/**
	 * 根据用户名查找密码
	 * @param name
	 * @return
	 */
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
				user.setIcon_url(rs.getString("icon_url"));
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

	/**
	 * 根据用户名获取用户头像的链接
	 */

	public static String Get_icon_url(String name)
	{
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
				return rs.getString("icon_url");
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			Connect_Db.closeConnection(con);
		}
	}






	/**
	 * 注册
	 * @param user
	 * @return
	 */

	public static boolean User_insert(User user){
		Connection c = null;
		try{
			c= Connect_Db.getConnection();
			String sql="insert into user(name,pwd,icon_url) values (?,?,?)";
			PreparedStatement pst=c.prepareStatement(sql);
			pst.setString(1,user.getName());
			pst.setString(2,user.getPwd());
			pst.setString(3,user.getIcon_url());
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
//		UserDao u=new UserDao();
//		User user=u.Get_User("admin");
//		System.out.println(user.getPwd());
//		user.setName("mjn");
//		user.setPwd("123456");
//		User_insert(user);
//		System.out.println(Get_icon_url("zfc"));
		String hz = "fashjasdads.jpg";
		String[] hz2 = hz.split("\\.");
		System.out.println(hz2[hz2.length-1].toString());






	}
}
