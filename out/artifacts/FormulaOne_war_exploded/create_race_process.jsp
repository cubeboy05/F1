<%@ page import="java.sql.*" %>
<%@ page import="KSecurity.BCrypt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.html");
    }
%>
<html>
<head>
</head>
<body>
<%
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String location = request.getParameter("location");

    PreparedStatement stmt;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://109.201.130.1:3306/kastleap_FormulaOne",
                "kastleap_kar", "password1");

        stmt = conn.prepareStatement("INSERT INTO race (date, time, location) values (?, ?, ?)");
        stmt.setString(1, date);
        stmt.setString(2, time);
        stmt.setString(3, location);
        stmt.executeUpdate();
        response.sendRedirect("admin.jsp");
    }
    catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("admin.jsp");
    }
%>
</body>
</html>
