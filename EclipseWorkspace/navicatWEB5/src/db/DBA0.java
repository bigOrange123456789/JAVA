package db;

import java.sql.*;



public class DBA0 {
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public void close(){
		if(rs!=null)
			try {rs.close();} catch (SQLException e) {}
		if(ps!=null)
			try {ps.close();} catch (SQLException e) {}
		if(conn!=null)
			try {conn.close();} catch (SQLException e) {}
	}
	public void sql(String sql){
		try {
			ps=conn.prepareStatement(sql);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
