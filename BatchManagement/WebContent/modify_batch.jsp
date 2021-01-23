<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Batch View</title>
        <link rel="stylesheet" href="view_batch.css">
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
  <% List<String> faculties = (List<String>)request.getAttribute("faculties");%>
    <% String curr_fac = (String)request.getAttribute("curr_fac"); %>
    <% String curr_tech = (String)request.getAttribute("curr_tech"); %>
    <% String batch_name = (String)request.getAttribute("batch_name"); %>
    <% int bid = (int)request.getAttribute("bid"); %>
      <form action="ModifyBatch" method="post">
      
        <h1>Batch View</h1>

         <fieldset>
          <legend><span class="number">1</span>Technology</legend>
          <input type="text" id="name" name="new_tech" value="<%=curr_tech %>">
      </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Faculty</legend>
       <input type="hidden" name="bid" value="<%=bid%>">
        <label for="job">Faculty:</label>
        <select id="job" name="new_fac">
            <option value="<%=curr_fac %>"><%=curr_fac %></option>
           <% for(String faculty: faculties){ %> 
		    <option value="<%=faculty%>"><%=faculty%></option>
		    <%}%>
         
          
        </select>
        
         
        
        </fieldset>
        <button  style=" background-color: #4bc970;" type="submit">Done</button>
      </form>
      
    </body>
</html>