package com.login.controller;
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
import com.login.bean.LoginBean;
import com.login.dao.LoginDao;
 
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID =  102831973239L;;
 
public LoginServlet() {
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    String username = request.getParameter("username");
    String password = request.getParameter("password");
 
    LoginBean loginBean = new LoginBean();
 
    loginBean.setUsername(username);
    loginBean.setPassword(password);
 username=loginBean.getUsername();
 System.out.print("hi"+username);
    LoginDao loginDao = new LoginDao();
 
    try
    {
        String userValidate = loginDao.authenticateUser(loginBean);
 
        if(userValidate.equals("valuesfoundindbr"))
        {
            
 
           // session.setAttribute("", username); //setting session attribute
            request.setAttribute("username", username);
 
            request.getRequestDispatcher("/JSP/Successfull.jsp").forward(request, response);
        }
       
        if(userValidate.equals("valuesfoundindbp"))
        {
            
 
           // session.setAttribute("", username); //setting session attribute
            request.setAttribute("username", username);
 
            request.getRequestDispatcher("/JSP/pharmacy.jsp").forward(request, response);
        }
        if(userValidate.equals("valuesfoundindbl"))
        {
            
 
           // session.setAttribute("", username); //setting session attribute
            request.setAttribute("username", username);
 
            request.getRequestDispatcher("/JSP/lab.jsp").forward(request, response);
        }
        if(userValidate.equals("valuesfoundindbc"))
        {
            
 
           // session.setAttribute("", username); //setting session attribute
            request.setAttribute("username", username);
 
            request.getRequestDispatcher("/JSP/cashier.jsp").forward(request, response);
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