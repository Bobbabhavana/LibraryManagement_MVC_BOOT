<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
</head>
<body>
	<h1>Add Book Details</h1>
	<form action="/librarian/addbook" method="post" enctype="multipart/form-data">
		Name:<input type="text" name="name"><br> Author:<input
			type="text" name="author"><br> Price:<input type="text"
			name="price"><br> 
			Quantity:<input type="text" name="quantity"><br>
			Picture:<input type="text" name="pic"><br>
		<button>Add</button>
		<button type="reset">Cancel</button>
	</form>
</body>
</html>