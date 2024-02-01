<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian Signup</title>
<style>

*{
   margin:0;
   padding:0;
}
    body{
    background-image: url(https://images.assetsdelivery.com/compings_v2/perhapzzz/perhapzzz1909/perhapzzz190900872.jpg);
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
	left: 430px;
	width: 26.2%;
	height: 220px;
	box-shadow: 5px 5px 5px black;
	border-radius: 3px;
}
h1{
   
    padding-top:30px;
    color: rgb(238, 31, 100);
    top:200px;
    font-weight: bolder;
    font-size:40px;
    text-align: center;
}
</style>
</head>
<body>
	<h1 style="color:red">${neg}</h1>
	<h1 style="color:green">${pos}</h1>
	<form action="/librarian/signup" method="post"
		enctype="multipart/form-data">
		
			<h1>Librarian Signup</h1>
			<table class="tablecontent">

				<tr>
					<th>Name:</th>
					<th><input type="text" name="name"></th>
				</tr>

				<tr>
					<th>Email:</th>
					<th><input type="email" name="email"></th>
				</tr>

				<tr>
					<th>Mobile:</th>
					<th><input type="number" name="mobile"></th>
				</tr>

				<tr>
					<th>Password:</th>
					<th><input type="password" name="password"></th>
				</tr>
				<tr>
					<th><label for="gender">Gender: </label></th>
					<th><input type="radio" name="gender" value="male" id="gender">Male
						<input type="radio" name="gender" value="female" id="gender">Female
					</th>
				</tr>
				<tr>
					<th><button>Signup</button></th>
					<th><button type="reset">Cancel</button></th>
				</tr>
                 
                 <th><br> <a href="/librarian/main"><button type="button">Back</button></a></th>
			</table>
			
		
	</form>



</body>
</html>