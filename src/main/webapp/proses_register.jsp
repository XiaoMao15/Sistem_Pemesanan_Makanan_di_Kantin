<%@page import="config.Koneksi, java.sql.*"%>
<%
    String nama = request.getParameter("nama");
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        Connection con = Koneksi.getConnection();
        String sql = "INSERT INTO users (nama_lengkap, username, password, role) VALUES (?, ?, ?, 'customer')";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nama);
        ps.setString(2, user);
        ps.setString(3, pass);
        ps.executeUpdate();
        response.sendRedirect("login.jsp?status=sukses");
    } catch (Exception e) {
        out.print("Gagal Daftar: " + e.getMessage());
    }
%>