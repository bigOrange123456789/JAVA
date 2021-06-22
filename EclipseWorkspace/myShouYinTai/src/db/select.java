package db;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import panel.BFUpdate2;

import com.mysql.jdbc.Connection;

public class select {
	public static String[] s(String id,String sell){//sell是本次交易的销售数量
		String[] s=new String[5];
		String stock="";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement("select*from file1 where id=?;");
			ps.setString(1,id);
			rs=ps.executeQuery();
			if(rs.next()){
				s[0]=rs.getNString(1);
				s[1]=rs.getNString(2);
				s[2]=rs.getNString(3);
				s[3]=rs.getNString(4);
				stock=rs.getNString(5);
			}
			stock=""+(Double.parseDouble(stock)-Double.parseDouble(sell));
			ps=conn.prepareStatement("update file1  set stock=? where id=?;");
			ps.setString(1,stock);
			ps.setString(2,id);
			ps.execute();
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
		return s;
	}
	public static void select_BFUpdate2(BFUpdate2 frame){
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement("select*from file1 where id=?;");
			ps.setString(1, frame.id);
			rs=ps.executeQuery();
			if(rs.next()){
				frame.initLable(frame.lable1,"条形码  "+rs.getNString(1),50,10);
				frame.initLable(frame.lable2,"名 称  "+rs.getNString(2),50,110);
				frame.initLable(frame.lable3,"价 格  "+rs.getNString(3),50,210);
				frame.initLable(frame.lable4,"单 位  "+rs.getNString(4),50,310);
			}
				
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
	}
	
	public static String file1_unit_name2id(String name){
		//这个方法现在没用了
		String id=null;
		String sql="select id from unit where name='"+name+"';";
		
		int numR=1;int numC=1;
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())id=rs.getNString(1);
			
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
		return id;
	}

	public static String[][] select(String sql,int numC,String name){
		String[][] data=null;//数据
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
			System.out.println(numR);
			System.out.println(numC);
			data=new String[numR][numC];
			for(int j=1;rs.next();j++){
				for(int i=1;i<=numC;i++){
					data[j-1][i-1]=rs.getString(i);
					System.out.print(data[j-1][i-1]);
				}
				System.out.println();
			}	
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

}
