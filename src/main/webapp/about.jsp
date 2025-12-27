<%-- about.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .about-section {
        background-color: #FFF8E1;
        padding: 60px;
        border-radius: 30px;
        color: #3E2723;

        /* Trik untuk memenuhi samping kiri tanpa ubah index.jsp */
        margin-left: -53%; /* Menarik konten ke area sidebar (col-md-4) */
        width: 153%;       /* Melebarkan konten agar totalnya 100% layar */

        position: relative;
        z-index: 10;
        box-shadow: 0 10px 40px rgba(111, 78, 55, 0.1);
    }

    /* Responsif: Jika di HP (layar kecil), biarkan ukurannya normal */
    @media (max-width: 768px) {
        .about-section {
            margin-left: 0;
            width: 100%;
            padding: 30px;
        }
    }

    .brand-accent {
        color: #A67B5B;
        font-weight: 800;
        letter-spacing: 2px;
    }

    .food-img-container {
        position: relative;
        overflow: hidden;
        border-radius: 20px;
        height: 220px;
    }

    .food-img-container img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .badge-latte {
        background-color: #6F4E37;
        color: white;
        padding: 12px 20px;
        border-radius: 15px;
        font-weight: 600;
        display: inline-block;
        margin: 5px;
    }

    .food-img-container img {
        transition: transform 0.5s ease; /* Mengatur durasi gerak */
    }

    .food-img-container:hover img {
        transform: scale(1.1) rotate(2deg); /* Gambar membesar dan miring sedikit */
    }

    @keyframes float {
        0% {
            transform: translateY(0px);
        }
        50% {
            transform: translateY(-15px);
        }
        100% {
            transform: translateY(0px);
        }
    }

    .food-img-container {
        animation: float 4s ease-in-out infinite;
    }

    /* Memberikan jeda waktu agar tidak semua gambar naik turun bersamaan */
    .food-img-container:nth-child(even) {
        animation-delay: 1s;
    }
</style>

<div class="about-section">
    <div class="row align-items-center">
        <div class="col-lg-7">
            <h6 class="text-uppercase fw-bold mb-2" style="color: #A67B5B;">FoodieCall Experience</h6>
            <h1 class="display-4 fw-bold mb-4">ABOUT <span class="brand-accent">FOODIECALL</span></h1>
            <p class="lead fw-normal mb-4">
                Udah gak zaman nunggu lama di depan meja kantin.
            </p>
            <p class="mb-5" style="text-align: justify;">
                FoodieCall merupakan sistem pemesanan menu kantin berbasis digital yang dirancang untuk mendukung efisiensi waktu mahasiswa di lingkungan kampus. Kami memahami bahwa produktivitas akademik sering kali terhambat oleh antrean yang panjang. Melalui FoodieCall, mahasiswa dapat melakukan pemesanan menu lebih awal dari ruang kelas, sehingga proses pengambilan hidangan di kantin dapat dilakukan secara instan tanpa perlu menunggu. Sistem ini hadir untuk menciptakan ekosistem layanan kantin yang lebih terorganisir, cepat, dan transparan.            </p>

        </div>

        <div class="col-lg-5">
            <div class="row g-3">
                <div class="col-6">
                    <div class="food-img-container shadow-sm">
                        <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500" alt="Menu 1">
                    </div>
                </div>
                <div class="col-6">
                    <div class="food-img-container shadow-sm mt-4">
                        <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500" alt="Menu 2">
                    </div>
                </div>
                <div class="col-6">
                    <div class="food-img-container shadow-sm">
                        <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=500" alt="Menu 3">
                    </div>
                </div>
                <div class="col-6">
                    <div class="food-img-container shadow-sm mt-4">
                        <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500" alt="Menu 4">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>