<style>
    .hero-carousel .carousel-item {
        height: 480px;
        background-color: #bb9457;
    }
    .hero-carousel img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        filter: brightness(50%); /* Gelap agar teks terbaca jelas */
    }
    .hero-caption {
        bottom: 20% !important;
        text-align: left;
        left: 8% !important;
        padding-right: 15%;
    }
    .hero-caption h5 {
        font-size: 3.5rem;
        font-weight: 800;
        margin-bottom: 0.5rem;
        color: #ffffff;
        text-shadow: 2px 4px 10px rgba(0,0,0,0.3);
    }
    .hero-caption p {
        font-size: 1.25rem;
        margin-bottom: 2rem;
        color: rgba(255,255,255,0.9);
        max-width: 600px;
    }
    .btn-latte {
        background-color: #99582a; /* Cokelat Kopi Warm */
        color: white;
        padding: 15px 40px;
        border-radius: 50px;
        font-weight: 700;
        text-transform: uppercase;
        border: none;
        letter-spacing: 1px;
        transition: 0.3s;
    }
    .btn-latte:hover {
        background-color: #6f1d1b;
        color: white;
        transform: scale(1.05);
    }
</style>

<div id="carouselExampleCaptions" class="carousel slide hero-carousel" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></button>
  </div>
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=1920" class="d-block w-100" alt="Healty Food">
      <div class="carousel-caption hero-caption">
        <h5>Makan Enak Tanpa Antri</h5>
        <p>Solusi cerdas mahasiswa sibuk. Pilih menu kantin favoritmu, pesan lewat aplikasi, dan ambil saat kelas selesai.</p>
      </div>
    </div>
    
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1920" class="d-block w-100" alt="Delicious Food">
      <div class="carousel-caption hero-caption">
        <h5>Ratusan Menu di Genggaman</h5>
        <p>Dari cemilan hingga makanan berat, jelajahi berbagai pilihan rasa dari seluruh penjuru kantin kampus.</p>
      </div>
    </div>
    
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1920" class="d-block w-100" alt="College Life">
      <div class="carousel-caption hero-caption">
        <h5>Siap Ambil, Anti Ribet</h5>
        <p>Terima notifikasi real-time saat makananmu siap. Tinggal ambil di loket tanpa perlu nunggu lama.</p>
      </div>
    </div>
  </div>
</div>