package com.login.controller;
import com.login.bean.PatientRegistration;
import com.login.dao.PatientRegistrationDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class PatientRegistrationController extends HttpServlet {
	/**
	 * 
	 */

    
   
	
	private static final long serialVersionUID = 1L;




	public PatientRegistrationController()
	{
		
	}
	

	  PatientRegistrationDao  createcustomerDao = new PatientRegistrationDao();
	
	     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        //Copying all the input parameters in to local variables
	        
	    	 String patientname = request.getParameter("patientname");
	         String typeofbed = request.getParameter("typeofbed");
	         System.out.println(typeofbed);
	          String age = request.getParameter("age");
	         String city = request.getParameter("city");
	         String address= request.getParameter("address");
	         String state= request.getParameter("state");
	         String patientssnid= request.getParameter("patientssnid");
	         PatientRegistration customer=new PatientRegistration();
	      customer.setAddress(address);
	      customer.setAge(age);
	      customer.setCity(city);
	      customer.setPatientname(patientname);
	      customer.setPatientssnid(patientssnid);
	      customer.setTypeofbed(typeofbed);
	      customer.setState(state);
	        //Using Java Beans - An easiest way to play with group of related data
	        
	      try {
	            createcustomerDao.registerCustomer(customer);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        response.sendRedirect("JSP/Successfull.jsp");
	    }
	}
