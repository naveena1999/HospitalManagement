<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.login.controller.SearchServlet" %>  
<!DOCTYPE html>
<html>

<meta charset="ISO-8859-1">
<title>Search Patient</title>
</head>


<body>
<form name="form" action="<%=request.getContextPath()%>/SearchServlet" method="post" >

        <table align="center">
         <tr>
         <td>Patientssnid</td>
        <td><input type="text" name="patientssnid" value="<%=request.getAttribute("patientssnid") %>"></td>
         </tr>
         <tr>
         <td>Patient ID</td>
         <td><input type="text" name="patientid" value="<%=request.getAttribute("patientid") %>"></td>
         </tr>
         <tr>
         <td>Patient Name</td>
         <td><input type="text" name="patientname"  value=<%=request.getAttribute("patientname") %>> </td>
         </tr>
        
         <tr>
         <td>Type of bed</td>
         <td><input type="text" name="typeofbed"  value=<%=request.getAttribute("typeofbed") %>> </td>
         </tr>
       
         <tr>
         <td>Age</td>
         <td><input type="text" name="age" value=<%=request.getAttribute("age") %>></td>
         </tr>
         <tr>
        <td>Address</td>
         <td><input type="text" name="address" value=<%=request.getAttribute("address") %>></td>
         </tr>
          <tr>
        <td>State</td>
         <td><input type="text" name="state"value=<%=request.getAttribute("state") %>> </td>
         </tr>
          <tr>
        <td>City</td>
         <td><input type="text" name="city"value=<%=request.getAttribute("city") %>> </td>
         </tr>         
        
         
         <tr>
         <td> <a href="JSP/Successfull.jsp">Click to go back</a>
         
         </tr>
         
        </table>
        
    </form>
 
  

</body>
</html>