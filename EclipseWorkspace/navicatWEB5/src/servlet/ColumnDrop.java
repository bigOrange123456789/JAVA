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

@WebServlet("/ColumnDrop")
public class ColumnDrop extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");
		String columnName=request.getParameter("columnName");
		//String columnType=request.getParameter("columnType");
		
		Table describeTable=TableCreate.describeTable(user,pwd,port,database,tableName);
		String[][] describeTable_getData=describeTable.getData();		
		
		request.setAttribute("user", user);
		request.setAttribute("pwd", pwd);
		request.setAttribute("port", port);
		request.setAttribute("database", database);
		request.setAttribute("tableName", tableName);
		
		if(describeTable_getData.length==1){
			request.getRequestDispatcher("TableDrop").forward(request,response);
		}else {
			DBA dba=new DBA(user,pwd,port,database);
			dba.dropColumn(tableName,columnName);
			request.getRequestDispatcher("TableOpen").forward(request,response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
