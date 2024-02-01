<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book ID</title>
<style>
 *{
   margin:0;
   padding:0;
}
    body{
    background-image: url(https://t3.ftcdn.net/jpg/03/55/60/70/240_F_355607062_zYMS8jaz4SfoykpWz5oViRVKL32IabTP.jpg);
    background-size: cover;
    width: 100%;
    height: 100vh;
    background-position: center;
    background-repeat: no-repeat;
    overflow-x: hidden;   
}
</style>
</head>
<body>
<form action="history" method="post">
Enter Id:<input type="text" name="id" required="required">
<button>View</button>
</form>
<br>
<a href="/jsp/LibrarianHome.jsp"><button>Back</button></a>
</body>
</html>