<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    :root {
        --warna-latte: #D2B48C;
        --warna-latte-dark: #A88F6D;
        --warna-teks-abu: #555555;
    }

    .navbar-kantin {
        background-color: white !important;
        padding: 12px 0;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        border-bottom: 1px solid #eee;
    }
    
    .brand-text {
        color: black !important;
        font-weight: 800;
        font-size: 1.5rem;
    }

    .nav-link {
        color: var(--warna-teks-abu) !important;
        font-weight: 600;
        margin: 0 10px;
        transition: 0.3s;
    }
    
    .nav-link:hover {
        color: var(--warna-latte) !important;
    }

    .nav-actions {
        display: flex;
        align-items: center;
        flex-wrap: nowrap; 
    }

    /* Styling Keranjang */
    .cart-container {
        position: relative;
        margin-right: 25px; 
        color: var(--warna-latte);
        text-decoration: none;
        transition: 0.3s;
        display: flex;
        align-items: center;
    }
    
    .cart-container i { font-size: 1.3rem; }

    .cart-text {
        font-size: 0.95rem;
        font-weight: 600;
        margin-left: 8px;
        color: var(--warna-teks-abu);
    }

    .cart-badge {
        position: absolute;
        top: -8px;
        right: -12px;
        background-color: var(--warna-latte-dark);
        color: white;
        font-size: 0.7rem;
        padding: 2px 6px;
        border-radius: 50%;
        font-weight: bold;
    }

    /* Tombol Auth */
    .btn-auth-kantin {
        background-color: var(--warna-latte);
        color: white;
        padding: 6px 18px;
        border-radius: 50px;
        font-weight: 600;
        text-decoration: none;
        transition: 0.3s;
        border: none;
        margin-left: 5px;
        font-size: 0.9rem;
    }

    .btn-outline-latte {
        background-color: transparent;
        color: var(--warna-latte);
        border: 2px solid var(--warna-latte);
        padding: 5px 18px;
        border-radius: 50px;
        font-weight: 600;
        text-decoration: none;
        transition: 0.3s;
        margin-left: 10px;
        font-size: 0.9rem;
    }

    .btn-auth-kantin:hover, .btn-outline-latte:hover {
        background-color: var(--warna-latte-dark);
        color: white;
        transform: translateY(-2px);
    }
</style>

<nav class="navbar navbar-expand-lg navbar-kantin sticky-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
      <i class="bi bi-cup-hot-fill me-2" style="color: var(--warna-latte); font-size: 1.8rem;"></i>
      <span class="brand-text">Foodie<span style="color: var(--warna-latte);">Cal</span></span>
    </a>

    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=home">Home</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Kategori</a>
          <ul class="dropdown-menu border-0 shadow mt-2">
            <li><a class="dropdown-item" href="index.jsp?page=makanan">Makanan</a></li>
            <li><a class="dropdown-item" href="index.jsp?page=minuman">Minuman</a></li>
            <li><a class="dropdown-item" href="index.jsp?page=snack">Snacks</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=about">About</a></li>
        <li class="nav-item"><a class="nav-link" href="index.jsp?page=contact">Contact</a></li>
      </ul>

      <div class="nav-actions">
        <a href="index.jsp?page=keranjang" class="cart-container">
          <i class="bi bi-cart-fill"></i>
          <span class="cart-text d-none d-md-inline">Keranjang</span>
          <%
              // Menghitung total quantity barang di keranjang
              int totalItem = 0;
              java.util.List<java.util.Map<String, Object>> cartList = 
                  (java.util.List<java.util.Map<String, Object>>) session.getAttribute("cart");
              if (cartList != null) {
                  for (java.util.Map<String, Object> item : cartList) {
                      totalItem += (int) item.get("qty");
                  }
              }
          %>
          <span class="cart-badge"><%= totalItem %></span>
        </a>

        <% if (session.getAttribute("username") == null) { %>
            <a href="login.jsp" class="btn-auth-kantin">Login</a>
            <a href="register.jsp" class="btn-auth-kantin">Daftar</a>
        <% } else { %>
            <span class="user-greeting">Halo, <%= session.getAttribute("nama") %></span>
            <a href="logout.jsp" class="btn-auth-kantin">Logout</a>
            </div>
        <% } %>
      </div>
    </div>
  </div>
</nav>