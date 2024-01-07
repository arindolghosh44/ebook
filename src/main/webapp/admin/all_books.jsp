
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
      
      <%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:ALL books page</title>
<%@include file="allCss.jsp" %>




<style type="text/css">

.back-img{
background: url("HD-wallpaper-book-cup-autumn-abstract.jpg");
height:100vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;

}

.car{
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
<h3 class="text-center text-warning">Hello Admin</h3>
<c:if test="${not empty succMsg }">
<h5 class="text-center text-warning">${succMsg}</h5>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<h5 class="text-center text-warning">${failedMsg}</h5>
<c:remove var="failedMsg" scope="session"/>
</c:if>

<table class="table table-warning  pd-2 car">
  <thead class="bg-primary text-white ">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Catagories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
 <%
 BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
 
     List<BookDtls> list=dao.getAllBooks();
     
     for(BookDtls b:list)
     {
    	 %>
    	 <tr>
      <td><%=b.getBookId() %></td>
      <td><img src="../books/<%=b.getPhotoName()%>"
      
      style="width: 50px;height:50px">
      </td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
       <td><%=b.getStatus() %></td>
      <td>
      <a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-warning">
      <i class="fas fa-edit"></i>Edit</a>
        <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"> <i class="fas fa-trash-alt"></i>Delete</a>
      </td>
    </tr>
    	 
    <% 	 
     }
 
 %>
  
  
   
  </tbody>
</table>


</div>
</body>
</html>