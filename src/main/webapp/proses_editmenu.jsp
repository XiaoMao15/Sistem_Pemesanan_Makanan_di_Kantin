<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("penjual")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idStr = request.getParameter("id");
    String nama = request.getParameter("nama");
    String hargaStr = request.getParameter("harga");
    String stokStr = request.getParameter("stok");
    String kategori = request.getParameter("kategori");
    String gambar = request.getParameter("gambar");
    String deskripsi = request.getParameter("deskripsi");

   int id = 0;
    int harga = 0;
    int stok = 0;

    try {
        id = Integer.parseInt(idStr);
        harga = Integer.parseInt(hargaStr);
        stok = Integer.parseInt(stokStr);
    } catch (NumberFormatException e) {
        out.println("<script>alert('Format angka salah!'); history.back();</script>");
        return;
    }

    try {
        Connection conn = KoneksiDB.getConnection();
        
        String sql = "UPDATE tbl_menu SET nama_menu=?, harga=?, stok=?, kategori=?, gambar_url=?, deskripsi=? WHERE id=?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, nama);
        ps.setInt(2, harga);      
        ps.setInt(3, stok);       
        ps.setString(4, kategori);
        ps.setString(5, gambar);
        ps.setString(6, deskripsi);
        ps.setInt(7, id);         

        int hasil = ps.executeUpdate();

        if (hasil > 0) {
            response.sendRedirect("kelola_menu.jsp");
        } else {
            out.println("<script>alert('Gagal mengupdate data.'); history.back();</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error Database: " + e.getMessage());
    }
%>