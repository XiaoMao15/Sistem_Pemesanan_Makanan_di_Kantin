<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    String namaAdmin = (String) session.getAttribute("nama");

    if (role == null || !role.equalsIgnoreCase("admin")) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Kelola User</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { background-color: #f0f2f5; }
        .header-admin {
            background: #343a40; 
            color: white;
            padding: 15px 0;
            margin-bottom: 30px;
        }
        .btn-logout {
            background: #dc3545;
            color: white;
            text-decoration: none;
            padding: 8px 20px;
            border-radius: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div class="header-admin shadow-sm">
        <div class="container d-flex justify-content-between align-items-center">
            <h4 class="m-0">
                <i class="bi bi-shield-lock-fill text-warning"></i> Panel Admin
            </h4>
            <div class="d-flex align-items-center gap-3">
                <span>Halo, <b><%= namaAdmin %></b></span>
                <a href="logout.jsp" class="btn-logout">Logout</a>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="card border-0 shadow-sm rounded-3">
            <div class="card-header bg-white py-3">
                <h5 class="m-0 fw-bold text-secondary">Manajemen Akun Penjual</h5>
            </div>
            <div class="card-body p-4">
                
                <div class="bg-light p-3 rounded mb-4 border">
                    <h6 class="mb-3">Tambah Akun Penjual Baru</h6>
                    <form action="proses_tambah_user.jsp" method="post" class="row g-2">
                        <div class="col-md-3">
                            <input type="text" name="username" class="form-control" placeholder="Username" required>
                        </div>
                        <div class="col-md-3">
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="col-md-3">
                            <input type="text" name="nama" class="form-control" placeholder="Nama Kantin/Penjual" required>
                        </div>
                        <div class="col-md-3">
                            <input type="hidden" name="role" value="penjual">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="bi bi-plus-circle"></i> Buat Akun
                            </button>
                        </div>
                    </form>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Nama Lengkap</th>
                                <th>Role</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Connection conn = KoneksiDB.getConnection();
                                    Statement st = conn.createStatement();
                                    // Tampilkan Penjual dan Pelanggan saja (Admin tidak perlu ditampilkan agar tidak terhapus sendiri)
                                    ResultSet rs = st.executeQuery("SELECT * FROM users WHERE role != 'admin' ORDER BY id DESC");
                                    
                                    while(rs.next()){
                                        String rUser = rs.getString("role");
                                        String badgeColor = rUser.equalsIgnoreCase("penjual") ? "bg-warning text-dark" : "bg-info";
                            %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><b><%= rs.getString("username") %></b></td>
                                <td><%= rs.getString("nama_lengkap") %></td>
                                <td><span class="badge <%= badgeColor %>"><%= rUser.toUpperCase() %></span></td>
                                <td>
                                    <a href="hapus_user.jsp?id=<%= rs.getInt("id") %>" 
                                       class="btn btn-sm btn-outline-danger"
                                       onclick="return confirm('Yakin ingin menghapus user <%= rs.getString("username") %>?')">
                                       <i class="bi bi-trash"></i> Hapus
                                    </a>
                                </td>
                            </tr>
                            <% 
                                    }
                                } catch (Exception e) { out.print("Error: " + e.getMessage()); }
                            %>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>