<%@ page import="java.sql.*, java.text.NumberFormat, java.util.Locale, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Riwayat Pesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <style>
        body { background-color: #f0f2f5; font-family: 'Segoe UI', sans-serif; }
        .history-container { max-width: 600px; margin: 0 auto; padding-bottom: 80px; }
        .card-history {
            background: white; border-radius: 16px; padding: 16px; margin-bottom: 16px;
            border: 1px solid #eef0f2; box-shadow: 0 2px 4px rgba(0,0,0,0.02);
            display: flex; gap: 16px; align-items: flex-start; transition: all 0.2s ease;
        }
        .card-history:hover { transform: translateY(-2px); box-shadow: 0 8px 16px rgba(0,0,0,0.08); }
        .img-thumb { width: 80px; height: 80px; border-radius: 12px; object-fit: cover; background-color: #f8f9fa; flex-shrink: 0; }
        .content-box { flex-grow: 1; min-width: 0; }
        .food-title { font-weight: 700; font-size: 16px; color: #212529; margin-bottom: 4px; }
        .food-detail { font-size: 14px; color: #6c757d; margin-bottom: 10px; }
        .status-badge { display: inline-flex; align-items: center; padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }
        .bg-sukses { background-color: #E8F5E9; color: #1b5e20; }
        .bg-proses { background-color: #FFF3E0; color: #e65100; }
        .bg-pending { background-color: #FFEBEE; color: #c62828; }
        .btn-mau-lagi { display: inline-block; background-color: white; color: #00880c; border: 1px solid #00880c; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 700; text-decoration: none; }
        .btn-mau-lagi:hover { background-color: #00880c; color: white; }
    </style>
</head>
<body>

<div class="container py-4 history-container">
    <h4 class="fw-bold mb-4 px-1">Riwayat Pesanan</h4>

<%
    // --- BAGIAN LOGIC MENCARI ID USER (AUTO DETECT) ---
    Connection conn = null;
    PreparedStatement psUser = null;
    ResultSet rsUser = null;
    Integer userId = null;

    try {
        conn = KoneksiDB.getConnection();

        // Cek 1: Apakah session "id" ada?
        if (session.getAttribute("id") != null) {
            userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        } 
        // Cek 2: Jika tidak, apakah session "user_id" ada?
        else if (session.getAttribute("user_id") != null) {
            userId = Integer.parseInt(String.valueOf(session.getAttribute("user_id")));
        }
        // Cek 3: Fallback terakhir, cari ID berdasarkan username/user
        else if (session.getAttribute("username") != null || session.getAttribute("user") != null) {
            String userNameSess = (session.getAttribute("username") != null) ? 
                                   session.getAttribute("username").toString() : 
                                   session.getAttribute("user").toString();
            
            // Query DB untuk cari ID milik username ini
            String sqlCariId = "SELECT id FROM users WHERE username = ?";
            psUser = conn.prepareStatement(sqlCariId);
            psUser.setString(1, userNameSess);
            rsUser = psUser.executeQuery();
            if (rsUser.next()) {
                userId = rsUser.getInt("id");
            }
        }
    } catch (Exception e) {
        out.println("");
    } finally {
        if (rsUser != null) rsUser.close();
        if (psUser != null) psUser.close();
        // conn jangan diclose dulu, dipakai di bawah
    }

    // --- JIKA USER ID MASIH TIDAK KETEMU ---
    if(userId == null) {
%>
        <div class="alert alert-info small">
            <strong>Debug Info:</strong><br>
            Session ID: <%= session.getAttribute("id") %><br>
            Session Username: <%= session.getAttribute("username") %>
        </div>

        <div class='alert alert-warning shadow-sm border-0 d-flex align-items-center'>
            <i class="bi bi-lock-fill fs-4 me-3 text-warning"></i>
            <div>
                <strong>Akses Dibatasi</strong><br>
                Sistem tidak bisa membaca ID Anda. Silakan <a href="logout.jsp" class="fw-bold text-dark text-decoration-underline">Login Ulang</a>.
            </div>
        </div>
<%
    } else {
        // --- JIKA LOGIN VALID, TAMPILKAN DATA ---
        PreparedStatement ps = null;
        ResultSet rs = null;
        NumberFormat kursIDR = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
        
        try {
            // Query: Ambil semua pesanan dari tbl_order & detailnya
            // Menggunakan LEFT JOIN tbl_menu agar jika menu dihapus, history tetap ada
            String sql = "SELECT od.nama_produk, od.qty, od.harga, o.status, m.gambar_url, m.id AS menu_id " +
                         "FROM tbl_order o " +
                         "JOIN tbl_order_detail od ON o.id = od.order_id " +
                         "LEFT JOIN tbl_menu m ON od.nama_produk = m.nama_menu " +
                         "WHERE o.user_id = ? " +
                         "ORDER BY o.id DESC"; 
                         
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            boolean adaData = false;
            while(rs.next()) {
                adaData = true;
                String nama = rs.getString("nama_produk");
                int qty = rs.getInt("qty");
                int harga = rs.getInt("harga");
                int total = harga * qty;
                String status = rs.getString("status");
                String gambar = rs.getString("gambar_url");
                int menuId = rs.getInt("menu_id");
                
                if(gambar == null || gambar.isEmpty()) gambar = "https://placehold.co/150?text=Menu";
                
                String badgeClass = "bg-pending";
                String iconClass = "bi-clock";
                if("Selesai".equalsIgnoreCase(status)) { badgeClass = "bg-sukses"; iconClass = "bi-check-circle-fill"; }
                else if("Diproses".equalsIgnoreCase(status)) { badgeClass = "bg-proses"; iconClass = "bi-fire"; }
%>
            <div class="card-history">
                <img src="<%= gambar %>" class="img-thumb" alt="<%= nama %>">
                <div class="content-box">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="food-title"><%= nama %></div>
                            <div class="food-detail"><%= qty %> porsi &bull; <%= kursIDR.format(total).replace(",00", "") %></div>
                        </div>
                        <% if("Selesai".equalsIgnoreCase(status)) { %>
                            <div class="text-end">
                                <a href="tambahKeranjang.jsp?id=<%= menuId %>&nama=<%= java.net.URLEncoder.encode(nama, "UTF-8") %>&harga=<%= harga %>" class="btn-mau-lagi">Mau lagi</a>
                            </div>
                        <% } %>
                    </div>
                    <div class="status-badge <%= badgeClass %>">
                        <i class="bi <%= iconClass %> me-1"></i> <%= status %>
                    </div>
                </div>
            </div>
<%
            } // End While

            if(!adaData) {
%>
                <div class="text-center py-5">
                    <i class="bi bi-receipt-cutoff text-secondary display-1"></i>
                    <p class="mt-3 text-muted">Belum ada riwayat pesanan.</p>
                </div>
<%
            }
        } catch(Exception e) {
            out.println("<div class='alert alert-danger'>Error SQL: " + e.getMessage() + "</div>");
        } finally {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
    }
%>
</div>
</body>
</html>