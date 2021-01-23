<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="login.css">
<title>Login</title>
</head>

<body style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('front.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">

<div class="login">
  <h1>Welcome</h1>
    <form action="MainServlet" method="post">
      <input  type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Enter Valid Email ID" placeholder="Username" required="required" />
        <input type="password" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">LogIn.</button>
    </form>
</div>

</body>
</html>