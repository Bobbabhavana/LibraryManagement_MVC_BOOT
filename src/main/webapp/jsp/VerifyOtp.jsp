<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>${pos}</h1>
    <h1>${neg}</h1>
    <form action="/librarian/signup/${id}" method="post">
        Enter OTP: <input type="text" name="otp">
        <button>Submit</button>
    </form>
</body>
</html>