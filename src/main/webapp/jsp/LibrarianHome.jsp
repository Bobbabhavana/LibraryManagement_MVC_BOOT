<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian Home</title>
    
       <style>
    *{
   margin:0;
   padding:0;
}
    body{
    background-image: url(https://m.media-amazon.com/images/I/51Tn14yrvVL._AC_UF1000,1000_QL80_.jpg);
    background-size: cover;
    width: 100%;
    height: 100vh;
    background-position: center;
    background-repeat: no-repeat;
    overflow-x: hidden;   
}
 button{
    position: relative;
    left:30%;
    width:90px;                                                                                                                                                                                 
    font-size:10px;
     top:110px;
    padding: 10px 20px 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    background-color:rgba(13, 100, 171, 0.559);
    border-color: burlywood;
    border-radius: 10px;
    font-weight: bolder;
   
}   
 h1{
 position: relative;
 left:30%;
 top:70px;
 font-size: 60px;
 }
 
 
 
 
 </style>
 
 
</head>


<body>
    <h1 style="color: green;">${pos}</h1>
    <h1 style="color: red;">${neg}</h1>
    <div>
    <a href="/librarian/addbook"><button>Add Book</button></a>
    <a href="/librarian/fetchbooks"><button>View Book</button></a>
    <a href="/librarian/history"><button>Book Records</button></a>
    <a href="/logout"><button>Logout</button></a>
    </div>
</body>

</html>