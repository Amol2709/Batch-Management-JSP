<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Batch View</title>
        <link rel="stylesheet" href="view_associate.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">

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
    <% List<String> associates = (List<String>)request.getAttribute("associates");%>
    <ul>
        <li><a href="admin_first.jsp">Home</a></li>
        <li><a href="admin_first.jsp">About</a></li>
        <li>
            <a href="#">Manage Batch &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">View Batch</a></li>
                <li><a href="#">Add Batch</a></li>
            </ul>
        </li>

          <li>
            <a href="#"> Manage Faculty &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">View Faculty</a></li>
                <li><a href="#">Add Faculty</a></li>
            </ul>
        </li>

        <li>
            <a href="#"> Manage Associate &#9662;</a>
            <ul class="dropdown">
                <li><a href="#">View Associate</a></li>
                <li><a href="#">Add Associate</a></li>
            </ul>
        </li>
        <li><a href="login.jsp">Logout</a></li>
        
    </ul>

      <form action="DelModAssociate" method="post">
      
        <h1>Associate View</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Associate</legend>
          
          <select id="job" name="assoc_name">
            <option value="associate_null">Select Associate</option>
		    <% for(String associate: associates){ %> 
		    <option value="<%=associate%>"><%=associate%></option>
		    <%}%>
        </select>
          
        </fieldset>
        <button  style=" background-color: #4bc970;" type="submit" name="name" value="modify">Modify</button>
        <button  style=" background-color: #212F3D;" type="submit" name="name" value="delete">Delete</button>
      </form>

      
    </body>
</html>