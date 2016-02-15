<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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

    <script>
        $(document).ready(function() {
            $(".delBtn").click(function(){
                $('.secret2').val("delete");
            });
            $(".updtBtn").click(function(){
                $('.secret2').val("update");
            });
        });
    </script>
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

    <h1 class="k-h1-view-user">Users</h1>

    <%
        String dbURL = "jdbc:mysql://109.201.130.1:3306/kastleap_FormulaOne";
        String dbUser = "kastleap_kar";
        String dbPass = "password1";
        Connection conn;

        try{
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            Statement statement = conn.createStatement();
            ResultSet resultset =
                    statement.executeQuery("select id, username, password, role from user");

            while(resultset.next()) {
    %>

    <form class="k-view-user-form k-form-margin-top" method="post" action="delete_user.jsp">
        <div class="form-group col-sm-3 col-lg-3">
            <input value="<%= resultset.getString(2) %>" type="text" class="form-control" id="usernameField" name="usernameField" placeholder="Username" style="margin: 0 auto">
        </div>
        <div class="form-group col-sm-3 col-lg-3">
            <input value="<%= resultset.getString(3) %>" type="password" class="form-control" id="passwordField" name="passwordField" placeholder="Password" style="margin: 0 auto">
        </div>

        <div class="form-group col-sm-3 col-lg-3">
            <select class="form-control" id="role" name="role" style="margin: 0 auto">
                <%
                    if(resultset.getString(4).equals("admin")){
                %>
                    <option value="admin" selected>Admin</option>
                    <option value="standard">Standard</option>
                <%
                    }
                    else{
                %>
                    <option value="admin">Admin</option>
                    <option value="standard" selected>Standard</option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="form-group col-sm-3 col-lg-3">
            <button id="update" type="submit" class="btn k-login-btn updtBtn" style="float: left">Update</button>
            <button id="delete" type="submit" class="btn k-del-btn delBtn" style="float: right">Delete</button>
            <input name="secret" value="<%= resultset.getString(1) %>"  type="hidden">
            <input class="secret2" id="secret2" name="secret2" type="hidden">
        </div>
    </form>

    <%}

    }catch (Exception e){
        e.printStackTrace();
    }

    %>
</body>