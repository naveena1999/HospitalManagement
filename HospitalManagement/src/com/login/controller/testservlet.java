package com.login.controller;
import com.login.bean.testbean;
import com.login.dao.testdao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class testservlet extends HttpServlet {
	/**
	 * 
	 */

    
   
	
	private static final long serialVersionUID = 1L;




	public testservlet()
	{
		
	}
	

	  testdao  createcustomerDao = new testdao();
	
	     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        //Copying all the input parameters in to local variables
	    	 String patientid = request.getParameter("patientid");
	    	 String patientssnid = request.getParameter("patientssnid");
	    	 String testname = request.getParameter("testname");
	         String rate = request.getParameter("rate");
	         System.out.println(testname);
	          
	         
	        testbean  customer=new testbean();
	        customer.setPatientid(patientid);
customer.setPatientssnid(patientssnid);
	        customer.setTestname(testname);
	      customer.setRate(rate);
	      
	      
	        //Using Java Beans - An easiest way to play with group of related data
	        
	      try {
	            createcustomerDao.registerCustomer(customer);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        response.sendRedirect("JSP/test.jsp");
	    }
	}
