<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String patientid= request.getParameter("patientid");
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hospital";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;
%>
<html>
<style>
body{
background-color:Aqua;}
</style>
<body >
<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>patientid</td>
<td>patientssnid</td>
<td>patientname</td>
<td>age</td>
<td>doj</td>
<td>type of bed</td>
<td>address</td>
<td>city</td>
<td>state</td>
<td>dod</td>
<td>days</td>


</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1="Update patientreg set dod=now() where patientid="+patientid;
 PreparedStatement ps = connection.prepareStatement(sql1);
 int i = ps.executeUpdate();
 String sql2="Update patientreg set days=DATEDIFF(dod,doj)";
 PreparedStatement ps1 = connection.prepareStatement(sql2);
 int k=ps1.executeUpdate();
String sql ="select * from patientreg where patientid="+patientid;
resultSet = statement.executeQuery(sql);


while(resultSet.next()){
 
	
%>
<tr>
<td><%=resultSet.getString("patientid") %></td>
<td><%=resultSet.getString("patientssnid") %></td>
<td><%=resultSet.getString("patientname") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("doj") %></td>
<td><%=resultSet.getString("typeofbed") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("state") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("dod") %></td>
<td><%=resultSet.getString("days") %></td>
</tr>
<%
String typeofbed=resultSet.getString("typeofbed");
String noofdays=resultSet.getString("days");
System.out.println("howryou"+patientid);
int cost=0;
if(typeofbed.equals("semisharing"))
		{
	cost=cost+4000;
		}
if(typeofbed.equals("general"))
{
cost=cost+2000;
}
if(typeofbed.equals("single"))
{
cost=cost+8000;
}
String sql3="Update patientreg set cost=? where patientid="+patientid;
PreparedStatement ps3 = connection.prepareStatement(sql3);
ps3 = connection.prepareStatement(sql3);
ps3.setInt(1,cost);
int kp=ps3.executeUpdate();	
String sql4 ="select * from patientreg where patientid="+patientid;
resultSet = statement.executeQuery(sql4);
String g=null;
while(resultSet.next())
{%>
	<h1><%=resultSet.getString("patientname") %>- bill is rupees<%=resultSet.getString("cost") %></h1>
	<% 
}
System.out.println(g);
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<a href="medicine.jsp">ISSUE MEDICINE</a>
</body>
</html>