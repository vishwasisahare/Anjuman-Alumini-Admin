<%-- 
    Document   : index
    Created on : 16-Nov-2022, 10:53:47 PM
    Author     : Amit
--%>


<%@page import="com.qaswatech.alumni.controller.JobController"%>
<%@page import="com.qaswatech.alumni.model.JobModel"%>
<%@page import="com.qaswatech.alumni.model.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qaswatech.alumni.controller.UserController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light" data-layout="topnav" data-topbar-color="dark" data-layout-mode="fluid" data-layout-position="fixed">

    <head>
        <meta charset="utf-8" />
        <title>Alumni Admin | Alumni </title>
        <%@include file="links.jsp" %>

        <script>
            function viewMore(user_id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dynamicData").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "alumni-modal-details.jsp?user_id=" + user_id, true);
                xhttp.send();
                // alert("yha");
            }
            function    SocialviewMore(user_id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("dynamicData").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "social-modal-details.jsp?user_id=" + user_id, true);
                xhttp.send();
                // alert("yha");
            }
        </script>
    </head>

    <body>
        <!-- Begin page -->

        <%@include file="navbar.jsp" %>
        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <div class="wrapper">
            <div class="content-page">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-4">
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <form action="alumni-search.jsp" method="post">
                                                <div class="row">
                                                    <div class="col-5 col-lg-5">
                                                        <select class="form-control" name="branch">
                                                            <option selected disabled value="">Select Your Branch</option>
                                                            <option value="CIVIL">CIVIL ENGINEERING</option>
                                                            <option value="COMPUTER">COMPUTER SCIENCE & ENGINEERING</option>
                                                            <option value="ELECTRICAL">ELECTRICAL ENGINEERING</option>
                                                            <option value="ELECTRONICS">ELECTRONICS & TELECOMMUNICATION ENGINEERING</option>
                                                            <option value="MECHANICAL">MECHANICAL ENGINEERING</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-5 col-lg-5">
                                                        <select class="form-control" id="ddlYears" name="year" required="">
                                                            <option selected="" disabled="" value="">Select Passout Year</option>
                                                        </select>                                                    </div>
                                                    <div class="col-2 col-lg-2">
                                                        <button class="btn btn-toolbar btn-dark" type="submit"><i class="uil-search"></i></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-4">
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="">
                                                <%
                                                    System.out.println(request.getParameter("branch"));
                                                    System.out.println(request.getParameter("year"));
                                                    JobController job = new JobController();
                                                    UserController user = new UserController();
                                                    ArrayList<UserModel> uModel = user.findAllByAlumniBySearch(request.getParameter("branch"), request.getParameter("year"));
                                                %>
                                                <table id="selection-datatable" class="table dt-responsive nowrap w-100">
                                                    <h3 style="text-align: center"> Alumni Table</h3>
                                                    ${param.message}

                                                    <thead>
                                                        <tr>
                                                            <th>Sr No.</th>
                                                            <th>Name</th>
                                                            <th>Email</th>
                                                            <th>Branch</th>
                                                            <th>Passout Year</th>

                                                            <th>Action</th>  
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            if (uModel.isEmpty()) {
                                                        %>
                                                        <tr>
                                                            <td colspan="5">No Data found</td>
                                                        </tr>
                                                        <% } else {
                                                            int i = 1;
                                                            for (UserModel model1 : uModel) {


                                                        %>
                                                        <tr>
                                                            <td><%= i++%></td>
                                                            <td><%= model1.getName()%></td>
                                                            <td><%= model1.getEmail()%></td>
                                                            <td><%= model1.getBranch()%></td>
                                                            <td><%= model1.getPassoutYear()%></td>
                                                            <td>
                                                                <a href="#" title="More" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#disablebackdrop" onclick="viewMore('<%= model1.getUserId()%>')" ><i class="mdi mdi-eye"></i> </a>
                                                                <a href="AlumniController?action=delete&id=<%= model1.getUserId()%>&page=alumni" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item')" ><i class="mdi mdi-delete"></i></a> 
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                    <%}
                                                        }%>
                                                </table>
                                                <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header   bg-primary text-white">
                                                                <h5 class="modal-title">Alumni Detail</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <!-- dynamic data load -->
                                                                <div id="dynamicData">
                                                                </div>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="buttons-table-code">
                                            </div> 
                                        </div> 
                                    </div> 
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            </div>
            <%@include file="script.jsp" %>
            <script type="text/javascript">
                window.onload = function () {
                    //Reference the DropDownList.
                    var ddlYears = document.getElementById("ddlYears");

                    //Determine the Current Year.
                    var currentYear = (new Date()).getFullYear();

                    //Loop and add the Year values to DropDownList.
                    for (var i = 1950; i <= currentYear; i++) {
                        var option = document.createElement("OPTION");
                        option.innerHTML = i;
                        option.value = i;
                        ddlYears.appendChild(option);
                    }
                };
            </script>

    </body>

</html> 