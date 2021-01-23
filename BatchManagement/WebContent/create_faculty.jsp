<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="create_associate.css">
<link rel="stylesheet" href="create_faculty.css">
<title>Create New Faculty</title>
<style>
    input:hover[type="submit"] 
        {
            background: #D6EAF8;
        }
    ul{
        padding: 0;
        list-style: none;
        background: #99ccff;
    }
    ul li{
        display: inline-block;
        position: relative;
        line-height: 21px;
        text-align: left;
    }
    ul li a{
        display: block;
        padding: 8px 25px;
        color: #333;
        text-decoration: none;
    }
    ul li a:hover{
        color: #fff;
        background: #000000;
    }
    ul li ul.dropdown{
        min-width: 100%; /* Set width of the dropdown */
        background: #ffffff;
        display: none;
        position: absolute;
        z-index: 999;
        left: 0;
    }
    ul li:hover ul.dropdown{
        display: block; /* Display the dropdown */
    }
    ul li ul.dropdown li{
        display: block;
    }
</style>
</head>
<body style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('front.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">

	<ul>
        <li><a href="admin_first.jsp">Home</a></li>
        <li><a href="#">About</a></li>
        <li>
            <a href="#">Manage Batch &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">View Batch</a></li>
                <li><a href="<%=request.getContextPath()%>/CreateBatch">Add Batch</a></li>
            </ul>
        </li>

          <li>
            <a href="#"> Manage Faculty &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">View Faculty</a></li>
                <li><a href="create_faculty.jsp">Add Faculty</a></li>
            </ul>
        </li>

        <li>
            <a href="#"> Manage Associate &#9662;</a>
            <ul class="dropdown">
                <li><a href="<%=request.getContextPath()%>/ViewAssociate">View Associate</a></li>
                <li><a href="<%=request.getContextPath()%>/CreateAssociate">Add Associate</a></li>
            </ul>
        </li>
        <li><a href="login.jsp">Logout</a></li>
        
    </ul>
<h3 style="color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center;">Create New Faculty</h3>
<form action="NewFacultyToDB" method="post">
 
<table align="center" cellpadding = "10">
 
<!----- First Name ---------------------------------------------------------->
<tr>
<td style="color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center;">First Name: </td>
<td><input type="text" name="First_Name" maxlength="30"/>
</td>
</tr>


<tr>
<td style="color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center;">Last Name: </td>
<td><input type="text" name="Last_Name" maxlength="30"/>
</td>
</tr>
 
<!----- Last Name ---------------------------------------------------------->

<tr>
<td style="color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center;">Email ID : </td>
<td><input type="text" name="Email" maxlength="30"/>

</td>
</tr>


<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="2" align="center">
<input type="submit" value="Submit" style="font-family:Arial;color: #CD6155; font-size: 20px;">
</td>
</tr>
</table>
 
</form>
 
</body>
</html>