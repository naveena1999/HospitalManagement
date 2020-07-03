<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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



<td>Patientid</td>
<td>Cost for diagnosis</td>
<td>Cost for medicine</td>

<td>Cost for room</td>

<td>Total cost</td>


</tr>




<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="select rate from tests where patientid="+id;
resultSet = statement.executeQuery(sql);
int rate1=0;

while(resultSet.next()){
  rate1=resultSet.getInt("rate")+rate1;
	
%>

<% 
}
String sql2 ="select rate from medicines where patientid="+id;
resultSet = statement.executeQuery(sql2);
int rate2=0;

while(resultSet.next()){
  rate2=resultSet.getInt("rate")+rate2;
	
%>

<% 
}
String sql3 ="select cost from patientreg where patientid="+id;
resultSet = statement.executeQuery(sql3);
int rate3=0;

while(resultSet.next()){
  rate3=resultSet.getInt("cost");
	
%>
<%
}
int totalcost=0;
totalcost=rate1+rate2+rate3;
String INSERT_USERS_SQL = "INSERT INTO totalbilling" +
        "  (patientid ,dia,cmedicine,prate,totalcost) VALUES " +
        " (?,?,?,?,?);";
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL); 
            //preparedStatement.setInt(1, 1);
        	preparedStatement.setString(1, id);
            preparedStatement.setInt(2, rate1);
            preparedStatement.setInt(3, rate2);
            preparedStatement.setInt(4, rate3);
            preparedStatement.setInt(5, totalcost);
         int result = preparedStatement.executeUpdate();
         String sql4 ="select * from totalbilling where patientid="+id;
         resultSet1 = statement.executeQuery(sql4);
         String g=null;
         
        	 while(resultSet1.next()){
        		 
        			
        		 %>
        		 <tr>
        		 <td><%=resultSet1.getString("patientid") %></td>
        		 <td><%=resultSet1.getString("dia") %></td>
        		 <td><%=resultSet1.getString("cmedicine") %></td>

        		 <td><%=resultSet1.getString("prate") %></td>
 <td><%=resultSet1.getString("totalcost") %></td>

        		 </tr>
        		 <% 
        		 }
connection.close();    
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<a href="Login.jsp">test to be taken</a>
</body>
</html>