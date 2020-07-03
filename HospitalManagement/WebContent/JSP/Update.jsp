<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String patientid = request.getParameter("patientid");
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
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from patientreg where patientid="+patientid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="UpdateProcess.jsp">
<input type="hidden" name="patientid" value="<%=resultSet.getString("patientid") %>">
<input type="text" name="patientid" value="<%=resultSet.getString("patientid") %>">
<br>
Patient ID:<br>
<input type="text" name="patientid" value="<%=resultSet.getString("patientid") %>">
<br>
Patient name:<br>
<input type="text" name="patientname" value="<%=resultSet.getString("patientname") %>">
<br>
Patient ssnid:<br>
<input type="text" name="patientssnid" value="<%=resultSet.getString("patientssnid") %>">
<br>
Age:<br>
<input type="text" name="age" value="<%=resultSet.getString("age") %>">
<br>
Type of bed:<br>
<input type="text" name="typeofbed" value="<%=resultSet.getString("typeofbed") %>">
<br>
Date of joining:<br>
<input type="text" name="doj" value="<%=resultSet.getString("doj") %>">
<br>
Address:<br>
<input type="text" name="address" value="<%=resultSet.getString("address") %>">
<br>
State:<br>
<input type="text" name="state" value="<%=resultSet.getString("state") %>">
<br>
City:<br>
<input type="text" name="city" value="<%=resultSet.getString("city") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>