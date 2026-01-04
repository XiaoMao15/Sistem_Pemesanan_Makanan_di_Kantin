<%-- 
    File: contact.jsp
    Tampilan: Halaman Kontak dengan Tema Warna Latte
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Variabel Warna Latte */
    :root {
        --latte-bg: #FDF5E6;      /* Cream Muda (Old Lace) */
        --latte-primary: #8E735B;  /* Cokelat Latte */
        --latte-secondary: #C6AC8F; /* Warna Sand/Pasir */
        --latte-dark: #5E503F;     /* Coffee Brown */
        --latte-text: #3E2723;     /* Dark Chocolate */
    }

    .contact-wrapper {
        color: var(--latte-text);
    }

    .contact-header {
        background-color: var(--latte-bg);
        padding: 45px 25px;
        border-radius: 20px;
        margin-bottom: 35px;
        border-left: 8px solid var(--latte-primary);
        box-shadow: 0 4px 12px rgba(0,0,0,0.03);
    }

    .contact-header h2 {
        color: var(--latte-dark);
    }

    /* Kartu Informasi */
    .card-latte {
        border: 1px solid #eee;
        background-color: #fff;
        border-radius: 18px;
        transition: all 0.3s ease;
        height: 100%;
    }

    .card-latte:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 20px rgba(142, 115, 91, 0.1);
        border-color: var(--latte-secondary);
    }

    .info-icon {
        font-size: 2.2rem;
        color: var(--latte-primary);
        margin-bottom: 15px;
    }

    /* Styling Form */
    .form-latte-container {
        background-color: #fff;
        border-radius: 20px;
        border: 1px solid #f0f0f0;
    }

    .form-control-latte {
        border-radius: 12px;
        border: 1.5px solid #E3D5CA;
        padding: 12px 15px;
    }

    .form-control-latte:focus {
        border-color: var(--latte-primary);
        box-shadow: 0 0 0 0.25rem rgba(142, 115, 91, 0.25);
    }

    .btn-latte {
        background-color: var(--latte-primary);
        color: white;
        border-radius: 50px;
        padding: 12px 35px;
        font-weight: bold;
        border: none;
        transition: background 0.3s;
    }

    .btn-latte:hover {
        background-color: var(--latte-dark);
        color: #fff;
    }
</style>

<div class="container py-3 contact-wrapper">
    <div class="contact-header">
        <h2 class="fw-bold"><i class="bi bi-chat-quote-fill me-2"></i>Hubungi Kami</h2>
        <p class="mb-0">Ada pertanyaan tentang menu hari ini atau ingin memberikan saran? Kami dengan senang hati mendengarkan Anda.</p>
    </div>

    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="card card-latte p-4 shadow-sm">
                <i class="bi bi-geo-alt-fill info-icon"></i>
                <h5 class="fw-bold">Lokasi Kantin</h5>
                <p class="text-muted small">Area Kampus Timur, Lantai Dasar Gedung C</p>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card card-latte p-4 shadow-sm">
                <i class="bi bi-whatsapp info-icon"></i>
                <h5 class="fw-bold">Layanan WhatsApp</h5>
                <p class="text-muted small">Chat: +62 858 9493 3801<br>(Fast Response)</p>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card card-latte p-4 shadow-sm">
                <i class="bi bi-clock-fill info-icon"></i>
                <h5 class="fw-bold">Jam Operasional</h5>
                <p class="text-muted small">Senin - Sabtu<br>07.30 - 18.00 WIB</p>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-12">
            <div class="form-latte-container shadow-sm p-5">
                <h4 class="fw-bold mb-4 text-center">Tinggalkan Pesan</h4>
                <form action="#" method="POST">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label small fw-bold">Nama Lengkap</label>
                            <input type="text" class="form-control form-control-latte" placeholder="Nama Anda" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label small fw-bold">Email / NIM</label>
                            <input type="text" class="form-control form-control-latte" placeholder="Contoh: 21XXXXXX atau email@mhs.ac.id" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Pesan Anda</label>
                        <textarea class="form-control form-control-latte" rows="4" placeholder="Tulis masukan, keluhan, atau pertanyaan Anda di sini..." required></textarea>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-latte shadow">
                            <i class="bi bi-send-check-fill me-2"></i>Kirim Sekarang
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>