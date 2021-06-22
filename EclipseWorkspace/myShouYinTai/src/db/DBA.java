package db;

import java.awt.Frame;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableColumn;

import ui.Panel;

import com.mysql.jdbc.Connection;

public class DBA extends DBA_file2{
	public static void updata_file1(String id,int n,String s){
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			if(n==1)ps=conn.prepareStatement("update file1 set id=? where id=?;");
			else if(n==2)ps=conn.prepareStatement("update file1 set name=? where id=?;");
			else if(n==3)ps=conn.prepareStatement("update file1 set price=? where id=?;");
			else ps=conn.prepareStatement("update file1 set unit=? where id=?;");
			ps.setString(1, s);
			ps.setString(2, id);
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
	public static void delete_file1(String id){
        Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement("delete from file1 where id=?;");
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
	public static void insert_file1(String id,String name,String price,String unit){
        //"insert into file1 values('?','?','?','?');"
		//这一句现在没用了unit=select.file1_unit_name2id(unit);

        Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			//ps=conn.prepareStatement("insert into file1 values('0005','(大瓶)雪碧','8','1');");
			ps=conn.prepareStatement("insert into file1 values(?,?,?,?,'0');");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, price);
			ps.setString(4, unit);
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
	
	public static String[][] selectAll_file1(){
		return select("select*from file1;",5);
	}
	

}
