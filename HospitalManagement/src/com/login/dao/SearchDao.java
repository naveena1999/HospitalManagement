	
package com.login.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import com.login.bean.Search;
import com.login.util.DBConnection;
 import com.login.controller.SearchServlet;
public class SearchDao {
	public  String patientid=" ";
	public String patientname = " ";
   // @SuppressWarnings("unused")
	public String age = "";
    //@SuppressWarnings("unused")
	public String address= "";
    //@SuppressWarnings("unused")
	public String patientssnid = "";
	public String state="";
	public String city="";
	public String doj="";
	public String typeofbed="";
//public static final String customername = null;
//public static String customername;
//public static String customername;
SearchServlet f=new SearchServlet();
public String authenticateUser(Search fetchbean)
{
    String patientidb = fetchbean.getPatientid();
   // String password = loginBean.getPassword();
 System.out.println(patientidb);
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
   // @SuppressWarnings("unused")
   
    Search fb=new Search();
    try
    {
    	System.out.println("Register");
        con = DBConnection.createConnection();
       statement = con.createStatement();
        resultSet = statement.executeQuery("select patientid,patientssnid,patientname,age,address,state,city,typeofbed from patientreg where patientid= '" + patientidb + "'");
        
        while(resultSet.next())
        {
        	patientid=String.valueOf(resultSet.getInt(1));
        	//fb.setCustomerid(customeridDB);
        	fb.setPatientid(patientid);
        	patientssnid=String.valueOf(resultSet.getInt(2));
        	fb.setPatientssnid(patientssnid);
        	patientname=resultSet.getString(3);
        	fb.setPatientname(patientname);
        	age=String.valueOf(resultSet.getInt(4));
        	fb.setAge(age);
        	address=resultSet.getString(5);
        	fb.setAddress(address);
        	state=String.valueOf(resultSet.getString(6));
        	fb.setState(state);
        	city=String.valueOf(resultSet.getString(7));
        	fb.setCity(city);
        	typeofbed=String.valueOf(resultSet.getString(8));
        	fb.setTypeofbed(typeofbed);
        	 System.out.println(typeofbed);
        	
        	
        }
        System.out.println(resultSet+"ff");
            if(patientid.equals(patientidb))
            {
            	System.out.println("correctid");
            	return"correctid";
            }
            else  
            {
System.out.println(patientidb);
System.out.println(patientid);
System.out.println(resultSet+"ff");
            	
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