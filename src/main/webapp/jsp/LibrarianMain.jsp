<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian Main</title>
   <style>
        *{
    margin:0;
    padding:0;
 }
     body{
     background-image: url("https://img.freepik.com/free-photo/three-books-near-bookshelf_23-2147845951.jpg?size=626&ext=jpg&ga=GA1.1.1009061887.1682959706&semt=ais");
     background-size: cover;
     width: 100%;
     height: 100vh;
     background-position: center;
     background-repeat: no-repeat;
     overflow-x: hidden;   
 }

h1{
    left:100px;
    padding-left:140px;
    padding-top:10px;
    color: rgb(238, 31, 100);
    top:200px;
    font-weight: bolder;
    font-size:40px;
}
button{
    position: relative;
    left:30%;
    width:130px;                                                                                                                                                                                 
    font-size:12px;
     top:10px;
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
	<h1>Library Management System - Librarian</h1>
	<a href="/librarian/signup"><button>Signup</button></a>
	<a href="/librarian/login"><button>Login</button></a>
	<a href="/"><button>Student Home</button></a>

</body>
</html>