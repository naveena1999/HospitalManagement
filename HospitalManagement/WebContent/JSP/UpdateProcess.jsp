<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/hospital";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String patientid = request.getParameter("patientid");
String patientname = request.getParameter("patientname");
String patientssnid = request.getParameter("patientssnid");
String doj=request.getParameter("doj");
String typeofbed = request.getParameter("typeofbed");
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String age=request.getParameter("age");
if(patientid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(patientid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update patientreg set patientid=?,patientname=?,age=?,address=?,city=?,state=? where patientid="+patientid;
ps = con.prepareStatement(sql);
ps.setString(1,patientid);
ps.setString(2, patientname);
ps.setString(3, age);
ps.setString(4, address);
ps.setString(5, city);
ps.setString(6, state);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>