<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="associate_info.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Student_INFO</title>
<style>
    input:hover[type="submit"] 
        {
            background: green;
        }
    ul{
        padding: 0;
        position:relative;
        list-style: none;
        background: #99ccff;
        list-style-type: none;
        margin-top:5px;
        margin-left:900px;
        font-size:20px;
    }
    ul li{
        display: inline-block;
        position: relative;
        padding: 8px 10px;
        text-align: left;
        left:300px;
    }
    ul li a{
        display: block;
        padding: 8px 8px;
        color: #333;
        text-decoration: none;
        margin-top: 0px;
        margin-right: 100px;
        width:80px;
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


<body style="width: 100%;height:100%;font-family: 'Open Sans', sans-serif; background-image: url('associate.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">

  <ul>
        <li><a href="login.jsp">Logout</a></li>

    </ul>

  <div class="container">
    <div class="hero">
      <h1 class="name" style="width: 400px;left: 10px;top: 20px;position: absolute;"><strong><%=request.getAttribute("name") %></strong><%=request.getAttribute("surname") %></h1>
      <span class="job-title" >Associate ID: <%=request.getAttribute("id") %></span>
      <span class="email" style="color: #512E5F"><%=request.getAttribute("email") %></span>
    </div>
  </div>

<!-- Skills and intrest section -->
  <div class="container">

    <div class="sections">
      <h2 class="section-title" style="font-size:30px">Trained on</h2>

      <div class="list-card">
        <div>
          <h3 style="font-size:30px">Python</h3>
          <span style="color: #1E8449;font-size:16px">Data Structures and Algorithm , Object Oriented Concepts ,etc..</span>
          
        </div>
      </div>
      
      <div class="list-card">
      
        <div>
          <h3 style="font-size:30px">PowerShell</h3>
          <span  style="color: #1E8449;font-size:16px">Window Management Instrumentation(WMI), PS-Remoting,etc..</span>
        </div>
      </div>  
          
      <div class="list-card">
        
        <div>
          <h3 style="font-size:30px">Bash</h3>
          <span style="color: #1E8449;font-size:16px">Scripting,loops,Conditional statement, etc..</span>
        </div>
      </div>


    </div>
    <div class="sections">
        <h2 class="section-title" style="font-size:30px">To Be Trained on: </h2>
        
        <div class="list-card">
          <div>
            <h3 style="font-size:30px">Mail Server</h3>
            <span style="color: #1E8449;font-size:16px">SMPTP,IMAP,POP3,MX Server,Outlook,etc...</span>
          
            
          </div>
        </div>

        <div class="list-card">
          <div>
            <h3 style="font-size:30px">Java</h3>
            <span style="color: #1E8449;font-size:16px">Data Structures and Algorithm , Object Oriented Concepts,etc..</span>
          
            
          </div>
        </div>  

        <div class="list-card">
          <div>
            <h3 style="font-size:30px">Domain Name Server</h3>
            <span style="color: #1E8449;font-size:16px">Zone Files,Different Zones,Authorative Server,etc..</span>
          
          </div>
        </div>    
    </div>
  </div>

  <!-- Achievements -->

  <div class="w3-container" style="width: 500px;
  left: 200px;
  top: 750px;
  position: absolute;">
    
    <h2>Grade Progress Bar: </h2>

  <div class="w3-light-grey">
      <div class="w3-container w3-green w3-center" style="width:65%">Python 25%
      </div>
  </div><br>

  <div class="w3-light-grey">
      <div class="w3-container w3-red w3-center" style="width:75%">PowerShell 10%
      </div>
  </div><br>

  <div class="w3-light-grey">
      <div class="w3-container w3-blue" style="width:75%">Bash 75%
      </div>
  </div><br>
 <br/>
  <br/>
  <br/>
    
     </div> 


</body>
</html>