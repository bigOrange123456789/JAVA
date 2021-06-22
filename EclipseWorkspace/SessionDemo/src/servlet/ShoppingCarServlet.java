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
    	//�����������Ӧ���ַ���ʽ
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();//���session����
		HashMap<String, Integer> car = (HashMap<String, Integer>)session.getAttribute("shoppingCar");//�������ͷ�е�����
		if(car==null)car= new HashMap<String,Integer>();
		
		String[] books = request.getParameterValues("book");//����ı�������Ϊbook
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
