package db;
//select
public class DBA1 extends DBA0{
	public String[] query(String sql){
		String[] s=null;
		try {
			ps=conn.prepareStatement(sql);
			int length=0;
			for(rs=ps.executeQuery();rs.next();length++);
			s=new String[length];
			rs=ps.executeQuery();
			for(int i=0;rs.next();i++)s[i]=rs.getNString(1);
		}catch(Exception e){
		}
		return s;
	}
	public String[] showTables(){
		return query("show tables");
	}
	public String[][] describeTable(String TableName){
		String[][] s=null;
		try {
			ps=conn.prepareStatement("describe "+TableName);
			int length=0;
			for(rs=ps.executeQuery();rs.next();length++);
			s=new String[length][6];
			rs=ps.executeQuery();
			for(int i=0;rs.next();i++) 
				for(int j=0;j<6;j++)
					s[i][j]=rs.getNString(j+1);
		}catch(Exception e){
		}
		return s;
	}
	public String[][] queryTable(String TableName,int colNum){
		String[][] s=null;
		try {
			ps=conn.prepareStatement("select*from "+TableName);
			int length=0;
			for(rs=ps.executeQuery();rs.next();length++);
			s=new String[length][colNum];
			rs=ps.executeQuery();
			for(int i=0;rs.next();i++) 
				for(int j=0;j<colNum;j++)
					 if (rs.getObject(j+1) instanceof Integer)s[i][j]=""+(int)rs.getObject(j+1);
					 else s[i][j]=(String)rs.getObject(j+1);
		}catch(Exception e){}
		return s;
	}
}
