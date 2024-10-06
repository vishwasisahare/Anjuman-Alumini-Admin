/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qaswatech.alumni.dao;

import com.qaswatech.alumni.common.Database;
import com.qaswatech.alumni.model.FeedbackModel;
import com.qaswatech.alumni.response.ResponseMessage;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author Zoya
 */
public class FeedbackDao {

    public static final String TABLENAME = "feedback";

    public ArrayList<FeedbackModel> findAll() {
        ArrayList<FeedbackModel> feedback = new ArrayList<>();
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        String sql = " select * from " + TABLENAME + " where is_visible = 1 ORDER BY id DESC ";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            while (rs.next()) {
                feedback.add(new FeedbackModel(
                        rs.getInt("id"),
                        rs.getString("feedback_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("message"),
                        rs.getString("is_visible"),
                        rs.getString("is_deleted"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                )
                );
            }
        } catch (SQLException e) {
            System.out.println("Unable to find data because of " + e.getMessage());
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
        return feedback;
    }

    public FeedbackModel findById(String id) {
        FeedbackModel feed = null;
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        String sql = "select * from " + TABLENAME + " where feedback_id = ?";
        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                feed = new FeedbackModel(
                        rs.getInt("id"),
                        rs.getString("feedback_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("message"),
                        rs.getString("is_visible"),
                        rs.getString("is_deleted"),
                        rs.getString("created_at"),
                        rs.getString("modified_at")
                );
            }
        } catch (SQLException e) {
            System.out.println("Unable to find data because of " + e.getMessage());
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
        return feed;
    }

    public String delete(String id) {

        Connection con = null;
        CallableStatement cs = null;
        String message = null;
        String sql = "update " + TABLENAME + " set is_visible = 0 where feedback_id = ?";

        try {
            con = Database.connectDb();
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            int rows = cs.executeUpdate();

            if (rows >= 1) {
                message = "feedback delete successful";

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
}
