
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.html");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formula One</title>
    <!-- Jquery -->
    <script src="js/jquery-2.2.0.min.js"></script>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Files -->
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>

<!-- Nav Bar -->
<div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
    <div class="container-fluid k-custom-navbar-bg">
        <div class="navbar-header">
            <a class="navbar-brand" href="home.jsp">
                <img id="logo" src="img/ljmu_logo_nav.png">
            </a>
            <button type="button" class="navbar-toggle k-toggle-btn-bg" data-toggle="collapse" data-target=".navbar-menubuilder">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-menubuilder">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="home.jsp">Home</a>
                </li>
                <li><a href="#">Drivers</a>
                </li>
                <li><a href="#">Races</a>
                </li>
                <li><a href="#">LiveStats</a>
                </li>
                <li><a href="admin.jsp">Admin</a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- End of NavBar -->

<!--Register -->
<div class="k-col-centered">
    <div class="col-sm-4 col-lg-4 k-admin-box">
        <div class="k-border-right">
            <h1>Users</h1>
            <a class="btn k-login-btn k-admin-view-btn" href="view_user.jsp">View Users</a>
            <h3>Create New User</h3>

            <form class="k-admin-formClass" method="post" action="register_process.jsp">
                <div class="form-group">
                    <input type="text" class="form-control" id="usernameField" name="usernameField" placeholder="Username" style="margin: 0 auto">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="passwordField" name="passwordField" placeholder="Password" style="margin: 0 auto">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="confirmPasswordField" name="confirmPasswordField" placeholder="Confirm Password" style="margin: 0 auto">
                </div>

                <div class="form-group">
                    <select class="form-control" id="role" name="role" style="margin: 0 auto">
                        <option value="admin">Admin</option>
                        <option value="standard">Standard</option>
                    </select>
                </div>
                <button type="submit" class="btn k-login-btn k-admin-user-register-btn">Register</button>
            </form>
        </div>
    </div>

    <!-- Drivers -->
    <div class="col-sm-4 col-lg-4">
        <div class="k-border-right">
            <h1>Drivers</h1>
            <button type="submit" class="btn k-login-btn k-admin-view-btn">View Drivers</button>
            <h3>Create New Driver</h3>

            <form class="k-admin-formClass" method="post" action="uploadServlet" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" id="name" name="name" placeholder="name" style="margin: 0 auto">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="age" name="age" placeholder="age" style="margin: 0 auto">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="gender" name="gender" placeholder="gender" style="margin: 0 auto">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="contact" name="contact" placeholder="contact" style="margin: 0 auto">
                </div>
                <div class="form-group">
                    <textarea rows="5" cols="50" class="form-control" id="description" name="description" placeholder="description" style="margin: 0 auto"></textarea>
                </div>

                <div class="form-group">
                    <input type="file" class="form-control" id="file" name="file" placeholder="file" style="margin: 0 auto">
                </div>


                <button type="submit" class="btn k-login-btn">Register</button>
            </form>
        </div>
    </div>

    <!-- Races -->
    <div class="col-sm-4 col-lg-4">
        <h1>Races</h1>
        <button type="submit" class="btn k-login-btn k-admin-view-btn">View Races</button>
        <h3>Create New Race</h3>

        <form class="k-admin-formClass" method="post" action="create_race_process.jsp">
            <div class="form-group">
                <input type="date" class="form-control" id="date" name="date" placeholder="Date" style="margin: 0 auto">
            </div>
            <div class="form-group">
                <input type="time" class="form-control" id="time" name="time" placeholder="Time" style="margin: 0 auto">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="location" name="location" placeholder="Location" style="margin: 0 auto">
            </div>
            <button type="submit" class="btn k-login-btn k-admin-race-register-btn">Register</button>
        </form>
    </div>
</div>

</body>
</html>
