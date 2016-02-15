<%@ page import="java.sql.*" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.html");
    }
%>
<!DOCTYPE html>
<html>

<head>
</head>
<body>
<%
    String userid = request.getParameter("secret");
    System.out.println(userid);

    String buttonId = request.getParameter("secret2");
    System.out.println(buttonId);

    if (buttonId.equals("delete")) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://109.201.130.1:3306/kastleap_FormulaOne",
                    "kastleap_kar", "password1");
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM user WHERE id='" + userid + "' LIMIT 1");
            response.sendRedirect("view_user.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("view_user.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("view_user.jsp");
        }
    }
    else if(buttonId.equals("update")){
        //perform update query
        response.sendRedirect("view_user.jsp");
    }
%>
</body>
</html>

