/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class MyConnection {

    public MyConnection() {
    }
    
    public static Connection getMyConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Sinhvien", "sa", "TH0402");
        return conn;
    }
    
    public static void main(String[] args) throws Exception {
        Connection conn = getMyConnection();
        System.out.println("Conn: " + conn);
    }
}
