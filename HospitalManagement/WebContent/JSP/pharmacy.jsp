<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.dropbtn1 {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}


.dropbtn1:hover, .dropbtn1:focus {
  background-color: #2980B9;
}


.dropdown1 {
  
   margin: 0;
  position: absolute;
  
  left: 50%;
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



.dropdown1-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.show1 {display: block;}


.dropdown1 a:hover {background-color: #ddd;}

.show {display: block;}
h2
{text-align: center;}

body {background-color: Aqua;}

</style>
</head>
<body>

<div><h2 > ABC Hospital Management</h2></div>



</div>

<div class="dropdown1">
  <button onclick="myFunction1()" class="dropbtn1">Pharmacy </button>
  <div id="myDropdown1" class="dropdown1-content">
    <a href="JSP/PharmacyBillingid.jsp">Issue Medicine</a>
    
    
    
  </div>
  
</div>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */

function myFunction1() {
	  document.getElementById("myDropdown1").classList.toggle("show1");
	}

// Close the dropdown if the user clicks outside of it

window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn1')) {
	    var dropdowns = document.getElementsByClassName("dropdown1-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show1')) {
	        openDropdown.classList.remove('show1');
	      }
	    }
	  }
	}

</script>

</body>   
</html>
