package model;

import db.DBA;

public class TableCreate {
	public static Table describeTable(String user,String pwd,String port,String database,String tableName){
		DBA dba=new DBA(user,pwd,port,database);
		String[][] s=dba.describeTable(tableName);
		String[][] data=new String[s.length][6];//s.length¿ÉÄÜÎª0
		for(int i=0;i<s.length;i++){
			for(int j=0;j<6;j++){
				data[i][j]=s[i][j];
			}
		}
		String[] title= {"Field","Type","Null","Key","Default","Extra"};
		return new Table(title,data);
	}
	public static Table dataTable(String user,String pwd,String port,String database,String tableName,Table describeTable){
		DBA dba=new DBA(user,pwd,port,database);
		String[][] describeTable_data=describeTable.getData();
		
		String[] title=new String[describeTable_data.length]; //{"Field","Type","Null","Key","Default","Extra"};
		for(int i=0;i<describeTable_data.length;i++){
			title[i]=describeTable_data[i][0];
		}
		String[][] data=dba.queryTable(tableName,describeTable_data.length);
		return new Table(title,data);
	}

}
