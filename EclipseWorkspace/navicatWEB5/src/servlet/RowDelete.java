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

@WebServlet("/RowDelete")
public class RowDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data_index=request.getParameter("data_index");
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");
		Table describeTable=TableCreate.describeTable(user,pwd,port,database,tableName);
		Table dataTable=TableCreate.dataTable(user,pwd,port,database,tableName,describeTable);
		String[][] describeTable_getData=describeTable.getData();	
		String[][] data=dataTable.getData();	
		//String[] row=new String[describeTable_getData.length];
		//for(int j=0;j<describeTable_getData.length;j++)
		//	row[j]=data[Integer.parseInt(data_index)][j];
		String condition="";
		for(int j=0;j<describeTable_getData.length;j++){
			if(j!=0){
				condition=condition+"&&";
			} 
			if(describeTable_getData[j][1].charAt(0)=='c')condition=condition+describeTable_getData[j][0]+"='"+data[Integer.parseInt(data_index)][j]+"'";
			else condition=condition+describeTable_getData[j][0]+"="+data[Integer.parseInt(data_index)][j];
		}
		
		DBA dba=new DBA(user,pwd,port,database);
		dba.delete(tableName,condition);
		
		//更新数据（因为删除后数据会少一行）
		//dataTable=TableCreate.dataTable(user,pwd,port,database,tableName,describeTable);
		
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
