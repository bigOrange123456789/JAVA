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

@WebServlet("/ColumnAdd")
public class ColumnAdd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");
		String columnName=request.getParameter("columnName");
		String columnType=request.getParameter("columnType");
		//Table describeTable=TableCreate.describeTable(user,pwd,port,database,tableName);
		//Table dataTable=TableCreate.dataTable(user,pwd,port,database,tableName,describeTable);
		
		//String[][] describeTable_getData=describeTable.getData();		
		
		DBA dba=new DBA(user,pwd,port,database);
		dba.addColumn(tableName,columnName,columnType);//addColumn(String tableName,String columnName,String columnType)
		
		
		request.setAttribute("user", user);
		request.setAttribute("pwd", pwd);
		request.setAttribute("port", port);
		request.setAttribute("database", database);
		request.setAttribute("tableName", tableName);
		//request.setAttribute("describeTable",describeTable);
		//request.setAttribute("dataTable",dataTable);
		request.getRequestDispatcher("TableOpen").forward(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
