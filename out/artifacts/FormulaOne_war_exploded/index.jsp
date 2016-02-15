<%@ page import="java.sql.*" %>
<%@ page import="KSecurity.BCrypt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE HTML>
<html>
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
    <%
        String userid = request.getParameter("usernameField");
        String pwd = request.getParameter("passwordField");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://109.201.130.1:3306/kastleap_FormulaOne",
                    "kastleap_kar", "password1");
            Statement st = con.createStatement();

            //verify password against hashed password
            ResultSet rs;
            rs = st.executeQuery("select * from user where username='" + userid + "'");
            if (rs.next()) {
                ResultSet getHashedPw = st.executeQuery("select password from user where username='" + userid + "' LIMIT 1");
                if(getHashedPw.next()){
                    String hashed = getHashedPw.getString(1);
                    if (BCrypt.checkpw(pwd, hashed)){
                        session.setAttribute("userid", userid);
                        response.sendRedirect("home.jsp");
                    }
                    else {
                        response.sendRedirect("index.html");
                    }
                }
            }
            else {
                response.sendRedirect("index.html");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
