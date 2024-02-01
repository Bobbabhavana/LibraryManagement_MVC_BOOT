<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
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
.tablecontent{
	border-style: solid;
	border-color: black;
	background-color:  rgba(128, 128, 128, 0.457);
	position: relative;
	top:50px;
	width:290px;
	left:35%;
	
}
h1{
position: relative;
left:380px;
top:50px;
font-size: 35px;
font-weight: bolder;
}
a{
position: relative;
left:380px;
top:30px;
font-size: 35px;
font-weight: bolder;
}
</style>
</head>
<body>
	<h1 style="color: red">${neg}</h1>
	<h1 style="color: green">${pos}</h1>
	<h1>Edit Book Details</h1>
	<form action="/librarian/updatebook" method="post" class="tablecontent">
		<input type="text" name="id" value="${book.getId()}" hidden="">
		Name:<input type="text" name="name" value="${book.getName()}"><br>
		Author:<input type="text" name="author" value="${book.getAuthor()}"><br>
		Price:<input type="text" name="price" value="${book.getPrice()}"><br>
		Quantity:<input type="text" name="quantity"
			value="${book.getQuantity()}"><br><br>
		<button>Update</button>
		<button type="reset">Cancel</button>
	</form>
	<br>
	<a href="/jsp/LibrarianHome.jsp"><button>Back</button></a>
</body>
</html>