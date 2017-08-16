/*
 *
 */
package com.mvc.dao;

import com.mvc.util.DBConnection;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignUpDao {

    public static int saveDetails(String fname, String mname, String lname, String email, 
            String dob, String gender, String phone, String password)
            throws MySQLIntegrityConstraintViolationException, SQLException {
        PreparedStatement pst = null;
        int exec = 0;
        Connection con = DBConnection.getConnection();
        pst = con.prepareStatement("insert into infoconnect.signup_info(fname,mname,lname,"
                + "email,dob,gender,phone,password) values(?,?,?,?,?,?,?,?)");
        pst.setString(1, fname);
        pst.setString(2, mname);
        pst.setString(3, lname);
        pst.setString(4, email);
        pst.setString(5, dob);
        pst.setString(6, gender);
        pst.setString(7, phone);
        pst.setString(8, password);
        exec = pst.executeUpdate();
        DBConnection.closeConnection(con);
        return exec;
    }
}
