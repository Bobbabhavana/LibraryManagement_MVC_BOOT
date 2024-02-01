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
    background-image: url(https://libero.com.au/wp-content/uploads/2016/10/parralax-about.jpg);
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
	height: 180px;
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
<h1 style="color:red">${neg}</h1>
	<h1 style="color:green">${pos}</h1>
	<h1>Add Book Details</h1>
	
	<form class="tablecontent" action="/librarian/addbook" method="post" enctype="multipart/form-data">
		Name:<input type="text" name="name"><br> 
		Author:<input type="text" name="author"><br> 
		Price:<input type="text" name="price"><br> 
		Quantity:<input type="text" name="quantity"><br>
		Picture:<input type="file" name="pic"><br><br>
		<button>Add</button>
		<button type="reset">Cancel</button><br><br>
		
		
	</form><br>
	<a href="/jsp/LibrarianHome.jsp"><button>Back</button></a></th>
	
</body>
</html>