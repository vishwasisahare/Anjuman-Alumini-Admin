
<%
    if (session.getAttribute("Id") == "null" || session.getAttribute("Id") == null) {
        response.sendRedirect("index.jsp?message=Please Login First");
    }
%>
<%@page import="com.qaswatech.alumni.model.UserModel"%>
<%@page import="com.qaswatech.alumni.controller.UserController"%>

<!-- ========== Topbar Start ========== -->
<div class="navbar-custom topnav-navbar">
    <div class="container-fluid detached-nav">

        <!-- Topbar Logo -->
        <button class="navbar-toggle" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
            <div class="lines">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="logo-topbar">
            <!-- Logo light -->
            <a href="index.jsp" class="logo-light mt-3">

                <h1 style="color: white; font-family: initial">Anjuman Alumni Admin</h1>
                <!--                <h1 style="color: white; font-family: initial">St. John's Alumni Admin</h1>-->


            </a>
            <a href="index.jsp" class="logo-dark">
                <span class="logo-lg">
                    <img src="assets/images/logo-dark.png" alt="dark logo" height="22">
                </span>
                <span class="logo-sm">
                    <img src="assets/images/logo-dark-sm.png" alt="small logo" height="22">
                </span>
            </a>
        </div>


        <ul class="list-unstyled topbar-menu float-end mb-0">
            <li class="notification-list d-none d-sm-inline-block">
                <a class="nav-link" href="javascript:void(0)" id="light-dark-mode">
                    <i class="ri-moon-line noti-icon"></i>
                </a>
            </li>

            <li class="notification-list d-none d-md-inline-block">
                <a class="nav-link" href="#" data-toggle="fullscreen">
                    <i class="ri-fullscreen-line noti-icon"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- ========== Topbar End ========== -->

<!-- ========== Horizontal Menu Start ========== -->
<div class="topnav topnav-light shadow-sm">
    <div class="container-fluid">
        <nav class="navbar navbar-light navbar-expand-lg topnav-menu">
            <div class="collapse navbar-collapse" id="topnav-menu-content">
                <ul class="navbar-nav">
                    <%
                        UserController userController = new UserController();
                        UserModel userModel = userController.findByUserId(session.getAttribute("Id").toString());
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="feeds.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Feeds <div class=""></div>
                        </a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link " href="post-page.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Post <div class=""></div>
                        </a>
                    </li>
                    <% if (!(userModel.getUserType().equals("staff"))) {%>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="staff-data.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Staffs <div class=""></div>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="alumni-data.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Alumni <div class=""></div>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="students-data.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Student <div class=""></div>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-dashboards" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="uil-window me-1"></i>Request <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-dashboards">
                            <a href="request-user.jsp" class="dropdown-item">User Request</a>
                            <a href="request-page.jsp" class="dropdown-item">Alumni Request</a>
                        </div>
                    </li>
                   <li class="nav-item dropdown">
                       <a class="nav-link " href="contact-visitors.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Feedback <div class=""></div>
                        </a>
                    </li>
                    <%}%>
                    <% if (!(userModel.getUserType().equals("admin"))) { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="profile-page.jsp" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Profile <div class=""></div>
                        </a>
                    </li>
                    <%}%>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="https://meet.google.com/" target="_blank" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Google Meet<div class=""></div>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="https://zoom.us/signin#/login"  target="_blank" id="topnav-layouts" role="button">
                            <i class="uil-window me-1"></i>Zoom Meeting <div class=""></div>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link collapsed" href="AlumniController?action=logout">
                            <i class="mdi mdi-logout-variant"></i>
                            <span>Logout</span>
                        </a>
                    </li>

                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- ========== Horizontal Menu End ========== -->