/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qaswatech.alumni.service;

import com.qaswatech.alumni.dao.FeedbackDao;
import com.qaswatech.alumni.model.FeedbackModel;
import com.qaswatech.alumni.utilities.Utils;
import java.util.ArrayList;

/**
 *
 * @author Zoya
 */
public class FeedbackService {

    FeedbackDao dao = new FeedbackDao();

    public ArrayList<FeedbackModel> findAll() {
        return dao.findAll();
    }

    public FeedbackModel findById(String id) {
        return dao.findById(id);
    }

    public String delete(String id) {
        return dao.delete(id);
    }

}
