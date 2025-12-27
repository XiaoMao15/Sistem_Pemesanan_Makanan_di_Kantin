<%-- footer.jsp --%>
<style>
    .foodie-footer {
        background-color: #604a3e; 
        color: #FFF8E1; /* Cokelat tua untuk teks */
        padding: 40px 0 20px;
        border-top: 1px solid rgba(67, 40, 24, 0.1); /* Garis tipis estetik */
        font-family: 'Plus Jakarta Sans', sans-serif;
    }
    .footer-title {
        font-weight: 800;
        font-size: 1.2rem;
        text-transform: uppercase;
        margin-bottom: 15px;
        letter-spacing: 1px;
    }
    .footer-text {
        font-size: 0.9rem;
        line-height: 1.6;
        color: #FFF8E1;
    }
    .footer-contact-item {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        font-size: 0.9rem;
    }
    .footer-contact-item i {
        margin-right: 10px;
        font-size: 1.1rem;
        color: #FFF8E1;
    }
    .footer-social-link {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: #604a3e;
        margin-bottom: 10px;
        font-size: 0.9rem;
        transition: 0.3s;
    }
    .footer-social-link:hover {
        color: #FFF8E1;
    }
    .footer-social-link i {
        margin-right: 10px;
        font-size: 1.1rem;
    }
    .footer-copyright {
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid rgba(67, 40, 24, 0.05);
        font-size: 0.85rem;
        color: #FFF8E1;
    }
</style>

<footer class="foodie-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-5 mb-4">
                <div class="footer-title">FoodieCall</div>
                <p class="footer-text">
                    FoodieCall adalah solusi pesan menu kantin digital yang dirancang 
                    khusus untuk efisiensi waktu mahasiswa di lingkungan kampus. <br>
                    Nikmati kemudahan pesan tanpa antri setiap hari.
                </p>
            </div>

            <div class="col-md-3 mb-4">
                <div class="footer-title">Kontak</div>
                <div class="footer-contact-item">
                    <i class="bi bi-geo-alt"></i>
                    <span>Kampus STT Terpadu Nurul Fikri</span>
                </div>
                <div class="footer-contact-item">
                    <i class="bi bi-envelope"></i>
                    <span>support@Nfoodiecall.com</span>
                </div>
                <div class="footer-contact-item">
                    <i class="bi bi-whatsapp"></i>
                    <span>+62 858 9493 3801</span>
                </div>
            </div>

            <div class="col-md-4 mb-4 ps-md-5">
                <div class="footer-title">SOSIAL MEDIA KAMI</div>
                <div class="footer-social-static mb-3">
                    <i class="bi bi-linkedin me-2"></i>
                    <span>FoodieCall_STTNF</span>
                </div>
                <div class="footer-social-static mb-3">
                    <i class="bi bi-instagram me-2"></i>
                    <span>@Nfoodiecall.id</span>
                </div>
                <div class="footer-social-static">
                    <i class="bi bi-facebook me-2"></i>
                    <span>FoodieCall_NF</span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 text-center footer-copyright">
                Copyright &copy; FoodieCall Team</strong>
            </div>
        </div>
    </div>
</footer>