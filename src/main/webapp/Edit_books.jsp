<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit books Page</title>
<%@include file="allComponents/allCss.jsp" %>




<style type="text/css">

.back-img{
background: url("images/janko-ferlic-sfL_QOnmy00-unsplash.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}

</style>



</head>
<body>
<%@include file="allComponents/navbar.jsp" %>
<!--  
<c:if test="${empty userobj}">

<c:redirect url="../Login.jsp"/>

</c:if>
-->



<div class="container-fluid back-img p-2">




<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card ">
<div class="card-body">
<h4 class="text-center text-primary">Edit Profile</h4>


<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>





<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>




<form action="update" method="post">

<input type="hidden" value="${userobj.id }" name="id">
  <div class="form-group">
    <label for="exampleInputPassword1">Name</label>
    <input type="text" class="form-control" 
    id="exampleInputPassword1" required="required" name="fname" value="${userobj.name}">
  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp"  required="required" name="email" value="${userobj.email}">
    <small id="emailHelp" 
    class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Phone Number</label>
    <input type="number" class="form-control" 
    id="exampleInputPassword1"  required="required" name="phno" value="${userobj.phno}">
  </div>
  
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" 
    id="exampleInputPassword1" required="required" name="pword">
  </div>
  
  
  
  
  
  
  <button type="submit" class="btn btn-primary">Update</button>
  
  
  
  
</form>
</div>
</div>
</div>
</div>
</div>





<%@include file="allComponents/footer.jsp" %>
</body>
</html>