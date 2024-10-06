/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qaswatech.alumni.dao;

import com.qaswatech.alumni.common.Database;
import com.qaswatech.alumni.model.UserModel;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Amit
 */
public class UserDao {

    public static final String TABLENAME = "users";

    public UserModel findByPhone(String phone) {
        UserModel user = null;
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        String sql = "select * from " + TABLENAME + " where phone = ?";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, phone);
            rs = cs.executeQuery();
            while (rs.next()) {
                user = new UserModel(
                        rs.getInt("id"),
                        rs.getString("user_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("password"),
                        rs.getString("degree"),
                        rs.getString("branch"),
                        rs.getString("user_type"),
                        rs.getString("profile_pic"),
                        rs.getInt("user_request"),
                        rs.getString("is_visible"),
                        rs.getString("is_deleted"),
                        rs.getString("created_at"),
                        rs.getString("modified_at"),
                        rs.getString("passout_year")
                );
            }
        } catch (SQLException e) {
            user = null;
            System.out.println("com.qaswatech.alumni.dao.AlumniDao.findByPhone()" + e.getMessage());
        } finally {
            try {
                if (con != null) {

                    con.close();
                }
                con = null;
                if (cs != null) {
                    cs.close();
                }
                cs = null;
                if (rs != null) {
                    rs.close();
                }
                rs = null;
            } catch (SQLException ex) {
            }
        }
        return user;
    }

    public UserModel findByUserId(String id) {
        UserModel user = null;
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        String sql = "select * from " + TABLENAME + " where user_id = ?";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                user = new UserModel(
                        rs.getInt("id"),
                        rs.getString("user_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("password"),
                        rs.getString("degree"),
                        rs.getString("branch"),
                        rs.getString("user_type"),
                        rs.getString("profile_pic"),
                        rs.getInt("user_request"),
                        rs.getString("is_visible"),
                        rs.getString("is_deleted"),
                        rs.getString("created_at"),
                        rs.getString("modified_at"),
                        rs.getString("passout_year")
                );
            }
        } catch (SQLException e) {
            user = null;
            System.out.println("com.qaswatech.alumni.dao.UserDao.findByUserId()");
        } finally {
            try {
                if (con != null) {

                    con.close();
                }
                con = null;
                if (cs != null) {
                    cs.close();
                }
                cs = null;
                if (rs != null) {
                    rs.close();
                }
                rs = null;
            } catch (SQLException ex) {
            }
        }
        return user;
    }

    public ArrayList<UserModel> findAllByAlumni() {
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        ArrayList<UserModel> user = new ArrayList<>();

        String sql = " select * from " + TABLENAME + " where user_type = 'alumni' and is_visible = 1 ORDER BY id DESC ";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                user.add(
                        new UserModel(
                                rs.getInt("id"),
                                rs.getString("user_id"),
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getString("phone"),
                                rs.getString("password"),
                                rs.getString("degree"),
                                rs.getString("branch"),
                                rs.getString("user_type"),
                                rs.getString("profile_pic"),
                                rs.getInt("user_request"),
                                rs.getString("is_visible"),
                                rs.getString("is_deleted"),
                                rs.getString("created_at"),
                                rs.getString("modified_at"),
                                rs.getString("passout_year")
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println("com.qaswatech.alumni.dao.UserDao.findAll()");
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;

                if (rs != null) {
                    rs.close();
                }
                rs = null;

            } catch (SQLException e) {
            }
        }
        return user;
    }
    
    public ArrayList<UserModel> findAllByAlumniBySearch(String branch, String year) {
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        ArrayList<UserModel> user = new ArrayList<>();

        String sql = " select * from " + TABLENAME + " where branch = ? and passout_year = ? and user_type = 'alumni' and is_visible = 1 ORDER BY id DESC ";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, branch);
            cs.setString(2, year);
            rs = cs.executeQuery();
            while (rs.next()) {
                user.add(
                        new UserModel(
                                rs.getInt("id"),
                                rs.getString("user_id"),
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getString("phone"),
                                rs.getString("password"),
                                rs.getString("degree"),
                                rs.getString("branch"),
                                rs.getString("user_type"),
                                rs.getString("profile_pic"),
                                rs.getInt("user_request"),
                                rs.getString("is_visible"),
                                rs.getString("is_deleted"),
                                rs.getString("created_at"),
                                rs.getString("modified_at"),
                                rs.getString("passout_year")
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println("com.qaswatech.alumni.dao.UserDao.findAll()" + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;

                if (rs != null) {
                    rs.close();
                }
                rs = null;

            } catch (SQLException e) {
            }
        }
        return user;
    }

    public ArrayList<UserModel> findAllByUserType(String userType) {
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        ArrayList<UserModel> user = new ArrayList<>();

        String sql = " select * from " + TABLENAME + " where user_type = ? and is_visible = 1 ORDER BY id DESC ";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, userType);
            rs = cs.executeQuery();
            while (rs.next()) {
                user.add(
                        new UserModel(
                                rs.getInt("id"),
                                rs.getString("user_id"),
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getString("phone"),
                                rs.getString("password"),
                                rs.getString("degree"),
                                rs.getString("branch"),
                                rs.getString("user_type"),
                                rs.getString("profile_pic"),
                                rs.getInt("user_request"),
                                rs.getString("is_visible"),
                                rs.getString("is_deleted"),
                                rs.getString("created_at"),
                                rs.getString("modified_at"),
                                rs.getString("passout_year")
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println("com.qaswatech.alumni.dao.UserDao.findAll()" + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;

                if (rs != null) {
                    rs.close();
                }
                rs = null;

            } catch (SQLException e) {
            }
        }
        return user;
    }

    public String delete(String id) {

        Connection con = null;
        CallableStatement cs = null;
        String message = null;
        String sql = "update " + TABLENAME + " set is_visible = 0 where user_id = ?";

        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            int rows = cs.executeUpdate();

            if (rows >= 1) {
                message = "Student delete successful";

            }
        } catch (Exception e) {
            message = "unable to delete bcoz of  :" + e.getMessage();

        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;

            } catch (Exception e) {
            }
            return message;
        }
    }

    public ArrayList<UserModel> findAllByRequest(int param) {
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        ArrayList<UserModel> user = new ArrayList<>();

        String sql = " select * from " + TABLENAME + " where user_request = ? and is_visible = 1 ORDER BY id DESC ";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setInt(1, param);
            rs = cs.executeQuery();
            while (rs.next()) {
                user.add(
                        new UserModel(
                                rs.getInt("id"),
                                rs.getString("user_id"),
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getString("phone"),
                                rs.getString("password"),
                                rs.getString("degree"),
                                rs.getString("branch"),
                                rs.getString("user_type"),
                                rs.getString("profile_pic"),
                                rs.getInt("user_request"),
                                rs.getString("is_visible"),
                                rs.getString("is_deleted"),
                                rs.getString("created_at"),
                                rs.getString("modified_at"),
                                rs.getString("passout_year")
                        )
                );
            }
        } catch (SQLException e) {
            System.out.println("com.qaswatech.alumni.dao.UserDao.findAll()");
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;

                if (rs != null) {
                    rs.close();
                }
                rs = null;

            } catch (SQLException e) {
            }
        }
        return user;
    }

    public String requestApprove(String id, String userType) {

        Connection con = null;
        CallableStatement cs = null;
        String message = null;
        String sql = "update " + TABLENAME + " set user_request = '0' , user_type = ? where user_id = ?";

        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, userType);
            cs.setString(2, id);
            int rows = cs.executeUpdate();

            if (rows >= 1) {
                message = "Account Approved Successful";

            }
        } catch (Exception e) {
            message = "Unable to approve because of  :" + e.getMessage();

        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;

            } catch (Exception e) {
            }
            return message;
        }
    }

    public String insert(UserModel model) {
        Connection con = Database.connectDb();
        String message = null;
        CallableStatement cs = null;

        String sql = "insert into " + TABLENAME + "(user_id, name ,email ,phone ,password, user_type )"
                + " values (?,?,?,?,?,?)";
        try {
            cs = con.prepareCall(sql);
            cs.setString(1, model.getUserId());
            cs.setString(2, model.getName());
            cs.setString(3, model.getEmail());
            cs.setString(4, model.getPhone());
            cs.setString(5, model.getPassword());
            cs.setString(6, model.getUserType());

            int row = cs.executeUpdate();

            if (row >= 1) {
                message = "Admin added Successfull";
            }

        } catch (SQLException ex) {
            message = "unable to insert bcoz of : " + ex.getMessage();
        } finally {

            if (con != null) {

                try {
                    con.close();
                } catch (SQLException ex) {

                }

            }

        }

        return message;
    }

    public String update(UserModel model) {
        String message = null;
        Connection con = null;
        CallableStatement cs = null;
        String sql = "update " + TABLENAME + " set name = ?, email = ?, phone = ?, degree = ?, branch = ?, profile_pic = ? where user_id = ?";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, model.getName());
            cs.setString(2, model.getEmail());
            cs.setString(3, model.getPhone());
            cs.setString(4, model.getDegree());
            cs.setString(5, model.getBranch());
            cs.setString(6, model.getProfile());
            cs.setString(7, model.getUserId());
            int rows = cs.executeUpdate();
            if (rows >= 1) {
                message = "User Updated Successfully";
            }
        } catch (SQLException e) {
            message = "Unable to update because of : " + e.getMessage() + " | At : " + this.getClass().getName();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                con = null;

                if (cs != null) {
                    cs.close();
                }
                cs = null;
            } catch (SQLException e) {
            }
        }
        return message;
    }

}
