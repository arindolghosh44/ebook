<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View_book page</title>
<%@include file="allComponents/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover{
background-color:#f7f7f9;


}
.back-img{
background: url("images/admont-abbey-library-admont-austria-LIBRARY0319-2aa89cccb89d4f44b71181e64b54fbfb.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}

</style>
</head>
<body style="background-color:#f7f7f7;">
<%@include file="allComponents/navbar.jsp"%>
<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOimpl dao2=new BookDAOimpl(DBConnect.getConn());
BookDtls b=dao2.getBookId(bid);
%>

<div class="container-fluid back-img text-center">
<h2 class="text-center text-warning">EBook Management System</h2>


<div class="container p-5 text-center">
<div class="row text-center">
<div class="col-md-6 text-center p-5 border bg-warning">
<img src="books/<%=b.getPhotoName()%>" style="height:150px;width:150px"><br>
<h4 class="mt-3 text-danger">
book Name:<span class="text-success"><%=b.getBookName() %></span>


</h4>
<h4 class="mt-3 text-danger">
Author Name:<span class="text-success"><%=b.getAuthor() %></span>
</h4>
<h4 class="mt-3 text-danger">
Catagory:<span class="text-success"><%=b.getBookCategory() %></span>
</h4>
</div>
<div class="col-md-6 text-center p-5 border bg-white">
<h2  class="text-success p-3"><%=b.getBookName() %></h2>

<%
if("Old".equals(b.getBookCategory()))
{%>
<h5 class="text-warning">Contact to seller</h5>
<h5 class="text-primary"><i class="far fa-envelope text-primary"></i>
EMail: <%=b.getEmail() %></h5>	
<% }
%>


<!-- /////////////////////////////////////////////////////////////////////// -->


<div class="row">
<div class="col-md-4 text-center text-primary"><i class="fas fa-money-bill-wave fa-2x"></i>
<p>Cash on delivery</p>

</div>
<div class="col-md-4 text-center text-warning"><i class="fas fa-undo-alt fa-2x"></i>
<p>Return Available</p></div>

<div class="col-md-4 text-center text-danger"><i class="fas fa-truck-moving fa-2x"></i>
<p>Free shopping</p></div>


<%
if("Old".equals(b.getBookCategory()))
{%>
<div class="text-center p-3">
<a href="index.jsp"  class="btn btn-success btn-sm "><i class="fas fa-cart-plus"></i>Continue Shopping</a>
<a href=""  class="btn btn-danger btn-sm "><%=b.getPrice() %>
<i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>
<%}else{%>
<div class="p-3 text-center">
<a href=""  class="btn btn-primary btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>
<a href=""  class="btn btn-danger btn-sm "><%=b.getPrice() %>
<i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<% }
%>

</div>

</div>

</div>

</div>

</div>
<%@include file="allComponents/footer.jsp"%>
</body>
</html>