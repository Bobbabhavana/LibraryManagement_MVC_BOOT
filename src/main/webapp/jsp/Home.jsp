<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
*{
   margin:0;
   padding:0;
}
    body{
    background-image: url(https://editor.analyticsvidhya.com/uploads/66982lms.jpg);
    background-size: cover;
    width: 100%;
    height:120vh;
    background-position: center;
    background-repeat: no-repeat;
    overflow-x: hidden;   
}

button{
    position: relative;
    left:10%;
    width:90px;                                                                                                                                                                                 
    font-size:18px;
     top:190px;
    padding: 10px 17px 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    background-color:rgba(13, 100, 171, 0.559);
    border-color: burlywood;
    border-radius: 10px;
    font-weight: bolder;
   
}



</style>

</head>
<body>
	<h1 style="color: red">${neg}</h1>
	<h1 style="color: green">${pos}</h1>

	<a href="/"><button>Home</button></a>
	<a href="/student/signup"><button>Signup</button></a>
	<a href="/student/login"><button>Login</button></a>
	<a href="/librarian"><button>Librarian</button></a>

</body>
</html>