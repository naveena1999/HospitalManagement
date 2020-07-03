package com.login.controller;
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.bean.Search;
import com.login.dao.SearchDao;

 
public class SearchServlet extends HttpServlet {
private static final long serialVersionUID =  102831973239L;;
 
public SearchServlet() {
}
//System.out.println("age is"+age);
public String age; 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
  String patientid=String.valueOf(request.getParameter("patientid"));
    
    String address=request.getParameter("address");
    String patientssnid=request.getParameter("patientssnid");
 String patientname=request.getParameter("patientname");
 String state=request.getParameter("state");
 String city=request.getParameter("city");
 String age=request.getParameter("age");
 String doj=request.getParameter("doj");
 String typeofbed=request.getParameter("typeofbed");
    Search fetchbean = new Search();
 fetchbean.setPatientid(patientid);
// fetchbean.setAge(age);


    SearchDao fetchdao=new SearchDao();
 
    
 
    try
    {
        String userValidate = fetchdao.authenticateUser(fetchbean);
 
        if(userValidate.equals("correctid"))
        {
           
 
           HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("patientssnid", patientssnid);
            session.setAttribute("patientid", patientid);//setting session attribute
            request.setAttribute("patientssnid",fetchdao.patientssnid);
            session.setAttribute("age", age);
            session.setAttribute("address", address);
        	session.setAttribute("city", city);
        	session.setAttribute("patientname", patientname);
			session.setAttribute("state", state);
            request.setAttribute("patientname",fetchdao.patientname);
            request.setAttribute("age",fetchdao.age);
        	session.setAttribute("typeofbed", typeofbed);
            request.setAttribute("patientid",fetchdao.patientid);
            request.setAttribute("city",fetchdao.city);
            request.setAttribute("address", fetchdao.address);
            request.setAttribute("typeofbed", fetchdao.typeofbed); // 
            request.setAttribute("state",fetchdao.state);
            request.getRequestDispatcher("/JSP/SearchResult.jsp").forward(request, response);
            System.out.println("age is"+fetchdao.age);
        }
        else if(userValidate.equals("notvalid"))
        {
        	System.out.print("error in dbjjj!!");
        	System.out.println(patientid);
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