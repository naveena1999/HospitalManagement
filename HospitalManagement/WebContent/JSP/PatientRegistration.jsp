<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>body {background-color: Aqua;}
</style>
<title>Register</title>
<script> 
function validate()
{ 
    // var fullname = document.form.fullname.value;
    // var email = document.form.email.value;
     var patientname = document.form.patientname.value; 
     var patientssnid = document.form.patientssnid.value;
     var address= document.form.address.value;
     var city= document.form.city.value;
     var state= document.form.state.value;
     var age= document.form.age.value;
     
       
     
     if (email==null || email=="")
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     if (patientssnid==null || patientssnid=="")
     { 
     alert("Customer SSN ID can't be blank"); 
     return false; 
     }
     else if (patientname==null || patientname=="")
     { 
     alert("Customer name can't be blank"); 
     return false; 
     }
     else if (age==null || age=="")
     { 
     alert("Age can't be blank"); 
     return false; 
     }
     else if (address==null || address=="")
     { 
     alert("Address can't be blank"); 
     return false; 
     }
     else if (city==null || city=="")
     { 
     alert("City can't be blank"); 
     return false; 
     }
     else if (state==null || state=="")
     { 
     alert("State can't be blank"); 
     return false; 
     }
     
 } 
</script> 
</head>
<body>
<center><h2>REGISTRATION</h2></center>
    <form name="form" action="<%=request.getContextPath()%>/PatientRegistrationController" method="post" onsubmit="return validate()">
        <table align="center">
         <tr>
         <td>patient SSN ID</td>
         <td><input type="text" name="patientssnid" /></td>
         </tr>
         <tr>
         <td>patient Name</td>
         <td><input type="text" name="patientname" /></td>
         </tr>
         <tr>
         <td>Type of bed</td>
         <td><select name="typeofbed" id="typeofbed">
  <option value="single">single</option>
  <option value="general">general</option>
  <option value="sharing">sharing</option>
 
</select>
</td>
         <tr>
         <td>Age</td>
         <td><input type="text" name="age" /></td>
         </tr>
         <tr>
         <td>Address</td>
         <td><input type="text" name="address" /></td>
         </tr>
          <tr>
         <td>State</td>
         <td><input type="text" name="state" /></td>
         </tr>
         <tr>
         <td>City</td>
         <td><input type="text" name="city" /></td>
         </tr>
        
         <tr>
         <td><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></td>
         </tr>
         <tr>
         <td></td>
         <td><input type="submit" value="Register"></input><input
         type="reset" value="Reset"></input></td>
         </tr>
         
        </table>
    </form>
  
  
</body>
</html>