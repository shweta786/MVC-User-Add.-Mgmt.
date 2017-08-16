package com.mvc.dao;

import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaveDao {

    public static void savePhone(int user_id, String phone) {
        Connection con = DBConnection.getConnection();
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE infoconnect.signup_info SET phone=? WHERE user_id=?");
            pst.setString(1, phone);
            pst.setInt(2, user_id);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
    }

    public static void savePadd(int user_id, String p_add, String p_city, String p_state, String p_country) {
        Connection con = DBConnection.getConnection();
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE infoconnect.user_detail SET address=?, city=?, "
                    + "state=?, country=? WHERE user_id=? AND add_type=?");
            pst.setString(1, p_add);
            pst.setString(2, p_city);
            pst.setString(3, p_state);
            pst.setString(4, p_country);
            pst.setInt(5, user_id);
            pst.setString(6, "Permanent");
            int rs = pst.executeUpdate();
            if (rs == 0) {
                pst = con.prepareStatement("INSERT INTO infoconnect.user_detail "
                        + "(user_id, address, country, state, city, add_type) VALUES (?, ?, ?, ?, ?, ?)");
                pst.setInt(1, user_id);
                pst.setString(2, p_add);
                pst.setString(3, p_country);
                pst.setString(4, p_state);
                pst.setString(5, p_city);
                pst.setString(6, "Permanent");
                pst.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
    }

    public static void saveCadd(int user_id, String c_add, String c_city, String c_state, String c_country) {
        Connection con = DBConnection.getConnection();
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE infoconnect.user_detail SET address=?, city=?, "
                    + "state=?, country=? WHERE user_id=? AND add_type=?");
            pst.setString(1, c_add);
            pst.setString(2, c_city);
            pst.setString(3, c_state);
            pst.setString(4, c_country);
            pst.setInt(5, user_id);
            pst.setString(6, "Current");
            int rs = pst.executeUpdate();
            if (rs == 0) {
                pst = con.prepareStatement("INSERT INTO infoconnect.user_detail "
                        + "(user_id, address, country, state, city, add_type) VALUES (?, ?, ?, ?, ?, ?)");
                pst.setInt(1, user_id);
                pst.setString(2, c_add);
                pst.setString(3, c_country);
                pst.setString(4, c_state);
                pst.setString(5, c_city);
                pst.setString(6, "Current");
                pst.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
    }

    public static void saveOtherAdd(int add_id, String o_add, String o_city, String o_state, String o_country) {
        Connection con = DBConnection.getConnection();
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE infoconnect.user_detail SET address=?, city=?, "
                    + "state=?, country=? WHERE add_id=?");
            pst.setString(1, o_add);
            pst.setString(2, o_city);
            pst.setString(3, o_state);
            pst.setString(4, o_country);
            pst.setInt(5, add_id);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
    }

    public static void addOtherAdd(int user_id, String n_add, String n_city, String n_state, String n_country) {
        Connection con = DBConnection.getConnection();
        if (n_add != null && n_city != null && n_state != null && n_country != null) {
            try {
                PreparedStatement pst = con.prepareStatement("INSERT INTO infoconnect.user_detail "
                        + "(user_id, address, country, state, city, add_type) VALUES (?, ?, ?, ?, ?, ?)");
                pst.setInt(1, user_id);
                pst.setString(2, n_add);
                pst.setString(3, n_country);
                pst.setString(4, n_state);
                pst.setString(5, n_city);
                pst.setString(6, "Other");
                pst.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
            DBConnection.closeConnection(con);
        }

        }
    }

    public static void saveInterest(int user_id, String sports, String reading, String software,
            String music, String dance, String photo, String fashion, String art, String traveling) {
        Connection con = DBConnection.getConnection();
        try {
            PreparedStatement pst = con.prepareStatement("UPDATE infoconnect.interest SET sports=?, reading=?, "
                    + "software=?, music=?, dance=?, photo=?, fashion=?, art=?, traveling=? WHERE user_id=?");
            if (sports != null) {
                pst.setInt(1, 1);
            } else {
                pst.setInt(1, 0);
            }
            if (reading != null) {
                pst.setInt(2, 1);
            } else {
                pst.setInt(2, 0);
            }
            if (software != null) {
                pst.setInt(3, 1);
            } else {
                pst.setInt(3, 0);
            }
            if (music != null) {
                pst.setInt(4, 1);
            } else {
                pst.setInt(4, 0);
            }
            if (dance != null) {
                pst.setInt(5, 1);
            } else {
                pst.setInt(5, 0);
            }
            if (photo != null) {
                pst.setInt(6, 1);
            } else {
                pst.setInt(6, 0);
            }
            if (fashion != null) {
                pst.setInt(7, 1);
            } else {
                pst.setInt(7, 0);
            }
            if (art != null) {
                pst.setInt(8, 1);
            } else {
                pst.setInt(8, 0);
            }
            if (traveling != null) {
                pst.setInt(9, 1);
            } else {
                pst.setInt(9, 0);
            }
            pst.setInt(10, user_id);
            int rs = pst.executeUpdate();
            if (rs <= 0) {
                pst = con.prepareStatement("INSERT INTO infoconnect.interest (sports, reading, "
                        + "software, music, dance, photo, fashion, art, traveling, user_id) VALUES (?,?,?,?,?,?,?,?,?,?)");
                if (sports != null) {
                    pst.setInt(1, 1);
                } else {
                    pst.setInt(1, 0);
                }
                if (reading != null) {
                    pst.setInt(2, 1);
                } else {
                    pst.setInt(2, 0);
                }
                if (software != null) {
                    pst.setInt(3, 1);
                } else {
                    pst.setInt(3, 0);
                }
                if (music != null) {
                    pst.setInt(4, 1);
                } else {
                    pst.setInt(4, 0);
                }
                if (dance != null) {
                    pst.setInt(5, 1);
                } else {
                    pst.setInt(5, 0);
                }
                if (photo != null) {
                    pst.setInt(6, 1);
                } else {
                    pst.setInt(6, 0);
                }
                if (fashion != null) {
                    pst.setInt(7, 1);
                } else {
                    pst.setInt(7, 0);
                }
                if (art != null) {
                    pst.setInt(8, 1);
                } else {
                    pst.setInt(8, 0);
                }
                if (traveling != null) {
                    pst.setInt(9, 1);
                } else {
                    pst.setInt(9, 0);
                }
                pst.setInt(10, user_id);
                pst.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaveDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBConnection.closeConnection(con);
        }
    }
}
