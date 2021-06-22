package db;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBA_file2 {
	public static void delete_file2(String id){
        Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement("delete from file2 where user=?;");
			ps.setString(1, id);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ps!=null)
				try {ps.close();} catch (SQLException e) {}
			if(conn!=null)
				try {conn.close();} catch (SQLException e) {}
		}
	}
	public static String[][] selectPSW(String user){
		return select("select*from file2 where user="+"'"+user+"'",2);
	}
	public static String[][] select(String sql,int numC){
		String[][] data=null;//数据
		//int numC=5;
		int numR=0;
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())numR++;
			rs=ps.executeQuery();
			data=new String[numR][numC];
			for(int j=1;rs.next();j++)
				for(int i=1;i<=numC;i++)
					data[j-1][i-1]=rs.getString(i);
		}catch(Exception e){
			e.printStackTrace();
		}finally{//关闭顺序ResultSet Statement Connection
			if(rs!=null)
				try {rs.close();} catch (SQLException e) {}
			if(ps!=null)
				try {ps.close();} catch (SQLException e) {}
			if(conn!=null)
				try {conn.close();} catch (SQLException e) {}
		}
		return data;
	}
	public static String[][] selectAll_file2(){
		return select("select*from file2;",2);
	}
	public static void update_file2(String user,String pwd){
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement("update file2 set pwd='"+pwd+"' where user='"+user+"'");
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{//关闭顺序ResultSet Statement Connection
			if(ps!=null)
				try {ps.close();} catch (SQLException e) {}
			if(conn!=null)
				try {conn.close();} catch (SQLException e) {}
		}
	}
	//update_file2(user,textField.getText())
	public static void insert_file2(String user,String pwd){
        //"insert into file1 values('?','?','?','?');"
		//这一句现在没用了unit=select.file1_unit_name2id(unit);

        Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			//ps=conn.prepareStatement("insert into file1 values('0005','(大瓶)雪碧','8','1');");
			ps=conn.prepareStatement("insert into file2 values(?,?);");
			ps.setString(1, user);
			ps.setString(2, pwd);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ps!=null)
				try {ps.close();} catch (SQLException e) {}
			if(conn!=null)
				try {conn.close();} catch (SQLException e) {}
		}
	}

}
