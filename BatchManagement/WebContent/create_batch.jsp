<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="create_batch.css">
<title>Create New Batch</title>
<style>
    input:hover[type="submit"] 
        {
            background: #D6EAF8;
        }
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
<body style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('front.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">
	<% List<String> faculties = (List<String>)request.getAttribute("faculties");%>
<form action="NewBatchToDB" method="post">
	<ul>
        <li><a href="admin_first.jsp">Home</a></li>
        <li><a href="admin_first.jsp">About</a></li>
        <li>
            <a href="#">Manage Batch &#9662;</a>
            <ul class="dropdown">
                <li><a href="<%=request.getContextPath()%>/ViewAssociate">View Batch</a></li>
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
                <li><a href="#">View Associate</a></li>
                <li><a href="<%=request.getContextPath()%>/CreateAssociate">Add Associate</a></li>
            </ul>
        </li>
        <li><a href="login.jsp">Logout</a></li>
        
    </ul>
<h3 style=" font-family:courier;font-size:160%;color: #ffffff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center;">Create New Batch</h3>

 
<table align="center" cellpadding = "10">
 
<!----- First Name ---------------------------------------------------------->
<tr>
<td style="font-family:Arial; font-size: 20px; font-family:Arial; font-size: 20px;color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;">BATCH NAME : </td>
<td><input type="text" name="Batch_Name" maxlength="30"/>
</td>
</tr>
 
<!----- Last Name ---------------------------------------------------------->
<tr>
<td style=" font-family:Arial; font-size: 20px;color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;">TECHNOLOGY : </td>
<td><input type="text" name="technology" maxlength="30"/>

</td>
</tr>

<tr>
<td style="font-family:Arial; font-size: 20px;color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;">Faculty:</td>
<td>
    <select name="facultydrop" id="faculty">
    <option value="faculty1">Select Faculty</option>
    <% for(String faculty: faculties){ %> 
    <option value="<%=faculty%>"><%=faculty%></option>
    <%}%>
  </select>

</td>
</tr>
 
<!----- Date Of Birth -------------------------------------------------------->
<tr>
<td style=" font-family:Arial; font-size: 20px;color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;">Start Date</td>
 
<td>
<select name="S_day" id="Birthday_Day" >
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>
</select>
 
<select name="S_month">
<option value="-1">Month:</option>
<option value="January">Jan</option>
<option value="February">Feb</option>
<option value="March">Mar</option>
<option value="April">Apr</option>
<option value="May">May</option>
<option value="June">Jun</option>
<option value="July">Jul</option>
<option value="August">Aug</option>
<option value="September">Sep</option>
<option value="October">Oct</option>
<option value="November">Nov</option>
<option value="December">Dec</option>
</select>
 
<select name="S_year" id="Birthday_Year">
 
<option value="-1">Year:</option>
<option value="2021">2021</option>

</select>
</td>
</tr>





<tr>
<td style=" font-family:Arial; font-size: 20px;color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;">End Date</td>
 
<td>
<select name="E_day" id="End_Day">
<option value="-1">Day:</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
 
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
 
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
 
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
 
<option value="31">31</option>
</select>
 
<select name="E_month" id="End_Month">
<option value="-1">Month:</option>
<option value="January">Jan</option>
<option value="February">Feb</option>
<option value="March">Mar</option>
<option value="April">Apr</option>
<option value="May">May</option>
<option value="June">Jun</option>
<option value="July">Jul</option>
<option value="August">Aug</option>
<option value="September">Sep</option>
<option value="October">Oct</option>
<option value="November">Nov</option>
<option value="December">Dec</option>
</select>
 
<select name="E_year" id="End_Year">
 
<option value="-1">Year:</option>
<option value="2021">2021</option>

</select>
</td>
</tr>
 

 

 

 
<!----- Address ---------------------------------------------------------->
<tr>

<td style="font-family:Arial; font-size: 20px;color: #000000; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;">Batch Description:  <br /><br /><br /></td>
<td><textarea name="B_description" rows="4" cols="30"></textarea></td>
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