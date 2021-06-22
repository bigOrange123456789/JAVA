package db;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBA_BASE {
	public static void addBase_file1(String id,String stock1){
		String stock2="";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement("select stock from file1 where id=?;");
			ps.setString(1,id);
			rs=ps.executeQuery();
			if(rs.next())stock2=rs.getNString(1);
			stock2=(Double.parseDouble(stock1)+Double.parseDouble(stock2))+"";
			ps=conn.prepareStatement("update file1  set stock=? where id=?;");
			ps.setString(1,stock2);
			ps.setString(2,id);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{//πÿ±’À≥–ÚResultSet Statement Connection
			if(rs!=null)
				try {rs.close();} catch (SQLException e) {}
			if(ps!=null)
				try {ps.close();} catch (SQLException e) {}
			if(conn!=null)
				try {conn.close();} catch (SQLException e) {}
		}
	}

}
