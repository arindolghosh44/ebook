<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
      
<%@page import="java.sql.Connection"%>

<%@page import="com.entity.User" %>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old books page</title>
<%@include file="allComponents/allCss.jsp"%>
<style type="text/css">
.a{
text-decoration:none;
color:black;

}


.a:hover{
background-color:#0000FF;


}
.back-img{
background: url("images/zaini-izzuddin-55btQzyDiO8-unsplash.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}




</style>
</head>
<body>
<%@include file="allComponents/navbar.jsp"%>

<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<div class="container-fluid back-img p-5">
<table class="table table-warning">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">BookName</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Catagory</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  
  User u=(User)session.getAttribute("userobj");
  String email=u.getEmail();
  BookDAOimpl dao=new  BookDAOimpl(DBConnect.getConn());
 
  List<BookDtls>list= dao.getBookByOld(email, "Old");
  for(BookDtls b:list)
  {%>
	
    <tr>
      
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><a href="delete_old_book?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
       
    </tr>  
	  
  <%}
  
  %>
  
  
   
  </tbody>
</table>
</div>
</body>
</html>