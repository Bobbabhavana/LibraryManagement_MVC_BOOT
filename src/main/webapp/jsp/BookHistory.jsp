<%@page import="com.my.library.dto.BookRecord"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Book History</title>
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
</style>
</head>
<body>
	<%
	List<BookRecord> list = (List<BookRecord>) request.getAttribute("records");
	%>
	<table border="1">
		<tr>
			<th>Book Name</th>
			<th>Issue Date</th>
			<th>Return Date</th>
			<th>Fine</th>
			<th>Student Name</th>
		</tr>

		<%
		for (BookRecord record : list) {
		%>
		<tr>
			<th><%=record.getBook().getName()%></th>
			<th><%=record.getIssueDate()%></th>
			<th>
				<%
				if (record.getReturnDate() == null)
				%>Yet to Return<%
				else
				%><%=record.getReturnDate()%></th>
			<th><%=record.getFine()%></th>
			<th><%=record.getStudent().getName()%></th>
		</tr>
		<%
		}
		%>
	</table>
	<a href="/jsp/LibrarianHome.jsp"><button>Back</button></a>
</body>
</html>