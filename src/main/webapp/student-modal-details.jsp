<%-- 
    Document   : show-details
    Created on : 23-Dec-2022, 5:09:21 PM
    Author     : Amit
--%>

<%@page import="com.qaswatech.alumni.model.JobModel"%>
<%@page import="com.qaswatech.alumni.controller.JobController"%>
<%@page import="com.qaswatech.alumni.utilities.Utils"%>
<%@page import="com.qaswatech.alumni.model.SocialModel"%>
<%@page import="com.qaswatech.alumni.controller.SocialController"%>
<%@page import="com.qaswatech.alumni.model.UserModel"%>
<%@page import="com.qaswatech.alumni.controller.UserController"%>
<%
    UserController userController = new UserController();
    UserModel user = userController.findByUserId(request.getParameter("user_id"));
%>


<table class="table table-hover table-centered mb-0 ">
    <thead>

        <tr>
            <td>Name</td>
            <td><%= user.getName()%></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%= user.getEmail()%></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><%= user.getPhone()%></td>
        </tr>
         <tr>
            <td>Branch</td>
            <td><%= user.getBranch()%></td>
        </tr>
        <% if (!(Utils.empty(user.getDegree()))) {%>
        <tr>
            <td>Degree</td>
            <td><%= user.getDegree()%></td>
        </tr>
        <%}
            SocialController socialController = new SocialController();
            SocialModel social = socialController.findById(user.getUserId());
            if (!(social == null)) {
        %>
         <tr>
             <td>Social</td>
            <td> <a href="<%= social.getFacebook()%>" class="mdi mdi-facebook font-36 p-2"></a>
             <a href="<%= social.getLinkedin()%>" class="mdi mdi-linkedin font-36 p-2"></a>
              <a href="<%= social.getInstagram()%>" class="mdi mdi-instagram font-36 p-2"></a>
               <a href="<%= social.getTwitter()%>" class="mdi mdi-twitter font-36 p-2"></a>
            </td>
        </tr>
        <%}%>
    </thead>
</table>