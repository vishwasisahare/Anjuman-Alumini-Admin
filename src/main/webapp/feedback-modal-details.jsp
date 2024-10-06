<%-- 
    Document   : show-details
    Created on : 23-Dec-2022, 5:09:21 PM
    Author     : Amit
--%>
<%@page import="com.qaswatech.alumni.model.FeedbackModel"%>
<%@page import="com.qaswatech.alumni.controller.FeedbackController"%>
<%@page import="com.qaswatech.alumni.model.JobModel"%>
<%@page import="com.qaswatech.alumni.controller.JobController"%>
<%@page import="com.qaswatech.alumni.model.UserModel"%>
<%@page import="com.qaswatech.alumni.controller.UserController"%>
<%
    FeedbackController feed = new FeedbackController();
    FeedbackModel jm = feed.findById(request.getParameter("feedback_id"));
%>


<table class="table table-hover table-centered mb-0 ">
    <thead>

        <tr>
            <td>Name</td>
            <td><%= jm.getName()%></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%= jm.getEmail()%></td>
        </tr>
        <tr>
            <td>Message</td>
            <td><%= jm.getMessage()%></td>
        </tr>
      
    </thead>
</table>

