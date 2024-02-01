<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Student Details</title>

<style>
*{
    margin:0;
    padding:0;
 }
     body{
     background-image: url(https://img.freepik.com/free-photo/top-view-books-with-copy-space_23-2148827187.jpg?size=626&ext=jpg&ga=GA1.1.1009061887.1682959706&semt=ais);
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
	top:80px;
	left:380px;
	width: 30.2%;
	height: 200px;
	box-shadow: 5px 5px 5px black;
	border-radius: 8px;
}
legend{
position: relative;
left:430px;
top:70px;
font-size: 35px;
font-weight: bolder;
}


</style>
</head>
<body>
	<h1 style="color: red">${neg}</h1>
	<h1 style="color: green">${pos}</h1>
	<form action="/student/update" method="post">
		
			<legend>Student Update</legend>
			<input type="text" name="id" value="${student.getId()}" hidden="">
			<table class="tablecontent">

				<tr>
					<th>Name:</th>
					<th><input type="text" name="name" value="${student.getName()}"></th>
				</tr>

				<tr>
					<th>Email:</th>
					<th><input type="email" name="email" value="${student.getEmail()}" readonly="readonly"></th>
				</tr>

				<tr>
					<th>Mobile:</th>
					<th><input type="number" name="mobile" value="${student.getMobile()}"></th>
				</tr>

				<tr>
					<th>Password:</th>
					<th><input type="password" name="password" required="required"></th>
				</tr>

				<tr>
					<th><label>DOB: </label></th>
					<th><input type="date" name="date" value="${student.getDob()}"></th>
				</tr>

				<tr>
					<th><label for="gender">Gender: </label></th>
					<th><input type="radio" name="gender" value="male" id="gender">Male
						<input type="radio" name="gender" value="female" id="gender">Female
					</th>
				</tr>

				<tr>
					<th><button>Update</button></th>
					<th><button type="reset">Cancel</button></th>
				</tr>
               <th> <a href="/jsp/StudentHome.jsp"><button type="button">Back</button></a></th>
			</table>
			
		
	</form>
</body>
</html>