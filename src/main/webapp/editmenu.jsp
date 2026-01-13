<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("penjual")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idStr = request.getParameter("id"); 
    if (idStr == null || idStr.isEmpty()) {
        response.sendRedirect("kelola_menu.jsp");
        return;
    }

    int id = 0;
    try {
        id = Integer.parseInt(idStr); 
    } catch (NumberFormatException e) {
        response.sendRedirect("kelola_menu.jsp");
        return;
    }

    Connection conn = KoneksiDB.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_menu WHERE id = ?");
    
    ps.setInt(1, id); 
    
    ResultSet rs = ps.executeQuery();

    if (!rs.next()) {
        response.sendRedirect("kelola_menu.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Menu</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="navseller.jsp" %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow border-0">
                    <div class="card-header bg-white">
                        <h4 class="m-0 fw-bold text-primary">Edit Menu</h4>
                    </div>
                    <div class="card-body">
                        <form action="proses_editmenu.jsp" method="post">
                            
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

                            <div class="mb-3">
                                <label>Nama Makanan/Minuman</label>
                                <input type="text" name="nama" class="form-control" value="<%= rs.getString("nama_menu") %>" required>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label>Harga (Rp)</label>
                                    <input type="number" name="harga" class="form-control" value="<%= rs.getInt("harga") %>" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label>Stok</label>
                                    <input type="number" name="stok" class="form-control" value="<%= rs.getInt("stok") %>" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label>Kategori</label>
                                <select name="kategori" class="form-select">
                                    <% 
                                    String kat = rs.getString("kategori"); 
                                    %>
                                    <option value="Makanan" <%= kat.equals("Makanan") ? "selected" : "" %>>Makanan</option>
                                    <option value="Minuman" <%= kat.equals("Minuman") ? "selected" : "" %>>Minuman</option>
                                    <option value="Snack" <%= kat.equals("Snack") ? "selected" : "" %>>Snack</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label>Link Gambar (URL)</label>
                                <input type="text" name="gambar" class="form-control" value="<%= rs.getString("gambar_url") %>" required>
                                <img src="<%= rs.getString("gambar_url") %>" class="mt-2 rounded" width="100" height="100" style="object-fit: cover;">
                            </div>

                            <div class="mb-4">
                                <label>Deskripsi Singkat</label>
                                <textarea name="deskripsi" class="form-control" rows="3"><%= rs.getString("deskripsi") %></textarea>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="kelolamenu.jsp" class="btn btn-secondary">Batal</a>
                                <button type="submit" class="btn btn-primary px-4">Update Menu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>