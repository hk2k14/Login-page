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
p{
color:white;
}

</style>


</head>
<body>

<c:catch var="excep"> 

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/harin" user="root" password="" /> 
<sql:update dataSource="${db}" var="count">  
INSERT INTO Login (Name,Pass) VALUES(?,?)
 <sql:param value="${param.name}" />
 <sql:param value="${param.pass}" />  
</sql:update>

</c:catch> 

<c:if test = "${excep != null}">     
   <script type="text/javascript">
    alert("username already exists");
   </script>

   <c:redirect url="index.html"> </c:redirect>
</c:if> 








<% String nam = request.getParameter("name"); %>
<% String pas = request.getParameter("pass"); %>

<h1> Sign up successful <%=nam %> !</h1>


 


</body>
</html>