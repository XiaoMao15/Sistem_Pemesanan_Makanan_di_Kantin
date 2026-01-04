<%-- 
    Document   : order
    Created on : 25 Dec 2025, 12:34:49
    Author     : MyBook Hype AMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    :root {
        --latte-dark: #4B3832;
        --latte-medium: #854442;
        --latte-light: #FFF4E6;
        --latte-accent: #BE9B7B;
        --star-color: #FFD700;
    }

    /* Menghilangkan padding berlebih agar pas dengan index.jsp */
    .order-container {
        background-color: var(--latte-light);
        padding: 20px;
        border-radius: 10px;
        color: var(--latte-dark);
        width: 100%; /* Memastikan ukuran full */
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

    /* Memastikan rasio gambar tetap konsisten (16:9 atau 4:3) */
    .img-wrapper {
        width: 100%;
        height: 160px;
        overflow: hidden;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
        background-color: #eee; /* Warna cadangan jika gambar gagal load */
    }

    .img-wrapper img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .star-rating {
        color: var(--star-color);
        font-size: 0.8rem;
    }

    .price-tag {
        color: var(--latte-medium);
        font-weight: bold;
    }

    .btn-latte {
        background-color: var(--latte-medium);
        color: white;
        border: none;
        border-radius: 5px;
        padding: 5px 10px;
        font-size: 0.8rem;
        text-decoration: none; /* Agar link tidak ada garis bawah */
        display: inline-block;
    }

    .btn-latte:hover {
        background-color: var(--latte-dark);
        color: white;
        text-decoration: none;
    }
</style>

<div class="order-container">
    <h3 class="mb-4" style="border-left: 5px solid var(--latte-medium); padding-left: 15px;">
        <i class="bi bi-shop me-2"></i>Daftar Menu Lengkap
    </h3>

    <div class="row row-cols-1 row-cols-md-3 g-3">
        
        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="https://asset.kompas.com/crops/dQL-SQcsA1QuFWeRj6n6WZRcHTE=/202x66:1000x599/750x500/data/photo/2023/05/07/6456a450d2edd.jpg" alt="Nasi Goreng">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(5.0)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Nasi Goreng Jawa</h6>
                    <p class="small text-muted mb-2">Resep tradisional dengan bumbu rempah pilihan.</p>
                    <div class="d-flex justify-content-between align-items-center mt-auto">
                        <span class="price-tag small">Rp 18.000</span>
                        <!-- Link ke tambahKeranjang.jsp dengan parameter -->
                        <a href="tambahKeranjang.jsp?id=1&nama=Nasi Goreng Jawa&harga=18000" class="btn btn-latte" onclick="return confirm('Tambah Nasi Goreng Jawa ke keranjang?')"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="http://www.databisnisekonomi.com/wp-content/uploads/2018/11/resep-mie-ayam-bakso-1.jpg" alt="Mie Ayam">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(5.0)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Mie Ayam Bakso</h6>
                    <p class="small text-muted mb-2">Mie kenyal dengan topping ayam melimpah.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-tag small">Rp 15.000</span>
                        <a href="tambahKeranjang.jsp?id=2&nama=Mie Ayam Bakso&harga=15000" class="btn btn-latte" onclick="return confirm('Tambah Mie Ayam Bakso ke keranjang?')"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="https://cdn0-production-images-kly.akamaized.net/3ChxMc1fzTjz7DIAz5qKoAzr4HU=/1x63:1000x626/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4439167/original/080873300_1684911560-shutterstock_2220175069.jpg" alt="Pisang Goreng">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(5.0)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Pisang Goreng Crispy</h6>
                    <p class="small text-muted mb-2">Pisang manis dengan balutan tepung renyah.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-tag small">Rp 10.000</span>
                        <a href="tambahKeranjang.jsp?id=3&nama=Pisang Goreng Crispy&harga=10000" class="btn btn-latte" onclick="return confirm('Tambah Pisang Goreng Crispy ke keranjang?')"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="http://resepmakanan-id.com/wp-content/uploads/2021/08/siomay2.jpg" alt="Siomay">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(5.0)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Siomay Ikan Tenggiri</h6>
                    <p class="small text-muted mb-2">Siomay kukus dengan bumbu kacang kental.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-tag small">Rp 12.000</span>
                        <a href="tambahKeranjang.jsp?id=4&nama=Siomay Ikan Tenggiri&harga=12000" class="btn btn-latte" onclick="return confirm('Tambah Siomay Ikan Tenggiri ke keranjang?')"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="https://asset-2.tstatic.net/style/foto/bank/images/teh-tarik_20170820_150340.jpg" alt="Teh Tarik">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(5.0)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Teh Tarik Dingin</h6>
                    <p class="small text-muted mb-2">Perpaduan teh dan susu yang pas.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-tag small">Rp 8.000</span>
                        <a href="tambahKeranjang.jsp?id=5&nama=Teh Tarik Dingin&harga=8000" class="btn btn-latte" onclick="return confirm('Tambah Teh Tarik Dingin ke keranjang?')"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-order">
                <div class="img-wrapper">
                    <img src="https://i.fbcd.co/products/resized/resized-750-500/3b31edc71a1cf0a10a880ebacfec9cf60fc1a2a9ab9755a9e9b644fdbcbab2d3.jpg" alt="Coffee">
                </div>
                <div class="card-body p-3">
                    <div class="star-rating mb-1">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        <span class="text-muted small">(5.0)</span>
                    </div>
                    <h6 class="card-title mb-1 fw-bold">Hot Cappuccino</h6>
                    <p class="small text-muted mb-2">Espresso dengan foam susu tebal.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-tag small">Rp 15.000</span>
                        <a href="tambahKeranjang.jsp?id=6&nama=Hot Cappuccino&harga=15000" class="btn btn-latte" onclick="return confirm('Tambah Hot Cappuccino ke keranjang?')"><i class="bi bi-cart"></i></a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>