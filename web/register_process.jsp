<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
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
            String userid = request.getParameter("usernameField");
            String pwd = request.getParameter("passwordField");
            String confirmPwd = request.getParameter("confirmPasswordField");
            String role = request.getParameter("role");

            if(pwd.equals(confirmPwd)){
                //hash password
                pwd = BCrypt.hashpw(pwd, BCrypt.gensalt());

                // Hash password lame ass algo. waste of time.. zz..
                /*try {
                    MessageDigest mDigest = MessageDigest.getInstance("SHA1");
                    byte[] result = mDigest.digest(pwd.getBytes());
                    StringBuffer sb = new StringBuffer();
                    for (int i = 0; i < result.length; i++) {
                        sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
                    }
                    pwd = sb.toString();
                }catch (Exception e){
                    e.printStackTrace();
                }*/

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://109.201.130.1:3306/kastleap_FormulaOne",
                            "kastleap_kar", "password1");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    rs = st.executeQuery("select * from user where username='" + userid + "'");
                    if (rs.next()) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        st.executeUpdate("insert into user (username, password, role) values (" + "'" + userid + "', " + "'" + pwd + "', " + "'" + role + "')");
                        response.sendRedirect("admin.jsp");
                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>
