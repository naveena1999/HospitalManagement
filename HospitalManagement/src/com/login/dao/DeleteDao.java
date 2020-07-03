	
package com.login.dao;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import com.login.bean.DeleteBean;
import com.login.util.DBConnection;
 import com.login.controller.DeleteServlet;
public class DeleteDao {
	public  String customeridDB=" ";
	//public String customername = " ";
   // @SuppressWarnings("unused")
	//public String age = "";
    //@SuppressWarnings("unused")
	//public String address= "";
    //@SuppressWarnings("unused")
	//public String customerssnid = "";
	//public String state="";
//public static final String customername = null;
//public static String customername;
//public static String customername;
DeleteServlet f=new DeleteServlet();
public String authenticateUser(DeleteBean fetchbean)
{
    String patientid = fetchbean.getPatientid();
   // String password = loginBean.getPassword();
 
    Connection con = null;
    Statement statement = null;
    int resultSet = 0;
    int resultSet1 = 0;
    int resultSet2 = 0;
    int resultSet3 = 0;
   // @SuppressWarnings("unused")
   
   DeleteBean fb=new DeleteBean();
    try
    {
    	System.out.println("Register");
        con = DBConnection.createConnection();
       statement = con.createStatement();
        resultSet = statement.executeUpdate("Delete from patientreg where patientid= '" + patientid + "'");
      
        
    System.out.println(resultSet);
        
            if(resultSet==1)
            {
            	System.out.println("correctid for delete");
            	return"correctid";
            }
            else  
            {
            	
            	return "notvalid";
            }
        
    }
    catch(SQLException e)
    {
        e.printStackTrace();
        System.out.println("ca");
    }
    return "Invalid user credentials";
}
}