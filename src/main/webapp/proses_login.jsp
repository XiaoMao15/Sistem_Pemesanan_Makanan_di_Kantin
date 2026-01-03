<%@page import="config.koneksi, java.sql.*"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        Connection con = koneksi.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, user);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("username", rs.getString("username"));
            session.setAttribute("nama", rs.getString("nama_lengkap"));
            response.sendRedirect("index.jsp?page=home");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    } catch (Exception e) {
        out.print("Error Koneksi: " + e.getMessage());
    }
%>