<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("penjual")) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    int countPending = 0;
    int countMenu = 0;
    long totalPendapatan = 0;

    try {
        Connection conn = KoneksiDB.getConnection();
        Statement st = conn.createStatement();
        
        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM tbl_order WHERE status='Pending' OR status='Diproses'");
        if(rs1.next()) countPending = rs1.getInt(1);
        
        ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM tbl_menu");
        if(rs2.next()) countMenu = rs2.getInt(1);

        ResultSet rs3 = st.executeQuery("SELECT SUM(total_bayar) FROM tbl_order WHERE status='Selesai'");
        if(rs3.next()) totalPendapatan = rs3.getLong(1);
        
    } catch(Exception e) {
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Penjual - FoodieCall</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <style>
        :root {
            --latte-dark: #4B3832;
            --latte-bg: #F5EFEB; 
            --latte-accent: #BE9B7B;
        }
        body { background-color: var(--latte-bg); font-family: 'Segoe UI', sans-serif; }
        
        .stat-card {
            border: none;
            border-radius: 15px;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: 0.3s;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .stat-card:hover { transform: translateY(-5px); }
        .stat-icon {
            width: 50px; height: 50px;
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.5rem;
        }
        .bg-icon-1 { background: #ffe4e4; color: #d63384; }
        .bg-icon-2 { background: #e4f2ff; color: #0d6efd; }
        .bg-icon-3 { background: #e6fffa; color: #198754; }

        .section-title {
            color: var(--latte-dark);
            font-weight: 700;
            border-left: 5px solid var(--latte-accent);
            padding-left: 15px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <jsp:include page="navseller.jsp" />

    <div class="container py-4">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h4 class="fw-bold" style="color: var(--latte-dark);">Dashboard Penjual</h4>
                <p class="text-muted mb-0">Selamat datang kembali, <strong><%= session.getAttribute("nama") %></strong>!</p>
            </div>
        </div>

        <div class="row g-3 mb-5">
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-icon bg-icon-1"><i class="bi bi-bell-fill"></i></div>
                    <div>
                        <h6 class="text-muted mb-1">Pesanan Perlu Diproses</h6>
                        <h3 class="fw-bold mb-0"><%= countPending %></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-icon bg-icon-2"><i class="bi bi-grid-fill"></i></div>
                    <div>
                        <h6 class="text-muted mb-1">Total Menu Aktif</h6>
                        <h3 class="fw-bold mb-0"><%= countMenu %></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="stat-icon bg-icon-3"><i class="bi bi-cash-stack"></i></div>
                    <div>
                        <h6 class="text-muted mb-1">Total Pendapatan</h6>
                        <h4 class="fw-bold mb-0 text-success">Rp <%= String.format("%,d", totalPendapatan).replace(',', '.') %></h4>
                    </div>
                </div>
            </div>
        </div>

        <h5 class="section-title">Daftar Pesanan Masuk</h5>
        
        <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th class="ps-4">ID Order</th>
                                <th>Pelanggan</th>
                                <th>Detail Menu</th>
                                <th>Pembayaran</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th class="text-end pe-4">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
<%
    try {
        Connection conn = KoneksiDB.getConnection();
 
        String sql = "SELECT od.*, o.user_id, o.metode_pembayaran, o.status " +
                     "FROM tbl_order_detail od " +
                     "JOIN tbl_order o ON od.order_id = o.id " +
                     "ORDER BY od.order_id DESC";
                     
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        boolean adaData = false;

        while(rs.next()) {
            adaData = true;
            int idOrder = rs.getInt("order_id");
            String namaProduk = rs.getString("nama_produk");
            int qty = rs.getInt("qty");
            int harga = rs.getInt("harga");
            int subTotal = harga * qty;
            
            String pemesan = rs.getString("user_id");
            String metode = rs.getString("metode_pembayaran");
            String status = rs.getString("status");

            String badgeClass = "bg-secondary";
            if(status.equalsIgnoreCase("Pending")) badgeClass = "bg-warning text-dark";
            else if(status.equalsIgnoreCase("Diproses")) badgeClass = "bg-primary";
            else if(status.equalsIgnoreCase("Selesai")) badgeClass = "bg-success";
%>
            <tr>
                <td class="ps-4"><strong>#<%= idOrder %></strong></td>
                <td><%= pemesan %></td>
                <td>
                    <span class="fw-bold"><%= namaProduk %></span><br>
                    <small class="text-muted">Rp <%= String.format("%,d", harga).replace(',', '.') %> x <%= qty %></small>
                </td>
                <td>
                    <span class="badge bg-light text-dark border"><%= metode %></span>
                </td>
                <td class="fw-bold">Rp <%= String.format("%,d", subTotal).replace(',', '.') %></td>
                <td><span class="badge rounded-pill <%= badgeClass %>"><%= status %></span></td>
                <td class="text-end pe-4">
                    <% if(status.equalsIgnoreCase("Pending")) { %>
                        <form action="ubahStatus.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="id_pesanan" value="<%= idOrder %>">
                            <button type="submit" name="status_baru" value="Diproses" class="btn btn-sm btn-primary">Masak</button>
                        </form>
                    <% } else if(status.equalsIgnoreCase("Diproses")) { %>
                        <form action="ubahStatus.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="id_pesanan" value="<%= idOrder %>">
                            <button type="submit" name="status_baru" value="Selesai" class="btn btn-sm btn-success text-white">Selesai</button>
                        </form>
                    <% } else { %>
                        <i class="bi bi-check2-all text-success"></i>
                    <% } %>
                </td>
            </tr>
<% 
        } 
        if(!adaData) {
            out.println("<tr><td colspan='7' class='text-center py-4'>Belum ada pesanan masuk.</td></tr>");
        }
        rs.close(); st.close();
    } catch(Exception e) {
        out.println("<tr><td colspan='7' class='text-danger p-3'>Error Detail: " + e.getMessage() + "</td></tr>");
    }
%>
</tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>