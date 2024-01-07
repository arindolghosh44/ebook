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


@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String bookname=req.getParameter("bname");
			String authorname=req.getParameter("author");
			String price=req.getParameter("price");
			String bookCatagories=req.getParameter("bstatus");
			String bookstatus=req.getParameter("btype");
			
			Part part=req.getPart("bimg");
			
			String filename=part.getSubmittedFileName();
			
			
			BookDtls b=new BookDtls(bookname,authorname,price,bookCatagories,bookstatus,filename,"admin");
			
			
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			
			
			
			String path=getServletContext().getRealPath("")+"books";
			
	
			
			
			HttpSession session=req.getSession();
			
			
			boolean f=dao.addBooks(b);
			if(f)
			{
				
				
				
				File file=new File(path);
				
						part.write(path+File.separator+filename);
						
						
				
				
				session.setAttribute("succMsg","Book added successfully");
				resp.sendRedirect("admin/add_books.jsp");
				
				
			}
			else
			{
		
				session.setAttribute("failedMsg","Something wrong on server");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
			
			
			
			

			
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
