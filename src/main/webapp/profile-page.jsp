<%-- 
    Document   : index
    Created on : 16-Nov-2022, 10:53:47 PM
    Author     : Amit
--%>

<%@page import="com.qaswatech.alumni.model.SocialModel"%>
<%@page import="com.qaswatech.alumni.controller.SocialController"%>
<%@page import="com.qaswatech.alumni.utilities.Utils"%>
<%@page import="com.qaswatech.alumni.model.UserModel"%>
<%@page import="com.qaswatech.alumni.controller.UserController"%>
<%@page import="com.qaswatech.alumni.model.JobModel"%>
<%@page import="com.qaswatech.alumni.controller.JobController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light" data-layout="topnav" data-topbar-color="dark" data-layout-mode="fluid" data-layout-position="fixed">


    <head>
        <meta charset="utf-8" />
        <title>Alumni | Your Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="links.jsp" %>

    </head>

    <body>
        <!-- Begin page -->
        <div class="wrapper">
            <%@include file="navbar.jsp" %>
            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->


            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid mt-4">
                        <!-- end page title -->
                        <%
                            UserController controller = new UserController();
                            UserModel user = controller.findByUserId(session.getAttribute("Id").toString());
                        %>

                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Profile -->
                                <div class="card bg-primary">
                                    <div class="card-body profile-user-box">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="row align-items-center">
                                                    <div class="col-auto">
                                                        <%-- <% if (user.getProfile()== "null" || user.getProfile() == "" || user.getProfile() == null) {%> --%>
                                                        <% if (Utils.empty(user.getProfile())) {%>
                                                        <div class="avatar-lg">
                                                            <img src="assets/images/users/user.png" alt="" class="rounded-circle img-thumbnail">
                                                        </div>
                                                        <%} else {%>
                                                        <div class="avatar-lg">
                                                            <img src="<%= user.getProfile()%>" alt="" class="rounded-circle img-thumbnail">
                                                        </div>
                                                        <% }%>
                                                    </div>
                                                    <div class="col">
                                                        <div>
                                                            <h4 class="mt-1 mb-1 text-white"><%= user.getName()%></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> <!-- end col-->

                                            <div class="col-sm-4">
                                                <div class="text-center mt-sm-0 mt-3 text-sm-end">
                                                    <button type="button" class="btn btn-light mt-3" >
                                                        <%
                                                            if (user.getUserType().equals("student")) {
                                                        %>

                                                        <a href="UserController?action=userReq&userId=<%= user.getUserId()%>"  >
                                                            <i class="mdi mdi-account-convert me-1"></i> Switch To Alumni
                                                        </a>
                                                        <% } else { %>
                                                        <h5 class="text-primary">Staff Member</h5>
                                                        <% }%>
                                                    </button>
                                                    <br><br>
                                                    <span class="p-2 text-white">${param.message}</span>
                                                </div>
                                            </div> <!-- end col-->
                                        </div> <!-- end row -->

                                    </div> <!-- end card-body/ profile-user-box-->
                                </div><!--end profile/ card -->
                            </div> <!-- end col-->
                        </div>
                        <!-- end row -->


                        <div class="row">
                            <div class="col-xl-8 col-lg-7">
                                <div class="card">
                                    <div class="card-body">
                                        <ul class="nav nav-pills bg-nav-pills nav-justified mb-3">

                                            <li class="nav-item">
                                                <a href="#personal" data-bs-toggle="tab" aria-expanded="false" class="nav-link rounded-0 active">
                                                    Personal Details
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#social
                                                   " data-bs-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
                                                    Social
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#career" data-bs-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
                                                    Career Details
                                                </a>
                                            </li>
                                        </ul>

                                        <div class="tab-content">
                                            <!-- end about me section content -->

                                            <!-- end timeline content-->
                                            <div class="tab-pane active" id="personal">
                                                <% if (user.getDegree() == "null" || user.getDegree() == " " || user.getDegree() == null) {%>
                                                <form action="UserImageController" method="post" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="userId" value="<%= user.getUserId()%>">
                                                    <h5 class="mb-4 text-uppercase bg-light p-2"><i class="mdi mdi-account-circle me-1"></i> Personal Info</h5>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="profile" class="form-label">Profile Picture</label>
                                                                <input type="file" class="form-control" name="profile" accept="images/*" id="firstname" placeholder="Enter first name" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="firstname" class="form-label">Name</label>
                                                                <input type="text" class="form-control" name="name" value="<%= user.getName()%>" id="firstname" placeholder="Enter first name" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="email" class="form-label">Email</label>
                                                                <input type="email" class="form-control" name="email" value="<%= user.getEmail()%>" id="lastname" placeholder="Enter last name" required>
                                                            </div>
                                                        </div> <!-- end col -->
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="lastname" class="form-label">Mobile No</label>
                                                                <input type="text" class="form-control" name="phone" value="<%= user.getPhone()%>" id="lastname" placeholder="Enter last name" required>
                                                            </div>
                                                        </div> <!-- end col -->
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="branch" class="form-label">Branch</label>
                                                                <input type="text" class="form-control" name="branch" id="lastname" placeholder="Enter Branch" required>
                                                            </div>
                                                        </div> <!-- end col -->
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="degree" class="form-label">Degree</label>
                                                                <input type="text" class="form-control" name="degree"  placeholder="Enter Degree" required>
                                                            </div>
                                                        </div> <!-- end col -->
                                                    </div> <!-- end row -->

                                                    <div class="text-end">
                                                        <button type="submit" class="btn btn-success mt-2"><i class="mdi mdi-content-save"></i> Update </button>
                                                    </div>
                                                </form>
                                                <%} else { %>
                                                <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-office-building me-1"></i> Personal Details</h5>

                                                <div class="row">
                                                    <div class="col-lg-6 col-sm-12 offset-lg-3" >
                                                        <div class="card">
                                                            <div class="card-body text-center">
                                                                <% if (Utils.empty(user.getProfile())) {%>
                                                                <img src="assets/images/users/user.png" alt="" class="rounded-circle img-thumbnail">
                                                                <% } else {%>
                                                                <img src="<%= user.getProfile()%>" class="rounded-circle img-thumbnail" width="120px" height="120px">
                                                                <% }%>
                                                                <div class="table-responsive-sm">
                                                                    <table class="table text-center">
                                                                        <tr>
                                                                            <td>Name</td>
                                                                            <td><%= user.getName()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Phone</td>
                                                                            <td><%= user.getPhone()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Email</td>
                                                                            <td><%= user.getEmail()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Branch</td>
                                                                            <td><%= user.getBranch()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Degree</td>
                                                                            <td><%= user.getDegree()%></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%}%>
                                            </div>
                                            <!-- end settings content-->
                                            <div class="tab-pane" id="social">
                                                <%
                                                    SocialController socialController = new SocialController();
                                                    SocialModel socialModel = socialController.findById(user.getUserId());
                                                    if (socialModel == null) {
                                                %>
                                                <form action="SocialController" method="post">
                                                    <input type="hidden" name="action" value="insert">
                                                    <input type="hidden" name="userId" value="<%= user.getUserId()%>">
                                                    <div class="row">
                                                        <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-earth me-1"></i> Social</h5>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="social-fb" class="form-label">Facebook</label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i class="mdi mdi-facebook"></i></span>
                                                                    <input type="text" name="facebook" class="form-control" id="social-fb" placeholder="Url" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="social-tw" class="form-label">Twitter</label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i class="mdi mdi-twitter"></i></span>
                                                                    <input type="text"  name="twitter"  class="form-control" id="social-tw" placeholder="Username">
                                                                </div>
                                                            </div>
                                                        </div> <!-- end col -->
                                                    </div> <!-- end row -->

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="social-insta" class="form-label">Instagram</label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i class="mdi mdi-instagram"></i></span>
                                                                    <input type="text"  name="instagram"  class="form-control" id="social-insta" placeholder="Url" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="social-lin" class="form-label">Linkedin</label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i class="mdi mdi-linkedin"></i></span>
                                                                    <input type="text"  name="linkedin"  class="form-control" id="social-lin" placeholder="Url" required>
                                                                </div>
                                                            </div>
                                                        </div> <!-- end col -->
                                                    </div> <!-- end row -->
                                                    <!-- end row -->
                                                    <button type="submit" class="btn btn-success mt-2"><i class="mdi mdi-content-save"></i> Save</button>

                                                </form>
                                                <!-----------------------------form------------------->
                                                <%} else {%>
                                                <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-office-building me-1"></i>Social Links</h5>

                                                <div class="row">
                                                    <div class="col-lg-8 col-sm-12 offset-lg-2">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="table-responsive-sm">
                                                                    <table class="table">
                                                                        <tr>
                                                                            <td>Facebook :</td>
                                                                            <td><a href="<%= socialModel.getFacebook()%>" target="_blank"><%= socialModel.getFacebook()%></a></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Twitter :</td>
                                                                            <td><a href="<%= socialModel.getTwitter()%>" target="_blank"><%= socialModel.getTwitter()%></a></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Instagram :</td>
                                                                            <td><a href="<%= socialModel.getInstagram()%>" target="_blank"><%= socialModel.getInstagram()%></a></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>LinkedIn :</td>
                                                                            <td><a href="<%= socialModel.getLinkedin()%>" target="_blank"><%= socialModel.getLinkedin()%></a></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>    
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div> 
                                            <!-- end tab-pane -->
                                            <div class="tab-pane" id="career">

                                                <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-office-building me-1"></i> Job Details</h5>
                                                <%
                                                    JobController jobController = new JobController();
                                                    JobModel jobModel = jobController.selectById(user.getUserId());
                                                    if (jobModel == null) {
                                                %>
                                                <div class="row">
                                                    <!--                                                    <div class="col-md-6">-->
                                                    <form  class="needs-validation" novalidate action="JobController" method="post">
                                                        <input type="hidden" name="action" value="insert">
                                                        <input type="hidden" name="userId" value="<%= user.getUserId()%>">
                                                        <!--                                                        <input type="hidden" name="userId" value="insert">-->

                                                        <div class="col-12">
                                                            <label class="form-label" for="validationCustom01">Department</label>
                                                            <input type="text" class="form-control" id="validationCustom01" name="company" placeholder="enter department name" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                        </div>
                                                        <div class="row mt-2">
                                                            <div class="col-6">
                                                                <label for="companyname" class="form-label">Experience</label>
                                                                <input type="text" class="form-control" id="lpa" name="lpa" placeholder="enter experinece">
                                                            </div>  

                                                            <div class="col-6">
                                                                <label for="cwebsite" class="form-label">Designation</label>
                                                                <input type="text" class="form-control" id="designation" name="designation" placeholder="enter designation ">
                                                            </div>
                                                        </div>
                                                        <div class="text-end">
                                                            <button type="submit" class="btn btn-success mt-2 mb-2"><i class="mdi mdi-content-save"></i> Save</button>
                                                        </div>
                                                        <!-- end col -->
                                                    </form>

                                                </div> <!-- end row -->
                                                <% } else {%>
                                                <div class="row">
                                                    <div class="col-lg-8 col-sm-12 offset-lg-2">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="table-responsive-sm">
                                                                    <table class="table">
                                                                        <tr>
                                                                            <td>Department :</td>
                                                                            <td><%= jobModel.getCompany()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Designation :</td>
                                                                            <td><%= jobModel.getDesignation()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Experience :</td>
                                                                            <td><%= jobModel.getLpa()%></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div> <!-- end tab-content -->
                                    </div> <!-- end card body -->
                                </div> <!-- end card -->
                            </div> <!-- end col -->
                            <div class="col-xl-4">
                                <!-- Personal-Information -->
                                <div class="card">
                                    <div class="card-body">
                                        <img src="assets/images/alumni1.jpg" class="img-fluid">
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->
                    <!-- content -->
                    <%@include file="footer.jsp" %>
                </div>
                <!-- ============================================================== -->
                <!-- End Page content -->
                <!-- ============================================================== -->
            </div>
            <!-- END wrapper -->

            <%@include file="script.jsp" %>

    </body>

</html> 