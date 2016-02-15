<%@ page import="java.sql.*" %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Files -->
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
    <img src="img/ljmu_logo.png" class="img-responsive logo-marpad">
    <form class="formClass" method="post" action="register_process.jsp">
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
        <button type="submit" class="btn" style="min-width: 350px">Register</button>
    </form>
</body>
</html>