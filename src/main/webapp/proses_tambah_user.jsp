<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String nama = request.getParameter("nama");
    String role = request.getParameter("role"); 

    if(user == null || user.trim().equals("") || pass == null || pass.trim().equals("")) {
        out.println("<script>alert('Username dan Password tidak boleh kosong!'); window.history.back();</script>");
        return;
    }

    try {
        Connection conn = KoneksiDB.getConnection();
        
        PreparedStatement psCek = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
        psCek.setString(1, user);
        ResultSet rs = psCek.executeQuery();
        
        if(rs.next()) {
            out.println("<script>alert('Username " + user + " sudah terpakai! Ganti yang lain.'); window.history.back();</script>");
        } else {
            String sql = "INSERT INTO users (username, password, nama_lengkap, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, nama);
            ps.setString(4, role);
            
            ps.executeUpdate();
            
            out.println("<script>alert('Berhasil menambah Penjual baru!'); window.location='admin_dashboard.jsp';</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Gagal: " + e.getMessage() + "'); window.history.back();</script>");
    }
%>