package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
@WebServlet("/delete_old_book")
public class Delete_Old_Book extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String em=req.getParameter("em");
		int id=Integer.parseInt(req.getParameter("id"));
		BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
		boolean f=dao.OldBookDelete("Old",id);
		
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg","Old Book removed Successfully");
			resp.sendRedirect("old_books.jsp");
		}
		else
		{

			session.setAttribute("failedMsg","Something Wrong in server");
			resp.sendRedirect("old_books.jsp");
			
		}
		
		
		
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
