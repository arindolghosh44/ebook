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


@WebServlet("/delete")
public class bookdelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			boolean f=dao.deleteBooks(id);

			HttpSession session=req.getSession();
			
	
			
			if(f)
			{
				
				
				
				
				session.setAttribute("succMsg","Book deleted successfully");
				resp.sendRedirect("admin/all_books.jsp");
				
				
			}
			else
			{
		
				session.setAttribute("failedMsg","Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
