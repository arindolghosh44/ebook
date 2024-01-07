<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.entity.Cart" %>
        <%@page import="com.entity.User" %>
      <%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.DAO.CartDAOimpl"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart page</title>
<%@include file="allComponents/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover{
background-color:#f7f7f9;


}
.back-img{
background: url("images/books-1204029_1280.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}
</style>
</head>
<body>
<%@include file="allComponents/navbar.jsp"%>
<c:if test="${empty userobj }">

<c:redirect url="Login.jsp"></c:redirect>
</c:if>

<c:if test="${ not empty succMsg }">

<div class="alert alert-primary" role="alert">
  ${succMsg}
</div>
<c:remove var="succMsg" scope="session"/>
</c:if>



<c:if test="${ not empty failedMsg }">

<div class="alert alert-danger" role="alert">
 ${ failedMsg }
</div>
<c:remove var="failedMsg" scope="session"/>
</c:if>














<div class="container-fluid back-img">
<div class="row p-2">
<div class="col-md-6">

<div class="card p-2 bg-warning">
<h3 class="text-center text-success">Your Selected item</h3>
<div class="card-body">
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">BookName</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  User u=(User)session.getAttribute("userobj");
  
  
  CartDAOimpl dao=new  CartDAOimpl(DBConnect.getConn());
  List<Cart> list=dao.getBookById(u.getId());
  
  Double totalPrice=0.00;
  for(Cart c:list)
	  
  {
	  
	  totalPrice=c.getTotalPrice();
  %>
	  
    <tr>
      <th scope="row"><%=c.getBookName()%></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      
      <td>
      <a href="remove?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
      
      
      </td>
    </tr>
  
  <% }
  
  %>
  
  <tr>
  <td>Total price</td>
  <td></td>
  <td></td>
  <td><%=totalPrice%></td>
  </tr>
  
  
  
  
  
  
  
  </tbody>
</table>

</div>
</div>
</div>

<div class="col-md-6">

<div class="card p-2 bg-warning">
<h3 class="text-center text-success">Your Details for Order</h3>

<c:if test="${ not empty failedMsg }">

<div class="alert alert-danger text-center" role="alert">
 ${ failedMsg }
</div>
<c:remove var="failedMsg" scope="session"/>
</c:if>


<div class="card-body">
<form action="order" method="post">
<input type="hidden" value="${userobj.id }" name="id">
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" name="username" class="form-control" id="inputEmail4" value="${userobj.name }" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" name="email" class="form-control" id="inputPassword4"  value="${userobj.email }" required>
    </div>
  </div>

   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone number</label>
      <input type="number" name="phno" class="form-control" id="inputEmail4" value="${userobj.phno }" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">address</label>
      <input type="text" name="ad" class="form-control" id="inputPassword4"  value="" required>
    </div>
  </div>
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" name="lm" class="form-control" id="inputEmail4"  value="" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">city</label>
      <input type="text" name="c" class="form-control" id="inputPassword4"  value="" required>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" name="s" class="form-control" id="inputEmail4"  value="" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Pin Code</label>
      <input type="text" name="p" class="form-control" id="inputPassword4"  value="" required>
    </div>
  </div>
  <div class="form-group">
    <label >Payment Mode</label>
  <select class="form-control" name="pay">
  <option value="noselect">---Select----</option>
  <option value="cod">Cash On delivery</option>
  <option value="phone pay">phone pay</option>
  <option value="paytm">paytm</option>
  <option value="Gpay">Gpay</option>
  <option value="ATM">credit card</option>
  </select>
  </div>
  <div class="text-center">
  <button class="btn btn-primary"><i class="fas fa-sign-in-alt text-warning"></i>Order Now</button>
  <a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus text-danger"></i>Continue Shopping</a>
  
  
  </div>
  
  
  
</form>
</div>
</div>
</div>















</div>










</div>

</body>
</html>