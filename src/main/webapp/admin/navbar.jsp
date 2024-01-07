<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
      <%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls" %>
 <%@page import="com.user.servlet.LoginServlet" %>     
<%@page import="com.user.servlet.LogoutServlet" %> 
<div class="container-fluid" style="height:10px;background-color:#303f9f"></div>


<div class="container-fluid p-3 bg-light">
<div class="row">

<div class ="col-md-3 text-success">
<h3>
<i class="fas fa-book"></i>
EBooks</h3>
</div>

<div class ="col-md-6">
<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>

<div class="col-md-3">
<c:if test="${not empty userobj }">

<a href="../Login.jsp" class="btn btn-success text-white"><i class="fas fa-user-plus"></i>
${userobj.name}</a>
<a  data-toggle="modal" data-target="#exampleModal" class="btn btn-primary text-white">
<i class="fas fa-sign-in-alt"></i>Logout</a>
</c:if>

<c:if test="${ empty userobj }">
<a href="../Login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt">Login</i></a>
<a href="../regetration.jsp" class="btn btn-primary text-white">
<i class="fas fa-user-plus"></i>Registration</a>
</c:if>
</div>


</div>




</div>

<!-- modal -->

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

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fas  fa-home"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
  aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link active" href="../admin/Home.jsp">Home
         <span class="sr-only">(current)</span>
        </a></li>
       
    </form>
  </div>
</nav>