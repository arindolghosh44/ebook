<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting page</title>
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
background: url("images/HD-wallpaper-lost-in-a-good-book-hot-3d-books-ancient.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}




</style>
</head>
<body>
<c:if test="${ empty userobj }">

<c:redirect url="Login.jsp"/>
</c:if>




<%@include file="allComponents/navbar.jsp"%>
<div class="container-fluid back-img p-2">
<h3 class="text-center text-warning">hello,${userobj.name }</h3>
<div class="row p-5 ">




<div class="col-md-6 mt-3">
<a  href="sell_books.jsp">
<div class="card  p-2 bg-warning">
<div class="card-body text-center">
<div class="text-primary">
<i class="fas fa-book-open text-success fa-3x"></i>
</div>
<h3 class="text-center text-primary">Sell Old Books</h3>
</div>
</div>
</a>
</div>


<div class="col-md-6 mt-3">
<a  href="old_books.jsp">
<div class="card  p-2 bg-warning">
<div class="card-body text-center">
<div class="text-primary">
<i class="fas fa-book text-success fa-3x"></i>
</div>
<h3 class="text-center text-primary">Old Books</h3>
</div>
</div>
</a>
</div>












<div class="col-md-6 mt-3">
<a  href="Edit_books.jsp">
<div class="card  p-2 bg-warning">
<div class="card-body text-center">
<div class="text-primary">
<i class="fas fa-edit text-primary fa-3x"></i>
</div>
<h3 class="text-center text-denger">Login & Security <h3>
<h3>(Edit Profile)</h3>
</div>
</div>
</a>
</div>





<div class="col-md-6 mt-3">
<a  href="order.jsp">
<div class="card  p-2 bg-warning">
<div class="card-body text-center">
<div class="text-primary">
<i class="fas fa-box-open text-success fa-3x"></i>
</div>
<h3 class="text-center text-denger">My Order</h3>
<p>Track Your Order</p>
</div>
</div>
</a>
</div>



<div class="col-md-6 mt-3 offset-3">
<a  href="help.jsp">
<div class="card  p-2 bg-warning">
<div class="card-body text-center">
<div class="text-primary">
<i class="fas fa-user-circle text-primary fa-3x"></i>
</div>
<h3 class="text-center text-denger">Help Center</h3>
<p>24*7 Service</p>
</div>
</div>
</a>
</div>










</div>
</div>
<%@include file="allComponents/footer.jsp"%>
</body>
</html>