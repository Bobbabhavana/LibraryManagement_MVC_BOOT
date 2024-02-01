<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="com.my.library.dto.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian View Book</title>

<style>

*{
   margin:0;
   padding:0;
}
    body{
    background-image: url(https://images.unsplash.com/photo-1549675584-91f19337af3d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGxpYnJhcnl8ZW58MHx8MHx8fDA%3D&w=1000&q=80);
    background-size: cover;
    width: 100%;
    height:120vh;
    background-position: center;
    background-repeat: no-repeat;
    overflow-x: hidden;   
}
.tablecontent{
	border-style: solid;
	border-color: black;
	background-color:  rgba(128, 128, 128, 0.457);
	position: relative;
	
	
	width: 26.2%;
	height: 220px;
	box-shadow: 10px 10px 5px black;
	border-radius: 8px;
}
.canva{
left:20%;
}

</style>



</head>
<body>
	<%
	List<Book> books = (List<Book>) request.getAttribute("books");
	%>
	<h1 style="color: red">${neg}</h1>
	<h1 style="color: green">${pos}</h1>
	<form action="/student/fetchbook" method="post">
		<input type="text" name="name">
		<button id="canva">Search</button>
	</form>
	<br>
	<table border="1" class="tablecontent">
		<tr>
			<th>Book Picture</th>
			<th>Book Name</th>
			<th>Book Author</th>
			<th>Book Price</th>
			<th>Stock</th>
			<th>Borrow</th>
		</tr>
		<%
		for (Book book : books) {
		%>
		<tr>
			<th>
				<%
				String base64 = Base64.encodeBase64String(book.getPicture());
				%> <img height="100px" width="100px" alt="unknown"
				src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=book.getName()%></th>
			<th><%=book.getAuthor()%></th>
			<th><%=book.getPrice()%></th>
			<th><%=book.getQuantity()%></th>
			<th><a href="/student/borrow/<%=book.getId()%>"><button>Borrow</button></a></th>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<a href="/jsp/StudentHome.jsp"><button>Back</button></a>
</body>
</html>