package db;

public class DBA2 extends DBA1{
//行的增加、删除、更新
	public void insert(String tableName,String values){
		//System.out.println("DBA2-insert:"+"insert into "+tableName+" values("+values+");");
		sql("insert into "+tableName+" values("+values+");");
	}
	public void delete(String tableName,String condition){
		//System.out.println("DBA2-insert:"+"insert into "+tableName+" values("+values+");");
		//"delete from t1 where id='4'"
		//System.out.println("delete from "+tableName+" where "+condition+";");
		sql("delete from "+tableName+" where "+condition+";");
	}
	public void update(String tableName,String set,String condition){
		//UPDATE table1 set fristName='jj'，lastName='tt' where Id=1
		//System.out.println("update "+tableName+" set "+set+" where "+condition+";");
		sql("update "+tableName+" set "+set+" where "+condition+";");
	}
//列的增加、删除、初始化
	public void addColumn(String tableName,String columnName,String columnType){
		//alter table TABLE_NAME add column NEW_COLUMN_NAME varchar(20) not null;
		//System.out.println("alter table "+tableName+" add column "+columnName+" "+columnType+";");
		sql("alter table "+tableName+" add column "+columnName+" "+columnType+";");
	}
	public void dropColumn(String tableName,String columnName){
		//alter table yusheng drop column def ;
		//System.out.println("alter table "+tableName+" drop column "+columnName);
		sql("alter table "+tableName+" drop column "+columnName);
	}
	public void initColumn(String tableName,String columnName,String value){
		sql("update "+tableName+" set "+columnName+"="+value+" where "+columnName+" is null;");
	}
//表的创建、删除
	public void createTable(String tableName){
		//create table tableName(default char(10));
		//System.out.println("create table "+tableName+" (defaultColumn char(10));");
		sql("create table "+tableName+" (defaultColumn char(10));");
	}
	public void dropTable(String tableName){
		//DROP TABLE table_name ;
		//System.out.println("drop table "+tableName);
		sql("drop table "+tableName);
	}
}
