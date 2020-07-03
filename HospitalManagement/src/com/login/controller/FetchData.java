package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/FetchData")
public class FetchData extends HttpServlet {
	 Connection con = null;
	    String url = "jdbc:mysql://localhost:3306/hospital";
	    String username = "root";
	    String password = "root";
	 
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		try
		{
			response.setContentType("text/html");
			Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager.getConnection(url,username,password);
			 PreparedStatement ps=con.prepareStatement("Select * from patientreg");
			 ResultSet rs=ps.executeQuery();
			 PrintWriter out=response.getWriter();
			 out.println("<html><body><table border='1'style=margin-left:auto;margin-right:auto;><tr><td>patientid</td><td>patientssnid</td><td>patientname</td><td>age</td><td>doj</td><td>typeofbed</td><td>address</td><td>city</td><td>state</td>");
		while(rs.next())
		{
			out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td></td></tr>");
		}
		out.println("</table></body></html>");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
