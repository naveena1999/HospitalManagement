<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropbtn {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}
.dropbtn1 {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}
.dropbtn2 {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}
.dropbtn:hover, .dropbtn:focus {
  background-color: #2980B9;
}
.dropbtn1:hover, .dropbtn1:focus {
  background-color: #2980B9;
}
.dropbtn2:hover, .dropbtn1:focus {
  background-color: #2980B9;
}
.dropdown {
  position: relative;
  left:15%;
  top:85%;
  display: inline-block;
}
.dropdown1 {
  
   margin: 0;
  position: absolute;
  
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.dropdown2 {
  
   margin: 0;
  position: absolute;
  left:300%;
  
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.dropdown1-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown2-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown2-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown1-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.show1 {display: block;}
.show2 {display: block;}
.dropdown a:hover {background-color: #ddd;}
.dropdown1 a:hover {background-color: #ddd;}
.dropdown2 a:hover {background-color: #ddd;}
.show {display: block;}
h2
{text-align: center;}

body {background-color: Aqua;}

</style>
</head>
<body>

<div><h2 > ABC Hospital Management</h2></div>





  <div class="dropdown">
  <button onclick="myFunction2()" class="dropbtn">Diagnosis</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="JSP/getid.jsp">test to be taken</a>
     <a href="JSP/getid2.jsp">test details </a>
    <a href="JSP/Totalbill.jsp">Total Bill </a>
    
  </div>
</div>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */

function myFunction2() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}
// Close the dropdown if the user clicks outside of it


window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn2')) {
	    var dropdowns = document.getElementsByClassName("dropdown2-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show2')) {
	        openDropdown.classList.remove('show2');
	      }
	    }
	  }
	}

</script>

</body>   
</html>
