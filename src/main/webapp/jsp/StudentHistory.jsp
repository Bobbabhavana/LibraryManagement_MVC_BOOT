<%@page import="com.my.library.dto.BookRecord"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Book Borrowing History</title>
<style>
*{
    margin:0;
    padding:0;
 }
     body{
     background-image: url(https://media.istockphoto.com/id/1370729539/vector/books-of-imagination-surreal-art-fantasy-painting-concept-idea-of-education-dream-and-reading.jpg?s=612x612&w=0&k=20&c=29KtW7u2Q-ejdYsOatBYn9E3kVVLCQ4eOZW1JE6FZWk=);
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
	top:20px;
	left:15%;
	
	box-shadow: 10px 10px 5px black;
	border-radius: 8px;
}
button{
position: relative;
left:20%;
top:200px;
font-size:18px;
     top:190px;
    padding: 7px 7px 7px 7px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    
    border-color: burlywood;
    border-radius: 10px;
    font-weight: bolder;
}

</style>
</head>
<body>
	<%
	List<BookRecord> list = (List<BookRecord>) request.getAttribute("list");
	%>
	<table border="1" class="tablecontent">
		<tr>
			<th>Book Name</th>
			<th>Issue Date</th>
			<th>Return Date</th>
			<th>Fine</th>
		</tr>

		<%
		for (BookRecord record : list) {
		%>
		<tr>
			<th><%=record.getBook().getName()%></th>
			<th><%=record.getIssueDate()%></th>
			<th><%if(record.getReturnDate()==null)%>Yet to Return<%else%><%=record.getReturnDate() %></th>
			<th><%=record.getFine()%></th>
		</tr>
		<%
		}
		%>
		<a href="/jsp/StudentHome.jsp"><button>Back</button></a>
	</table>
	
</body>
</html>