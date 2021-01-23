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
    <% List<String> batches = (List<String>)request.getAttribute("batches");%>
    <% String curr_batch = (String)request.getAttribute("curr_batch"); %>
    <% int id = (int)request.getAttribute("id"); %>
    <% int uid = (int)request.getAttribute("uid"); %>
    

      <form action="ModifyAssociate" method="post">
      
        <h1>Associate View</h1>
        <h2><%=request.getAttribute("asso_name") %></h2>
        
        <fieldset>
          <legend><span class="number">1</span>Batch</legend>
        
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="uid" value="<%=uid%>">
        <label for="job">Current Batch:</label>
        <select id="job" name="user_job">
            <option value="<%=curr_batch %>"><%=curr_batch %></option>
            <% for(String batch: batches){ %> 
		    <option value="<%=batch%>"><%=batch%></option>
		    <%}%>
        </select>
        </fieldset>
        <button  style=" background-color: #4bc970;" type="submit">Done</button>
      </form>

      
    </body>
</html>