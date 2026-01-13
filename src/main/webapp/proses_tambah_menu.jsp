<%@ page import="java.sql.*, util.KoneksiDB" %>
<%
    String nama = request.getParameter("nama");
    int harga = Integer.parseInt(request.getParameter("harga"));
    int stok = Integer.parseInt(request.getParameter("stok"));
    String kategori = request.getParameter("kategori");
    String gambar = request.getParameter("gambar");
    String deskripsi = request.getParameter("deskripsi");

    try {
        Connection conn = KoneksiDB.getConnection();
        String sql = "INSERT INTO tbl_menu (nama_menu, harga, stok, kategori, gambar_url, deskripsi) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, nama);
        ps.setInt(2, harga);
        ps.setInt(3, stok);
        ps.setString(4, kategori);
        ps.setString(5, gambar);
        ps.setString(6, deskripsi);
        
        ps.executeUpdate();
        response.sendRedirect("kelola_menu.jsp");
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>