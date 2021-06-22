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

@WebServlet("/RowInsert")
public class RowInsert extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");
		Table describeTable=TableCreate.describeTable(user,pwd,port,database,tableName);
		Table dataTable=TableCreate.dataTable(user,pwd,port,database,tableName,describeTable);
		
		String[][] describeTable_getData=describeTable.getData();		
		String values="";
		for(int j=0;j<describeTable_getData.length;j++){
			//System.out.println(describeTable_getData[j][1]);
			if(j!=0)values=values+",";
			if(describeTable_getData[j][1].charAt(0)=='c')values=values+"'"+request.getParameter("n_x_"+j)+"'";
			else values=values+request.getParameter("n_x_"+j);
		}
		DBA dba=new DBA(user,pwd,port,database);
		dba.insert(tableName,values);
		
		
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
