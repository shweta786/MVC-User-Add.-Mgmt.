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

public class AdminDao {

    public static List<UserBean> showDetail() {
        Connection con = DBConnection.getConnection();
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        PreparedStatement ps = null;
        List<UserBean> ubl = null;
        List<Address> al;
        int interest[] = new int[9];
        for (int j = 0; j < 9; j++) {
            interest[j] = 0;
        }
        try {
            ps = con.prepareStatement("Select * from infoconnect.signup_info");
            rs = ps.executeQuery();
            if (!rs.next()) {
            } else {
                ubl = new ArrayList<UserBean>();
                do {
                    if (! ((rs.getString("email")).equals("admin@admin.com"))) {
                        UserBean ub = new UserBean();
                        String mname = rs.getString("mname");
                        if (mname == null) {
                            mname = "";
                        }
                        ub.setName(((((rs.getString("fname")).concat("  ")).
                                concat(mname)).concat("  ")).concat(rs.getString("lname")));
                        ub.setMailPhone(rs.getString("email"));
                        ub.setUser_id(rs.getInt("user_id"));
                        ub.setDob(rs.getString("dob"));
                        ub.setGender(rs.getString("gender"));
                        ub.setPhone(rs.getString("phone"));
                        ub.setStatus(rs.getInt("status"));

                        ps = con.prepareStatement("Select * from infoconnect.user_detail where "
                                + "user_id = ?");
                        ps.setInt(1, ub.getUser_id());
                        rs1 = ps.executeQuery();
                        if (!rs1.next()) {
                            ub.setAl(null);
                        } else {
                            al = new ArrayList<Address>();
                            do {
                                Address ad = new Address();
                                ad.setAdd_type(rs1.getString("add_type"));
                                ad.setCity(rs1.getString("city"));
                                ad.setCountry(rs1.getString("country"));
                                ad.setLocality(rs1.getString("address"));
                                ad.setState(rs1.getString("state"));
                                ad.setAdd_id(rs1.getInt("add_id"));
                                al.add(ad);
                            } while (rs1.next());
                            ub.setAl((ArrayList<Address>) al);
                        }

                        ps = con.prepareStatement("Select * from infoconnect.interest where "
                                + "user_id = ?");
                        ps.setInt(1, ub.getUser_id());
                        rs2 = ps.executeQuery();
                        if (rs2.next()) {
                            if (rs2.getInt("sports") == 1) {
                                interest[0] = 1;
                            }
                            if (rs2.getInt("reading") == 1) {
                                interest[1] = 1;
                            }
                            if (rs2.getInt("software") == 1) {
                                interest[2] = 1;
                            }
                            if (rs2.getInt("music") == 1) {
                                interest[3] = 1;
                            }
                            if (rs2.getInt("dance") == 1) {
                                interest[4] = 1;
                            }
                            if (rs2.getInt("photo") == 1) {
                                interest[5] = 1;
                            }
                            if (rs2.getInt("fashion") == 1) {
                                interest[6] = 1;
                            }
                            if (rs2.getInt("art") == 1) {
                                interest[7] = 1;
                            }
                            if (rs2.getInt("traveling") == 1) {
                                interest[8] = 1;
                            }
                        }
                        ub.setInterest(interest);
                        ubl.add(ub);
                    }
                } while (rs.next());
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
        return ubl;
    }
    
    public static String changeStatus(int mail, int i) {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String ret ="";
        try {
            ps = con.prepareStatement("SELECT * FROM infoconnect.signup_info WHERE user_id=?");
            ps.setInt(1, mail);
            rs = ps.executeQuery();
            if(rs.next()){
            if ((rs.getInt("status") == 1 && i == 1) || (rs.getInt("status") == 0 && i == 0)) {
                ret = "Already ";
            } else {
                ps = con.prepareStatement("UPDATE infoconnect.signup_info SET status=? WHERE user_id=?");
                ps.setInt(1, i);
                ps.setInt(2, mail);
                ps.executeUpdate();
                ret = "Successfully ";
            }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
        return ret;
    }

}
