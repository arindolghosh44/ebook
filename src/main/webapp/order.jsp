<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
      <%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookOrderDao"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Order" %>
  <%@page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyOrder Page</title>

<%@include file="allComponents/allCss.jsp" %>




<style type="text/css">

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
<%@include file="allComponents/navbar.jsp" %>
<c:if test="${empty userobj }">

<c:redirect url="Login.jsp"></c:redirect>
</c:if>
<div class="container-fluid back-img p-2">
<h3 class="text-primary text-center p-2"> Your Order</h3>
<table class="table table-warning mt-5">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
  List<Book_Order>blist=dao.getBook(u.getEmail());
  
  for(Book_Order b:blist )
  {%>
	  
	   <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>
	  
	  
	  
 <% }
  
  
  
  
  %>
  
  
  
  
   
    
  </tbody>
</table>


</div>

</body>
</html>