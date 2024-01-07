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
<title>SearchBook Page</title>
<%@include file="allComponents/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover{
background-color:#f7f7f9;


}

</style>
</head>



<body style="background-color:#f7f7f7;">

<%
User u=(User)session.getAttribute("userobj");

%>

<%@include file="allComponents/navbar.jsp"%>
<div class="container-fluid back-img">

<h2 class="text-center text-danger">EBook Management System</h2>
</div>


<!-- Start recent book -->

<div class="container" >
<h3 class ="text-center text-success">Search Books</h3>
<div class="row">


<%
String ch=request.getParameter("ch");
BookDAOimpl dao2=new BookDAOimpl(DBConnect.getConn());
List<BookDtls> list2=dao2.getBookBySearch(ch);
for(BookDtls b:list2){%>

	<div class="col-md-3">
<div class="card crd-ho mt-3">
<div class="card-body text-center">
<img alt="" src="books/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>

<%
if(b.getBookCategory().equals("Old")){%>

<p>Catagories:<%=b.getBookCategory() %></p>
<div class="row">

<a href="view_book.jsp?bid=<%=b.getBookId()%>"  class="btn btn-success btn-sm ml-4 ">View details</a>
<a href=""  class="btn btn-danger btn-sm ml-3"><%=b.getPrice() %>
<i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>
<% 	
}else{%>
	
	<p>Catagories:<%=b.getBookCategory() %></p>
	<div class="row">
	
	<%
if(u==null)
{
%>
<a href="Login.jsp"  class="btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>
	
<%
}
else	
{
%>
	<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>"  class="btn btn-danger btn-sm ">
	<i class="fas fa-cart-plus"></i>Add Cart</a>
<% 
}

%>

	<a href="view_book.jsp?bid=<%=b.getBookId()%>"  class="btn btn-success btn-sm ">View details</a>
	<a href=""  class="btn btn-danger btn-sm "><%=b.getPrice() %>
	<i class="fa-solid fa-indian-rupee-sign"></i></a>

	</div>
<% }


%>










</div>

</div>
</div>	
	
<% 	
}
%>




</div>


</div>
<hr>

<!-- End recent book -->














</body>
</html>