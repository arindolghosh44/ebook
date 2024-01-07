package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOimpl;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOimpl;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Book_Order;
import com.entity.Cart;
import com.entity.User;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("ad");
			String landmark=req.getParameter("lm");
			String city=req.getParameter("c");
			String state=req.getParameter("s");
			String pincode=req.getParameter("p");
			String paymentType=req.getParameter("pay");
			
			String fulladd=address+","+landmark+","+city+","+state+","+pincode;
			
			
			CartDAOimpl dao=new CartDAOimpl(DBConnect.getConn());
			
			List<Cart> blist=dao.getBookById(id);
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg","Please Add item");
				resp.sendRedirect("cart.jsp");
			}
			else
			{

				BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());
		
				Book_Order o=null;
				Random r=new Random();
				ArrayList<Book_Order>orderlist=new ArrayList<Book_Order>();
				for(Cart c:blist) {
					o=new Book_Order();
					o.setOrderId("Book-Ord-00"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fulladd);
					o.setBookname(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderlist.add(o);
					
					
				}
				
				
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg","Please Choose your Payment Method");
					resp.sendRedirect("cart.jsp");
				}else
				{
					boolean f=dao2.saveOrder(orderlist);
					
					if(f)
					{
						resp.sendRedirect("Order_success.jsp");
					}
					else {
						
						
						session.setAttribute("failedMsg","Your Order failed");
						resp.sendRedirect("cart.jsp");
					}
					
				}
				
				
				
				
			}
			
			
			
			
			
			
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
