<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    :root {
        --latte-dark: #4B3832;
        --latte-medium: #854442;
        --latte-light: #FFF4E6;
        --latte-accent: #BE9B7B;
        --star-color: #FFD700;
    }
    .order-container {
        background-color: var(--latte-light);
        padding: 20px;
        border-radius: 10px;
        color: var(--latte-dark);
        width: 100%;
    }
    .card-order {
        border: none;
        border-radius: 12px;
        transition: transform 0.3s ease;
        background: white;
        height: 100%;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    .card-order:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 15px rgba(75, 56, 50, 0.1);
    }
    .img-wrapper { height: 160px; overflow: hidden; border-radius: 12px 12px 0 0; }
    .img-wrapper img { width: 100%; height: 100%; object-fit: cover; }
    .star-rating { color: var(--star-color); font-size: 0.8rem; }
    .price-tag { font-weight: 800; color: var(--latte-medium); }
    .btn-latte { background-color: var(--latte-accent); color: white; border-radius: 8px; padding: 4px 12px; border: none; transition: all 0.3s ease; }
    .btn-latte:hover { background-color: var(--latte-dark); color: white; }
</style>

<div class="order-container shadow-sm">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold mb-0">Menu Cemilan</h4>
        <span class="badge bg-white text-dark shadow-sm px-3 py-2 rounded-pill">Teman Santai</span>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1573082810397-5d11bc92eba0?q=80&w=500&h=300&auto=format&fit=crop" alt="Snack">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(4.9)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Kentang Goreng</h6>
                    <p class="small text-muted mb-2">Kentang goreng renyah dengan saus.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-tag small">Rp 12.000</span>
                        <a href="tambahKeranjang.jsp?id=301&nama=Kentang+Goreng&harga=12000" class="btn btn-latte"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>