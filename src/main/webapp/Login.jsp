<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Login</title>
<%@include file="allComponents/allCss.jsp"%>

<style type="text/css">


.back-img{
background: url("images/istockphoto-949118068-612x612.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}


</style>




</head>
<body>
<%@include file="allComponents/navbar.jsp"%>


<div class="container-fluid back-img p-2">

<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card ">
<div class="card-body">
<h2 class="text-center text-primary">Login</h2>



<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>





<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>




<form action="login" method="post">



  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp"
    required="required"
    name="email"
    >
    
  </div>
  
  
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" 
    id="exampleInputPassword1"
     required="required"
     name="pword">
  </div>
  
  
  
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary">Login</button><br>
  <a href="regetration.jsp">create account</a>
  </div>
  
  
</form>

</div>
</div>
</div>
</div></div>
<%@include file="allComponents/footer.jsp"%>
</body>
</html>