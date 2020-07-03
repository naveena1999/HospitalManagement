package com.login.controller;
import com.login.bean.medicinebean;
import com.login.dao.medicinedao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class medicine extends HttpServlet {
	/**
	 * 
	 */

    
   
	
	private static final long serialVersionUID = 1L;




	public medicine()
	{
		
	}
	

	  medicinedao  createcustomerDao = new medicinedao();
	
	     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        //Copying all the input parameters in to local variables
	    	 String patientid = request.getParameter("patientid");
	    	 String patientssnid = request.getParameter("patientssnid");
	    	 String medicinename = request.getParameter("medicinename");
	         String rate = request.getParameter("rate");
	         System.out.println(medicinename);
	          String quantity = request.getParameter("quantity");
	         String medicineid = request.getParameter("medicineid");
	         
	        medicinebean  customer=new medicinebean();
	        customer.setPatientid(patientid);
customer.setPatientssnid(patientssnid);
	        customer.setMedicinename(medicinename);
	      customer.setRate(rate);
	      customer.setQuantity(quantity);
	      customer.setMedicineid(medicineid);
	      
	        //Using Java Beans - An easiest way to play with group of related data
	        
	      try {
	            createcustomerDao.registerCustomer(customer);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        response.sendRedirect("JSP/medicine.jsp");
	    }
	}
