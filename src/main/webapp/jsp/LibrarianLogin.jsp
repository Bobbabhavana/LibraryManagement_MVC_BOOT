<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>LIB Login</title>
   <style>
        *{
    margin:0;
    padding:0;
 }
     body{
     background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC6n5oLdOmJ_Nmqqx-l1sAtLSM__FfgsGSIQ&usqp=CAU");
     background-size: cover;
     width: 100%;
     height: 100vh;
     background-position: center;
     background-repeat: no-repeat;
     overflow-x: hidden;   
 }
h1{
    left:200px;
    padding-left:340px;
    padding-top:10px;
    color: rgb(238, 31, 100);
    top:200px;
    font-weight: bolder;
    font-size:40px;
}
.tablecontent{
	border-style: solid;
	border-color: black;
	background-color:  rgba(128, 128, 128, 0.457);
	position: relative;
	top:20px;
	left:380px;
	width: 23.2%;
	height: 140px;
	box-shadow: 5px 5px 5px black;
	border-radius: 8px;
}


</style>
    </head>

    <body>
        <h1 style="color: green;">${pos}</h1>
        <h1 style="color: red;">${neg}</h1>
        
            <h1>Librarian Login Page</h1>
            <form action="/librarian/login" method="post">
              
                    <table class="tablecontent">
                        <tr>
                            <td>Email:</td>
                            <td><input type="email" name="email"></td>
                        </tr>

                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password"></td>
                        </tr>

                        <tr>
                            <td><button>Cancel</button></td>
                            <td><button>Submit</button></td>
                        </tr>

                         <th> <a href="/librarian/main"><button type="button">Back</button></th>
                    </table>

                   
               
            </form>

        
    </body>

    </html>