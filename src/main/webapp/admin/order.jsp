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
<title>Admin:Order books page</title>
<%@include file="allCss.jsp" %>




<style type="text/css">

.back-img{
background: url("images.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}

</style>



</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">

<c:redirect url="../Login.jsp"/>

</c:if>




<div class="container-fluid back-img">

<div class="container-fluid back-img">
<h3 class="text-center text-warning">Hello Admin</h3>
<table class="table table-warning  pd-2">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col"> Order ID</th>
      <th scope="col"> Name</th>
       <th scope="col"> Email</th>
        <th scope="col"> Address</th>
         <th scope="col">Phone Number</th>
          <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
     <th scope="col">Payments</th>
    </tr>
  </thead>
  <tbody class="text-warning">
  
  
  
   
  <%
  User u=(User)session.getAttribute("userobj");
  BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
  List<Book_Order>blist=dao.getAllOrder();
  
  for(Book_Order b:blist )
  {%>
	  
	   <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
      <td><%=b.getPhno() %></td>
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





<%@include file="footer1.jsp" %>





</div>






</body>
</html>