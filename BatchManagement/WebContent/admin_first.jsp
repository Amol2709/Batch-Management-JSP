<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin View</title>
<style>
    ul{
        padding: 0;
        list-style: none;
        background: #ECF0F1;
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
<body  style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('front.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">
    <ul>
        <li><a href="admin_first.jsp">Home</a></li>
        <li><a href="admin_first.jsp">About</a></li>
        <li>
            <a href="#">Manage Batch &#9662;</a>
            <ul class="dropdown">
                <li><a href="<%=request.getContextPath()%>/ViewBatch">View Batch</a></li>
                <li><a href="<%=request.getContextPath()%>/CreateBatch">Add Batch</a></li>
            </ul>
        </li>

          <li>
            <a href="#"> Manage Faculty &#9662;</a>
            <ul class="dropdown">
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
    <p  style="color:white; font-family:courier;font-size:160%;text-align:center; position: absolute;
  left: 500px;
  top: 150px;">Welcome</p>

 
</body>
</html>