package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.login.bean.testbean;

public class testdao {

    public int registerCustomer(testbean CreateCustomer) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO tests" +
            "  (patientid , patientssnid ,testname,rate) VALUES " +
            " (?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");
System.out.println("hi");
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/hospital?useSSL=false", "root", "root");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            //preparedStatement.setInt(1, 1);
        	preparedStatement.setString(1, CreateCustomer.getPatientid());
            preparedStatement.setString(2, CreateCustomer.getPatientssnid());
            preparedStatement.setString(3, CreateCustomer.getTestname());
            preparedStatement.setString(4, CreateCustomer.getRate());
            

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
