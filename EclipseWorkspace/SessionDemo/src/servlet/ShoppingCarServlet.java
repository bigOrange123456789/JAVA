package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ShoppingCarServlet")
public class ShoppingCarServlet  extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//设置请求和响应的字符格式
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();//获得session对象
		HashMap<String, Integer> car = (HashMap<String, Integer>)session.getAttribute("shoppingCar");//获得请求头中的属性
		if(car==null)car= new HashMap<String,Integer>();
		
		String[] books = request.getParameterValues("book");//输入的变量名称为book
		if(books!=null && books.length>0) {
			for(String bookName:books) {
				
				if(car.get(bookName)!=null) {
					int num=car.get(bookName);
					car.put(bookName,num+1);
				}else{
					car.put(bookName,1);
				}				
			}
		}
		
		session.setAttribute("shoppingCar", car);
		response.sendRedirect("ShoppingListServlet");
		
	}

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
	}
 
//https://blog.csdn.net/xizi_ghq/article/details/103431431
}
