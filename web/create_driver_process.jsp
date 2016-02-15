<%@ page import="java.sql.*" %>
<%@ page import="KSecurity.BCrypt" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="com.sun.java.swing.plaf.windows.TMSchema" %>
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
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String contact = request.getParameter("contact");
    String description = request.getParameter("description");
    //File img = new File("C:\\Users\\Karthik\\Desktop\\a.jpg");

    //ERROR STUFF
    /*File img = request.getParameter("file");
    TMSchema.Part filePart = request.getPart("file");
    String fileName = filePart.getSubmittedFileName();
    InputStream fileContent = filePart.getInputStream();*/

    PreparedStatement stmt;
    FileInputStream fis;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://109.201.130.1:3306/kastleap_FormulaOne",
                "kastleap_kar", "password1");

        stmt = conn.prepareStatement(
                "INSERT INTO driver (name, age, gender, contact, description, image) values (?, ?, ?, ?, ?, ?)");
        stmt.setString(1, name);
        stmt.setString(2, age);
        stmt.setString(3, gender);
        stmt.setString(4, contact);
        stmt.setString(5, description);

        fis = new FileInputStream(img);
        stmt.setBinaryStream(6, fis, (int)(img.length()));
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
