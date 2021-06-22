package db;

import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mysql.jdbc.Connection;

public class InitDatabase {
/*
  数据库中的表名：file1
file1的列名：id  name  price  unit  stock
file1的列类型：char(10)
file1的字体格式：utf8
file2:user pwd
 * */
	
	public static void main(String[] args) {
		sql("create table file1(id char(100) primary key,name char(100),price char(100),unit char(100),stock char(100));");
		sql("alter table file1 convert to character set UTF8;");
		sql("create table file2(user char(100) primary key,pwd char(100));");
		sql("alter table file2 convert to character set UTF8;");
	}/**/
	public static void sql(String s){//测试PreparedStatement的用法
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","123456");
			ps=conn.prepareStatement(s);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(ps!=null)try{ps.close();}catch(Exception e){}
			if(conn!=null)try{conn.close();}catch(Exception e){}
		}
	}
}
