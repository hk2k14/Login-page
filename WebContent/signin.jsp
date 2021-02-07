<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

body
{
background: url(star.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

h1
{
font-family: Verdana, sans-serif;
color:white;

text-align: center;

}
a
{
 text-align: center;
 color:white;
}

button {
  margin:auto;
  display:block;
}

</style>

</head>


<body>

<% String name = request.getParameter("nam"); %>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/harin" user="root" password="" />
<sql:query var="rs" dataSource="${db}">
Select * from login;
</sql:query>

<c:forEach items="${rs.rows}" var="cust" > 
 
<c:if test="${cust.name eq param.nam && cust.pass eq param.pas}"> 
<h1>Logged In Successfully</h1>

<h1> Hello <%= name %> </h1> 

<c:set var="count" value="1"></c:set>

</c:if>

</c:forEach>

<c:if test="${count != 1}" > <h1>User Doesnot Exists</h1> <a href = "index.html"> <button>Try Again </button> </a> </c:if>






</body>
</html>