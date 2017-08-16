/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
    
    public static Connection getConnection(){
        Connection con = null;
        try {
        Class.forName("com.mysql.jdbc.Driver");
        con = (Connection) (DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/first", "root", "mindfire"));
        } catch(Exception e) {
            
        }
        return con;
    }
    
    public static void closeConnection(Connection con) {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}
