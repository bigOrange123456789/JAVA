package db;

import java.sql.DriverManager;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class test {
	public static void main(String[]arcg){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			Statement ps=(Statement) conn.createStatement();
			ps.execute("create table f(id char(10));");
		}catch(Exception e){}
	}
	
}
