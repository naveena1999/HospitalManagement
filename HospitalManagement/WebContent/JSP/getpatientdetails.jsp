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
<td>medicinename</td>
<td>medicineid</td>
<td>rate</td>
<td>quantity</td>



</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="select * from medicines where patientid="+id;
resultSet = statement.executeQuery(sql);


while(resultSet.next()){
 
	
%>
<tr>
<td><%=resultSet.getString("patientid") %></td>
<td><%=resultSet.getString("patientssnid") %></td>
<td><%=resultSet.getString("medicines") %></td>
<td><%=resultSet.getString("medicineid") %></td>
<td><%=resultSet.getString("rate") %></td>
<td><%=resultSet.getString("quantity") %></td>

</tr>
<% 
}
connection.close();    
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<a href="test.jsp">test to be taken</a>
</body>
</html>