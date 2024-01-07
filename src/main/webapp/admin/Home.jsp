<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home page</title>
<%@include file="allCss.jsp" %>

<style type="text/css">
.crd-ho:hover{
background-color:#303f9f;


}
.back-img{
background: url("1326370.png");
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

<h2 class="text-center text-warning ">TECHNOTONICS</h2>





<div class="container" >
<div class="row p-5">



<div class="col-md-3">
<a href="add_books.jsp">
<div class="card crd-ho">
<div class="card-body text-center">
<i class="fas fa-book fa-3x text-success"></i><br>
<h4 class="text-success">ADD Books</h4>
<p class="text-danger">--------------------</p>
</div>
</div>
</a>
</div>

<div class="col-md-3">
<a href="all_books.jsp">
<div class="card crd-ho">
<div class="card-body text-center">
<i class="fas fa-book-open fa-3x

text-danger"></i><br>
<h4 class="text-success">ALL Books</h4>
<p class="text-danger">--------------------</p>
</div>
</div>
</a>
</div>


<div class="col-md-3">
<a href="order.jsp">
<div class="card crd-ho">
<div class="card-body text-center">
<i class="fas fa-box-open fa-3x text-warning"></i><br>
<h4 class="text-success">Order</h4>
<p class="text-danger">--------------------</p>
</div>
</div>
</a>
</div>

<div class="col-md-3">
<a data-toggle="modal" data-target="#exampleModal">
<div class="card crd-ho">
<div class="card-body text-center">
<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
<h4 class="text-success">Logout</h4>
<p class="text-danger">--------------------</p>
</div>
</div>
</a>
</div>


</div>


</div>






</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="text-center">
       <h4>Do you want Logout</h4>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../Logout" type="button" class="btn btn-primary text-white">Logout</a>
       
       </div>
      </div>
      <div class="modal-footer">
      
      </div>
    </div>
  </div>
</div>







<!-- modal -->



<%@include file="footer.jsp"%>


</body>

</html>