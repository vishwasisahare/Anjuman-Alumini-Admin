<%-- 
    Document   : show-details
    Created on : 23-Dec-2022, 5:09:21 PM
    Author     : Amit
--%>

<%@page import="com.qaswatech.alumni.utilities.Utils"%>
<%@page import="com.qaswatech.alumni.model.SocialModel"%>
<%@page import="com.qaswatech.alumni.controller.SocialController"%>
<%
    SocialController socialController = new SocialController();
    SocialModel social = socialController.findById(request.getParameter("user_id"));
    if (Utils.empty(social.getSocialid())) {
%>
<h4>No Details Added</h4>
<% } else {%>


<table class="table table-hover table-centered mb-0 ">
    <thead>

        <tr>
            <td class="mdi mdi-facebook">Facebook</td>
            <td><%= social.getFacebook()%></td>
        </tr>
        <tr>
            <td  class="mdi mdi-linkedin">Linkedin</td>
            <td><%= social.getLinkedin()%></td>
        </tr>
        <tr>
            <td class="mdi mdi-instagram">Instagram</td>
            <td><%= social.getInstagram()%></td>
        </tr>
        <tr>
            <td class="mdi mdi-twitter">Twitter</td>
            <td><%= social.getTwitter()%></td>
        </tr>

    </thead>
</table>
<%}%>

