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


@WebServlet("/TableOpen")
public class TableOpen extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.print(0);
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");
		//System.out.print(1);
		Table describeTable=TableCreate.describeTable(user,pwd,port,database,tableName);
		String[][] describeTable_getData=describeTable.getData();
		DBA dba=new DBA(user,pwd,port,database);
		dba.sql("alter table "+tableName+" convert to character set UTF8;");
		for(int i=0;i<describeTable_getData.length;i++){
			if(describeTable_getData[i][1].charAt(0)=='c')dba.initColumn(tableName,describeTable_getData[i][0],"''");
			else dba.initColumn(tableName,describeTable_getData[i][0],"0");
		}
		//initColumn(String tableName,String columnName,String value)
		
		Table dataTable=TableCreate.dataTable(user,pwd,port,database,tableName,describeTable);
		//System.out.print(2);
		request.setAttribute("user", user);
		request.setAttribute("pwd", pwd);
		request.setAttribute("port", port);
		request.setAttribute("database", database);
		request.setAttribute("tableName", tableName);
		request.setAttribute("describeTable",describeTable);
		//System.out.print(3);
		//System.out.println(dataTable.getData().length);//当表中没有数据时这里为零
		request.setAttribute("dataTable",dataTable);
		//System.out.println(4);
		request.getRequestDispatcher("openTable.jsp").forward(request,response);
		//request.getRequestDispatcher("allTable.jsp").forward(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
