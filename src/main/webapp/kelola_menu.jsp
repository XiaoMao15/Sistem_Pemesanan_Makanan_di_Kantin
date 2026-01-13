<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // PROTEKSI: Cek apakah Penjual
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("penjual")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Kelola Menu - Penjual</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
    <%@ include file="navseller.jsp" %>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white">
                        <h5 class="m-0 fw-bold text-primary">Tambah Menu Baru</h5>
                    </div>
                    <div class="card-body">
                        <form action="proses_tambah_menu.jsp" method="post">
                            <div class="mb-2">
                                <label>Nama Makanan/Minuman</label>
                                <input type="text" name="nama" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label>Harga (Rp)</label>
                                <input type="number" name="harga" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label>Stok Awal</label>
                                <input type="number" name="stok" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label>Kategori</label>
                                <select name="kategori" class="form-select">
                                    <option value="Makanan">Makanan</option>
                                    <option value="Minuman">Minuman</option>
                                    <option value="Snack">Snack</option>
                                </select>
                            </div>
                            <div class="mb-2">
                                <label>Link Gambar (URL)</label>
                                <input type="text" name="gambar" class="form-control" placeholder="https://..." required>
                                <small class="text-muted" style="font-size: 10px;">*Copy link gambar dari Google</small>
                            </div>
                            <div class="mb-3">
                                <label>Deskripsi Singkat</label>
                                <textarea name="deskripsi" class="form-control" rows="2"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Simpan Menu</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white">
                        <h5 class="m-0 fw-bold">Daftar Menu Saat Ini</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>Gambar</th>
                                    <th>Nama</th>
                                    <th>Harga</th>
                                    <th>Stok</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection conn = KoneksiDB.getConnection();
                                    Statement st = conn.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT * FROM tbl_menu ORDER BY id DESC");
                                    while(rs.next()){
                                %>
                                <tr>
                                    <td><img src="<%= rs.getString("gambar_url") %>" width="50" height="50" style="object-fit: cover; border-radius: 5px;"></td>
                                    <td><%= rs.getString("nama_menu") %> <br> <small class="text-muted"><%= rs.getString("kategori") %></small></td>
                                    <td>Rp <%= String.format("%,d", rs.getInt("harga")) %></td>
                                    <td>
                                        <span class="badge <%= rs.getInt("stok") > 0 ? "bg-success" : "bg-danger" %>">
                                            <%= rs.getInt("stok") %>
                                        </span>
                                    </td>
                                    <td>      
                                        <a href="editmenu.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary" onclick="return confirm('Editkan ini?')">Edit</a>
                                        <a href="hapus_menu.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Hapus menu ini?')"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>