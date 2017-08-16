/*
 *
 */
package com.mvc.dao;

import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SignInDao {

    public static int checkDetails(String mailPhone, String password) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = DBConnection.getConnection();
        try {
            ps = con.prepareStatement("select * from infoconnect.signup_info where (email=? or phone=?) and password=?");
            ps.setString(1, mailPhone);
            ps.setString(2, mailPhone);
            ps.setString(3, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SignInDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        } finally {
            DBConnection.closeConnection(con);
        }
    }

    public static int checkStatus(String mailPhone) {
        Connection con = DBConnection.getConnection();
        int status = 0;
        try {
            PreparedStatement ps = con.prepareStatement("Select * from infoconnect.signup_info where (email=? or phone=?)");
            ps.setString(1, mailPhone);
            ps.setString(2, mailPhone);
            ResultSet rs = ps.executeQuery();
            rs.next();
            status = rs.getInt("status");
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
        return status;
    }
}
