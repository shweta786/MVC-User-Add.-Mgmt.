/*
 * 
 */
package com.mvc.dao;

import com.mvc.bean.Address;
import com.mvc.bean.UserBean;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ShowInfoDao {

    public static UserBean basicInfo(String mailPhone) {
                   
        Connection con = DBConnection.getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        List<Address> al;
        int interest[] = new int[9];
        for (int j = 0; j < 9; j++) {
            interest[j] = 0;
        }
        UserBean ub = new UserBean();
        try {
            ps = con.prepareStatement("Select * from infoconnect.signup_info where (email=? or phone=?)");
            ps.setString(1, mailPhone);
            ps.setString(2, mailPhone);
            rs = ps.executeQuery();
            rs.next();
            String mname = rs.getString("mname");
            if(mname==null) {
                mname="";
            }
            String name = ((((rs.getString("fname")).concat(" ")).concat(mname)).concat(" "))
                    .concat(rs.getString("lname"));
            ub.setName(name);
            ub.setDob(rs.getString("dob"));
            ub.setPhone(rs.getString("phone"));
            ub.setGender(rs.getString("gender"));
            ub.setMailPhone(rs.getString("email"));
            ub.setUser_id(rs.getInt("user_id"));
            ps = con.prepareStatement("Select * from infoconnect.user_detail where "
                    + "user_id = ?");
            ps.setInt(1, ub.getUser_id());
            rs = ps.executeQuery();
            if (!rs.next()) {
                ub.setAl(null);
            } else {
                al = new ArrayList<Address>();
                do {
                    Address ad = new Address();
                    ad.setAdd_type(rs.getString("add_type"));
                    ad.setCity(rs.getString("city"));
                    ad.setCountry(rs.getString("country"));
                    ad.setLocality(rs.getString("address"));
                    ad.setState(rs.getString("state"));
                    ad.setAdd_id(rs.getInt("add_id"));
                    al.add(ad);
                } while (rs.next());
                ub.setAl((ArrayList<Address>) al);
            }
            ps = con.prepareStatement("Select * from infoconnect.interest where "
                    + "user_id = ?");
            ps.setInt(1, ub.getUser_id());
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt("sports") == 1) {
                    interest[0] = 1;
                }
                if (rs.getInt("reading") == 1) {
                    interest[1] = 1;
                }
                if (rs.getInt("software") == 1) {
                    interest[2] = 1;
                }
                if (rs.getInt("music") == 1) {
                    interest[3] = 1;
                }
                if (rs.getInt("dance") == 1) {
                    interest[4] = 1;
                }
                if (rs.getInt("photo") == 1) {
                    interest[5] = 1;
                }
                if (rs.getInt("fashion") == 1) {
                    interest[6] = 1;
                }
                if (rs.getInt("art") == 1) {
                    interest[7] = 1;
                }
                if (rs.getInt("traveling") == 1) {
                    interest[8] = 1;
                }
            }
            ub.setInterest(interest);
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
        return ub;
    }

}
