<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.entity.User" %>
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
<title>E-book : index page</title>
<%@include file="allComponents/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover{
background-color:#f7f7f9;


}
.back-img{
background: url("images/glasses-1052010_640.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

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
<h3 class ="text-center">  Recent Books</h3>
<div class="row">


<%
BookDAOimpl dao2=new BookDAOimpl(DBConnect.getConn());
List<BookDtls> list2=dao2.getRecentBook();
for(BookDtls b:list2){%>

	<div class="col-md-3">
<div class="card crd-ho">
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

	
	
	<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ">View details</a>
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

<div class="text-center mt-1">
<a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>
<hr>

<!-- End recent book -->













<!-- Start new book -->

<div class="container" >
<h3 class ="text-center">New Books</h3>
<div class="row">

<%
BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
List<BookDtls> list=dao.getNewBook();
for(BookDtls b:list){%>
	<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="books/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
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
	<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>"  class="btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>
<% 
}

%>






<a href="view_book.jsp?bid=<%=b.getBookId()%>"  class="btn btn-success btn-sm ">View details</a>
<a href=""  class="btn btn-danger btn-sm "><%=b.getPrice() %>
<i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>
</div>

</div>
</div>	
	
<% 	
}
%>

</div>

<div class="text-center mt-2">
<a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>

<hr>
<!-- End new book -->























<!-- Start old book -->

<div class="container" >
<h3 class ="text-center">  old Books</h3>
<div class="row">


<%
BookDAOimpl dao3=new BookDAOimpl(DBConnect.getConn());
List<BookDtls> list3=dao3.getOldsBook();
for(BookDtls b:list3){%>
	<div class="col-md-3">
<div class="card crd-ho">
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

<div class="text-center mt-3">
<a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>

<hr>
<!-- End old book -->

<%@include file="allComponents/footer.jsp"%>

</body>

</html>