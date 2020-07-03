	
package com.login.dao;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import com.login.bean.LoginBean;
import com.login.util.DBConnection;
 
public class LoginDao {
 
public String authenticateUser(LoginBean loginBean)
{
    String username = loginBean.getUsername();
    String password = loginBean.getPassword();
 
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
    String usernameDB = "";
    String passwordDB = "";
    
    
    try
    {
        con = DBConnection.createConnection();
        statement = con.createStatement();
        resultSet = statement.executeQuery("select username,password from login");
 
        while(resultSet.next())
        {
            usernameDB = resultSet.getString("username");
            passwordDB = resultSet.getString("password");
            //roleDB = resultSet.getString("role");
 
            if(username.equals(usernameDB) && password.equals(passwordDB)&& usernameDB.equals("registration"))
            return "valuesfoundindbr";
            if(username.equals(usernameDB) && password.equals(passwordDB)&& usernameDB.equals("pharmacy"))
                return "valuesfoundindbp";
            if(username.equals(usernameDB) && password.equals(passwordDB)&& usernameDB.equals("lab"))
                return "valuesfoundindbl";
            if(username.equals(usernameDB) && password.equals(passwordDB)&& usernameDB.equals("cashier"))
                return "valuesfoundindbc";
        }
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
    return "Invalid user credentials";
}
}