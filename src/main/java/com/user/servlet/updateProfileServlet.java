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


@WebServlet("/update")
public class updateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("pword");
			
			HttpSession session=req.getSession();
			
			User us=new User();
			
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
			boolean f=dao.checkpassword(id, password);
			if(f)
			{
				
				boolean f2=dao.updateProfile(us);
				
				if(f2)
				{
					session.setAttribute("succMsg","profile update successfully");
					resp.sendRedirect("Edit_books.jsp");
				}
				else
				{
					
				
				session.setAttribute("failedMsg","something went wromg in server");
				resp.sendRedirect("Edit_books.jsp");
				}
				
			}
			else
			{
				
				session.setAttribute("failedMsg","Your password is incorrect");
				resp.sendRedirect("Edit_books.jsp");
			}
			
			
	
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
