<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sell books page</title>
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
<h4 class="text-center text-primary">Sell Old books</h4>
<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>


<form action="add_old_books" method="post"
enctype="multipart/form-data"><!-- this is used for sending file data -->



<input type="hidden" value="${userobj.email}" name="user">

  <div class="form-group">
    <label for="exampleInputPassword1">Book Name*</label>
    <input type="text" class="form-control" 
    id="exampleInputPassword1" required="required" name="bname">
  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">Author Name*</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp"  required="required" name="author">
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Price*</label>
    <input type="number" class="form-control" 
    id="exampleInputPassword1"  required="required" name="price">
  </div>
  
  
  
  
  
  
  
  
  <div class="form-group">
    <label for="exampleFormControlFile1">Upload book</label>
   <input type="file" class="form-control" 
    id="exampleFormControlFile1"  required="required" name="bimg">
  </div>
  
  
  
  <button type="submit" class="btn btn-primary">Sell</button>
  
  
  
  
</form>

</div>
</div>
</div>
</div>
</div>





<%@include file="allComponents/footer.jsp" %>
</body>
</html>