<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .hero-banner {
        background: linear-gradient(rgba(75, 56, 50, 0.7), rgba(75, 56, 50, 0.7)), 
                    url('https://images.unsplash.com/photo-1554118811-1e0d58224f24?q=80&w=1000&auto=format&fit=crop');
        background-size: cover;
        background-position: center;
        color: white;
        padding: 60px 20px;
        border-radius: 20px;
        text-align: center;
        margin-bottom: 40px;
    }
    .best-seller-title {
        color: #4B3832;
        font-weight: 800;
        margin-bottom: 30px;
        border-left: 5px solid #BE9B7B;
        padding-left: 15px;
    }
    .card-best {
        border: none;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: 0.3s;
    }
    .card-best:hover { transform: translateY(-10px); }
    
    .img-menu-fixed {
        border-radius: 15px 15px 0 0; 
        height: 180px; 
        width: 100%;
        object-fit: cover;
    }
</style>

<div class="container mt-2">
    <div class="hero-banner shadow-sm">
        <h1 class="display-5 fw-bold" style="color:#b6a897">Selamat Datang di KantinKu</h1>
        <p class="lead">Cita rasa kopi latte dan masakan rumah dalam satu tempat.</p>
        <a href="index.jsp?page=daftar_menu" class="btn btn-light rounded-pill px-4 fw-bold" style="color: #4B3832;">Lihat Semua Menu</a>
    </div>

    <h3 class="best-seller-title">Menu Rekomendasi (Best Seller)</h3>
    
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
        
        <%
            try {
                Connection conn = KoneksiDB.getConnection();
                Statement st = conn.createStatement();
                
             String sql = "SELECT * FROM tbl_menu LIMIT 3";
                ResultSet rs = st.executeQuery(sql);
                
                boolean adaMenu = false;

                while (rs.next()) {
                    adaMenu = true;
                    int id = rs.getInt("id");
                    String nama = rs.getString("nama_menu");
                    int harga = rs.getInt("harga");
                    String deskripsi = rs.getString("deskripsi");
                    String gambar = rs.getString("gambar_url"); 
                    String kategori = rs.getString("kategori");
                    
                    String badgeColor = "bg-secondary";
                    if(kategori != null) {
                        if(kategori.equalsIgnoreCase("Makanan")) badgeColor = "bg-warning text-dark";
                        else if(kategori.equalsIgnoreCase("Minuman")) badgeColor = "bg-info text-white";
                        else badgeColor = "bg-success text-white";
                    }
                    
                    if(gambar == null || gambar.isEmpty()) {
                        gambar = "https://placehold.co/600x400?text=No+Image"; 
                    } else if (!gambar.startsWith("http")) {
     
                    }
        %>
        
        <div class="col">
            <div class="card card-best h-100">
                <img src="<%= gambar %>" class="card-img-top img-menu-fixed" alt="<%= nama %>">
                
                <div class="card-body d-flex flex-column">
                    <div>
                        <span class="badge <%= badgeColor %> mb-2"><%= kategori %></span>
                        <h5 class="card-title fw-bold"><%= nama %></h5>
                        <p class="card-text small text-muted">
                            <%= (deskripsi != null && deskripsi.length() > 50) ? deskripsi.substring(0, 50) + "..." : deskripsi %>
                        </p>
                    </div>
                    
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <span class="fw-bold" style="color: #854442;">
                            Rp <%= String.format("%,d", harga).replace(',', '.') %>
                        </span>
                        
                        <a href="tambahKeranjang.jsp?id=<%= id %>&nama=<%= java.net.URLEncoder.encode(nama, "UTF-8") %>&harga=<%= harga %>" 
                           class="btn btn-sm shadow-sm" 
                           style="background: #BE9B7B; color: white;">
                           <i class="bi bi-cart-plus"></i> Order
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <% 
                } 
                
                if(!adaMenu) {
                    out.println("<div class='col-12 text-center text-muted'>Belum ada menu rekomendasi tersedia.</div>");
                }
                
                rs.close();
                st.close();
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Gagal memuat rekomendasi: " + e.getMessage() + "</div>");
            }
        %>

    </div>
</div>