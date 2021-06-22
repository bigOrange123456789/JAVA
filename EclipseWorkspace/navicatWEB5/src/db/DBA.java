package db;

import java.sql.*;


public class DBA extends DBA2{
	public DBA(String database){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database,"root","123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public DBA(String user,String pwd,String port,String database){//DBA dba=new DBA(user,pwd,port,database);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:"+port+"/"+database,user,pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
