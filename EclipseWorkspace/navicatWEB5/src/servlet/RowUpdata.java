package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBA;
import model.Table;
import model.TableCreate;

@WebServlet("/RowUpdata")
public class RowUpdata extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String n=request.getParameter("n");
		System.out.println("n:"+n);
		String n0=request.getParameter("n0");
		System.out.println("n0:"+n0);
		String n1=request.getParameter("n1");
		System.out.println("n1:"+n1);*/
		String data_index=request.getParameter("data_index");
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");//这里为空了
		//String condition=request.getParameter("condition");
		//System.out.println(condition);
		//System.out.println(0);//这里执行了
		//System.out.print(user+","+pwd+","+port+","+database+","+tableName);//这里执行了
		Table describeTable=TableCreate.describeTable(user,pwd,port,database,tableName);
		//System.out.print(1);//这里没有执行
		Table dataTable=TableCreate.dataTable(user,pwd,port,database,tableName,describeTable);
		//System.out.print(2);
		String[][] describeTable_getData=describeTable.getData();	
		//System.out.print(3);
		String[][] data=dataTable.getData();	
		//System.out.println(4);
		String condition="";
		for(int j=0;j<describeTable_getData.length;j++) {
			if(j!=0) condition=condition+"&&";
			if(describeTable_getData[j][1].charAt(0)=='c')condition=condition+describeTable_getData[j][0]+"='"+data[Integer.parseInt(data_index)][j]+"'";
			else condition=condition+describeTable_getData[j][0]+"="+data[Integer.parseInt(data_index)][j];
		}
		
		/*String set="";//UPDATE table1 set fristName='jj'，lastName='tt' where Id=1
		for(int j=0;j<describeTable_getData.length;j++) {
			if(j!=0) set=set+",";
			if(describeTable_getData[j][1].charAt(0)=='c')set=set+describeTable_getData[j][0]+"='"+data[Integer.parseInt(data_index)][j]+"'";
			else set=set+describeTable_getData[j][0]+"="+data[Integer.parseInt(data_index)][j];
		}*/
		//String[][] describeTable_getData=describeTable.getData();		
		String set="";
		for(int j=0;j<describeTable_getData.length;j++){
			//System.out.println(describeTable_getData[j][1]);
			if(j!=0)set=set+",";
			if(describeTable_getData[j][1].charAt(0)=='c')set=set+describeTable_getData[j][0]+"="+"'"+request.getParameter("n__"+j)+"'";
			else set=set+describeTable_getData[j][0]+"="+request.getParameter("n__"+j);
		}
		DBA dba=new DBA(user,pwd,port,database);
		dba.update(tableName,set,condition);
		//update(String tableName,String set,String condition)
		
		
		request.setAttribute("user", user);
		request.setAttribute("pwd", pwd);
		request.setAttribute("port", port);
		request.setAttribute("database", database);
		request.setAttribute("tableName", tableName);
		//request.setAttribute("describeTable",describeTable);
		//request.setAttribute("dataTable",dataTable);
		request.getRequestDispatcher("TableOpen").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
