<%-- 
    Document   : index
    Created on : 16-Nov-2022, 10:53:47 PM
    Author     : Amit
--%>

<%@page import="com.qaswatech.alumni.utilities.Utils"%>
<%@page import="com.qaswatech.alumni.model.UserModel"%>
<%@page import="com.qaswatech.alumni.controller.UserController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light" data-layout="topnav" data-topbar-color="dark" data-layout-mode="fluid" data-layout-position="fixed">
    <head>
        <meta charset="utf-8" />
        <title> Alumni Admin | Staffs </title>
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
        </script>
        <script>
            function viewMoreSocial(user_id) {
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

        <div class="wrapper ">
            <div class="content-page">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mt-4">
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="">
                                                <%                                                    
                                                    UserController user = new UserController();
                                                    ArrayList<UserModel> model = user.findAllByUserType("staff");
                                                %>

                                                <table id="selection-datatable" class="table dt-responsive nowrap">
                                                    <h3 style="text-align: center"> Staff Table</h3>
                                                    ${param.message}
                                                    <thead>

                                                        <tr>
                                                            <th>Sr No.</th>
                                                            <th>Name</th>
                                                            <th>Email</th>
                                                            <th>Branch</th>
                                                            <th>phone</th>  
                                                            <th>Action</th>  
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        int i = 1;
                                                        for (UserModel add : model) {
                                                    %>

                                                    <tbody>
                                                        <tr>
                                                            <td><%= i++%></td>
                                                            <td><%= add.getName()%></td>
                                                            <td><%=add.getEmail()%></td>
                                                            <% if (Utils.empty(add.getBranch())) {%>
                                                            <td>--</td>
                                                            <%} else {%>
                                                            <td><%=add.getBranch()%></td>
                                                            <%}%>
                                                            <td><%= add.getPhone()%></td>

                                                            <td class="btn-group">
                                                                <a href="#" title="More" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#disablebackdrop" onclick="viewMore('<%= add.getUserId()%>')" ><i class="mdi mdi-eye"></i> </a>
                                                                <a href="AlumniController?action=delete&id=<%= add.getUserId()%>&page=staff" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item')" ><i class="mdi mdi-delete"></i></a> 
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                    <%}%>
                                                </table>
                                                <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header bg-primary text-white">
                                                                <h5 class="modal-title">More Detail</h5>
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
                                            </div> <!-- end preview code-->
                                        </div> 

                                    </div> 
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            </div>




            <%@include file="script.jsp" %>

    </body>

</html> 