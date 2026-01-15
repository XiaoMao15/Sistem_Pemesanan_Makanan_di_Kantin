<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. CEK ROLE & SESSION
    String r = (String) session.getAttribute("role");
    String u = (String) session.getAttribute("username");
    
    // Normalisasi role agar aman (handle null)
    if (r == null) r = "guest"; 
    
    // 2. ATURAN ADMIN: 
    // Jika Admin, JANGAN tampilkan navbar ini sama sekali.
    // Admin punya header sendiri di dashboardnya.
    if (r.equalsIgnoreCase("admin")) {
        return; 
    }
%>

<style>
    :root {
        --warna-latte: #D2B48C;
        --warna-latte-dark: #A88F6D;
        --warna-teks-abu: #555555;
    }
    .navbar-kantin { background: white; border-bottom: 1px solid #eee; padding: 12px 0; }
    .brand-text { font-weight: 800; font-size: 1.5rem; color: black; display: flex; align-items: center; }
    .nav-link { color: var(--warna-teks-abu) !important; font-weight: 600; margin: 0 8px; transition: 0.3s; }
    .nav-link:hover { color: var(--warna-latte) !important; }
    .btn-login { background: var(--warna-latte); color: white !important; padding: 6px 20px; border-radius: 20px; text-decoration: none; font-weight: bold; }
    .btn-login:hover { background: var(--warna-latte-dark); }
    
    /* Style Keranjang */
    .cart-box { position: relative; color: #555; margin-right: 15px; text-decoration: none; }
    .cart-box:hover { color: var(--warna-latte); }
    .cart-count { background: #ff4d4d; color: white; font-size: 10px; padding: 2px 6px; border-radius: 50%; position: absolute; top: -5px; right: -8px; }
</style>

<nav class="navbar navbar-expand-lg navbar-kantin sticky-top">
  <div class="container">
    <a class="navbar-brand brand-text" href="index.jsp">
      <i class="bi bi-cup-hot-fill text-warning fs-4 me-2"></i>
      Foodie<span style="color: var(--warna-latte)">Call</span>
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navUtama">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navUtama">
      <ul class="navbar-nav mx-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=home">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=daftar_menu">Menu</a></li>
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=about">About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=contact">Contact Us</a></li>
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=gallery">Gallery</a></li>
      </ul>

      <div class="d-flex align-items-center gap-3">
        <a href="index.jsp?page=history" class="text-decoration-none text-dark fw-semibold">
        <i class="bi bi-clock-history"></i> History
       </a>
        <a href="index.jsp?page=keranjang" class="cart-box">
          <i class="bi bi-cart-fill fs-5"></i>
          <%
              java.util.List c = (java.util.List) session.getAttribute("cart");
              int jml = (c != null) ? c.size() : 0;
              if(jml > 0) { 
          %>
            <span class="cart-count"><%= jml %></span>
          <% } %>
        </a>

        <% if (u == null) { %>
            <a href="login.jsp" class="btn-login">Login</a>
        <% } else { %>
            <div class="dropdown ms-2">
                <a class="dropdown-toggle text-decoration-none text-dark fw-bold" href="#" data-bs-toggle="dropdown">
                    <%= u %>
                </a>
                <ul class="dropdown-menu dropdown-menu-end border-0 shadow">
                    <li><a class="dropdown-item text-danger" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        <% } %>
      </div>
    </div>
  </div>
</nav>