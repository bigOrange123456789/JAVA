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

@WebServlet("/TableInit")
public class TableInit extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		String tableName=request.getParameter("tableName");
		
		//System.out.println("Servlet**************TableInit");
		DBA dba=new DBA(user,pwd,port,database);
		dba.createTable(tableName);//createTable(String tableName)
		
		
		request.setAttribute("user", user);
		request.setAttribute("pwd", pwd);
		request.setAttribute("port", port);
		request.setAttribute("database", database);
		request.setAttribute("tableName", tableName);
		//request.setAttribute("describeTable",describeTable);
		//request.setAttribute("dataTable",dataTable);
		request.getRequestDispatcher("Welcome").forward(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
