package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBA;
import model.Table;

@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String port=request.getParameter("port");
		String database=request.getParameter("database");
		//DBA_Bean dba0=new DBA_Bean(new DBA(user,pwd,port,database));//此处创建DBA并一直传递下去
		request.setAttribute("user", user);
		request.setAttribute("pwd", pwd);
		request.setAttribute("port", port);
		request.setAttribute("database", database);
		//request.setAttribute("dba0", dba0);
		//request.getRequestDispatcher("Test").forward(request,response);
		DBA dba=new DBA(user,pwd,port,database);
		String[] s=dba.showTables();
		String[][] data=new String[s.length][1];
		for(int i=0;i<s.length;i++){
			data[i][0]=s[i];
		}
		String[] title=new String[1];
		title[0]="表名";
		Table table=new Table(title,data);
		request.setAttribute("Table",table);
		request.getRequestDispatcher("allTable.jsp").forward(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
