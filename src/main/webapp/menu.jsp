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
    }

    /* Keranjang Latte */
    .cart-container {
        background-color: var(--warna-latte);
        color: white !important;
        padding: 6px 16px;
        border-radius: 50px;
        text-decoration: none;
        display: flex;
        align-items: center;
        margin-right: 12px;
        font-weight: bold;
    }

    .cart-badge {
        background-color: white;
        color: var(--warna-latte);
        border-radius: 50%;
        width: 22px;
        height: 22px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 8px;
        font-size: 0.8rem;
    }

    /* Tombol Order Latte */
    .btn-order-now {
        background-color: var(--warna-latte);
        color: white !important;
        padding: 8px 22px !important;
        border-radius: 50px;
        font-weight: bold;
        text-decoration: none;
        margin-right: 12px;
        transition: 0.3s;
    }

    .btn-order-now:hover {
        background-color: var(--warna-latte-dark);
    }

    /* Tombol Login Latte Outline */
    .btn-login-kantin {
        color: var(--warna-latte) !important;
        border: 2px solid var(--warna-latte);
        padding: 6px 22px !important;
        border-radius: 50px;
        font-weight: bold;
        text-decoration: none;
        transition: 0.3s;
    }

    .btn-login-kantin:hover {
        background-color: var(--warna-latte);
        color: white !important;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-kantin sticky-top">
  <div class="container">
    <a class="navbar-brand brand-text" href="index.jsp?page=home">FoodieCall</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
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
          <span class="cart-badge">0</span>
        </a>
        <a href="index.jsp?page=order" class="btn-order-now">Order Now</a>
        <a href="login.jsp?page=login" class="btn-login-kantin">Login</a>
      </div>
    </div>
  </div>
</nav>