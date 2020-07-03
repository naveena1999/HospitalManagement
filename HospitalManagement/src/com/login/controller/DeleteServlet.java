package com.login.controller;
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.bean.DeleteBean;
import com.login.dao.DeleteDao;

 
public class DeleteServlet extends HttpServlet {
private static final long serialVersionUID =  102831973239L;;
 
public DeleteServlet() {
}
//System.out.println("age is"+age);
public String age; 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
  String patientid=String.valueOf(request.getParameter("patientid"));
    
   
    DeleteBean fetchbean = new DeleteBean();
 fetchbean.setPatientid(patientid);
// fetchbean.setAge(age);


    DeleteDao fetchdao=new DeleteDao();
 
    
 
    try
    {
        String userValidate = fetchdao.authenticateUser(fetchbean);
 
        if(userValidate.equals("correctid"))
        {
           
 
           HttpSession session = request.getSession(); //Creating a session
           
            //session.setAttribute("customerid", fetchbean.getCustomerid());//setting session attribute

            
            request.getRequestDispatcher("/JSP/Successfull.jsp").forward(request, response);
            System.out.println("Deleted Successfully");
        }
        else if(userValidate.equals("notvalid"))
        {
        	System.out.print("Id is not valid");
        	request.getRequestDispatcher("/JSP/Error.jsp").forward(request, response);
        }
        
        else
        {
            System.out.println("Error message = "+userValidate);
            request.setAttribute("errMessage", userValidate);
 
            request.getRequestDispatcher("/JSP/Error.jsp").forward(request, response);
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doPost()
}