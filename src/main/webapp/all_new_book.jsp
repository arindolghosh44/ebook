<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
      <%@page import="com.DAO.BookDAO"%>
        <%@page import="com.entity.User" %>
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


#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}





</style>
</head>



<body style="background-color:#f7f7f7;">

<%
User u=(User)session.getAttribute("userobj");

%>

<c:if test="${not empty addCart}">
<div id="toast"> ${addCart} </div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>


<c:remove var="addCart" scope="session"/>


</c:if>












<%@include file="allComponents/navbar.jsp"%>
<div class="container-fluid back-img">

<h2 class="text-center text-primary">EBook Management System</h2>
</div>


<div class="container" >
<h3 class ="text-center text-success">New Books</h3>
<div class="row">

<%
BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
List<BookDtls> list=dao.getAllNewBook();
for(BookDtls b:list){%>
	<div class="col-md-3">
<div class="card crd-ho mt-3">
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
	<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>"  class="btn btn-danger btn-sm ">
	<i class="fas fa-cart-plus"></i>Add Cart</a>
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

<div class=" text-center mt-2">
<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-backward-fast"></i></a>
<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-forward-fast"></i></a>
</div>
</div>

<hr>
<!-- End new book -->












<%@include file="allComponents/footer.jsp"%>
</body>
</html>