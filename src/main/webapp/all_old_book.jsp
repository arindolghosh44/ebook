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
<title>Recent books</title>
<%@include file="allComponents/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover{
background-color:#f7f7f9;


}



</style>
</head>



<body style="background-color:#f7f7f7;">
<%@include file="allComponents/navbar.jsp"%>
<div class="container-fluid back-img">

<h2 class="text-center text-warning">EBook Management System</h2>

</div>

<!-- Start old book -->

<div class="container" >
<h2 class ="text-center text-danger">  old Books</h2>
<div class="row">


<%
BookDAOimpl dao3=new BookDAOimpl(DBConnect.getConn());
List<BookDtls> list3=dao3.getAllOldsBook();
for(BookDtls b:list3){%>
	<div class="col-md-3">
<div class="card crd-ho mt-3">
<div class="card-body text-center">
<img alt="" src="books/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p>Catagories:<%=b.getBookCategory() %></p>
<div class="row">

<a href="view_book.jsp?bid=<%=b.getBookId()%>"  class="btn btn-success btn-sm ml-4 ">View details</a>
<a href=""  class="btn btn-danger btn-sm ml-3"><%=b.getPrice() %>
<i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>
</div>

</div>
</div>	
	
<% 	
}
%>

</div>

<div class=" text-center mt-3">
<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-backward-fast"></i></a>
</div>
</div>

<hr>
<!-- End old book -->









<%@include file="allComponents/footer.jsp"%>
</body>
</html>