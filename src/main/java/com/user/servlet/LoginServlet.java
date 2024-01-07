package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
			
			
			String email=req.getParameter("email");
			
			String password=req.getParameter("pword");
			
HttpSession session=req.getSession();
			
			if("admin@gmail.com".equals(email) && "admin".equals(password))
			{
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj",us);
				resp.sendRedirect("admin/Home.jsp");
			}
			else
			{
			User us=dao.login(email, password);
			
			if(us!=null)
			{
				session.setAttribute("userobj", us);
				
				resp.sendRedirect("index.jsp");
			}
			else
			{
session.setAttribute("failedMsg","Email and password Invalid");
				
				resp.sendRedirect("Login.jsp");
			}
			
			
				resp.sendRedirect("Home.jsp");
			}
			
	
			
			
				
				
				
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
