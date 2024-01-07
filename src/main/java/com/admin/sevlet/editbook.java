package com.admin.sevlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;


@WebServlet("/editbooks")
@MultipartConfig
public class editbook  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookname=req.getParameter("bname");
			String authorname=req.getParameter("author");
			String price=req.getParameter("price");
			String bookstatus=req.getParameter("btype");
		
			
			
			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookName(bookname);
			b.setAuthor(authorname);
			b.setPrice(price);
			b.setStatus(bookstatus);
			
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			
			
			boolean f=dao.updateEditBooks(b);
			
			
	
			
			
			HttpSession session=req.getSession();
			
			
			
			if(f)
			{
				
				
				
				
				session.setAttribute("succMsg","Book updated successfully");
				resp.sendRedirect("admin/all_books.jsp");
				
				
			}
			else
			{
		
				session.setAttribute("failedMsg","Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
			
			
			
			

			
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}