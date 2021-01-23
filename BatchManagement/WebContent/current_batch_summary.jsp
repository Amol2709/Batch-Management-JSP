<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="current_batch_summary.css">
<style>


  body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 600px;
  bottom:  200px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 400px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: blue;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
body {
  margin: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 10%;
  background-color: #FEF9E7 ;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #000000;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
</style>
</head>
<body style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('front.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">
  <ul style=" opacity: 0.6;">
  <li><a  class="active" href="#home">Current Status</a></li>
  <li><a onclick="openForm()" href="#">Batch 1</a></li>
  <li><a onclick="openForm()"href="#">Batch 2</a></li>
  <li><a onclick="openForm()"href="#">Batch 3</a></li>
  <li><a onclick="openForm()";href="#">Batch 4</a></li>
  <li><a href="login.jsp">LogOut</a></li>
</ul>
<div style=" opacity: 0.7;" class="form-popup" id="myForm">
  <form action="/" class="form-container">




        <h1>Batch Name Status</h1>
        
        <fieldset>
          <legend><span class="number">1</span>OnGoing Training</legend>
          <input  style="font-size: 20px; color: #58D68D;font-weight: 500;" type="text" placeholder="Java" name="email" disabled>

          
        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Faculty</legend>
          <input  style="font-size: 20px; color: #922B21;font-weight: 500;" type="password" placeholder="Faculty Name" name="psw" disabled>
        </fieldset>
        
        

  </form>
</div>
<script >

function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}

</script>




</body>
</html>
