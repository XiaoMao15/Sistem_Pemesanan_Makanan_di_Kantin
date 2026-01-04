<%-- 
    File: order.jsp
    Fungsi: Checkout (Latte Theme) - Membaca Data Session Real
--%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    :root {
        --latte-bg: #FDF5E6;
        --latte-primary: #8E735B;
        --latte-dark: #5E503F;
    }
    .checkout-card {
        background: white;
        border-radius: 20px;
        border: 1px solid #E3D5CA;
        overflow: hidden;
    }
    .checkout-header {
        background-color: var(--latte-primary);
        color: white;
        padding: 25px;
        text-align: center;
    }
    .btn-confirm {
        background-color: var(--latte-primary);
        color: white;
        border-radius: 50px;
        padding: 12px;
        font-weight: bold;
        width: 100%;
        border: none;
    }
    .btn-confirm:hover { background-color: var(--latte-dark); color: white; }
</style>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="checkout-card shadow-sm">
                <div class="checkout-header">
                    <h3 class="fw-bold mb-0"><i class="bi bi-shield-check me-2"></i>Konfirmasi Checkout</h3>
                </div>

                <div class="p-4">
                    <h5 class="fw-bold mb-3 border-bottom pb-2">Ringkasan Pesanan</h5>
                    
                    <div id="cart-items">
                        <%
                            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                            int totalBayar = 0;
                            if (cart == null || cart.isEmpty()) {
                        %>
                            <p class="text-muted text-center py-4 italic">Belum ada item di keranjang.</p>
                        <%
                            } else {
                                for (Map<String, Object> item : cart) {
                                    int subtotal = (int) item.get("harga") * (int) item.get("qty");
                                    totalBayar += subtotal;
                        %>
                            <div class="d-flex justify-content-between mb-2">
                                <span><%= item.get("qty") %>x <%= item.get("nama") %></span>
                                <span class="fw-bold">Rp <%= String.format("%,d", subtotal) %></span>
                            </div>
                        <%      } 
                            } 
                        %>
                    </div>

                    <div class="mt-4 mb-4">
                        <label class="form-label fw-bold">Metode Pembayaran</label>
                        <select class="form-select" style="border-radius: 10px;">
                            <option value="tunai">Bayar di Kasir (Tunai)</option>
                            <option value="qris">QRIS / E-Wallet</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Catatan Pesanan</label>
                        <textarea class="form-control" rows="2" placeholder="Contoh: Pedas, tanpa kecap, dll." style="border-radius: 10px;"></textarea>
                    </div>

                    <div class="p-3 mb-4" style="background-color: var(--latte-bg); border-radius: 15px;">
                        <div class="d-flex justify-content-between">
                            <h5 class="fw-bold mb-0">Total Bayar</h5>
                            <h5 class="fw-bold text-success mb-0">Rp <%= String.format("%,d", totalBayar) %></h5>
                        </div>
                    </div>

                    <form action="proses_pesanan.jsp" method="POST">
                        <button type="submit" class="btn btn-confirm shadow" <%= (totalBayar == 0) ? "disabled" : "" %>>
                            <i class="bi bi-cart-check-fill me-2"></i>Proses Pesanan Sekarang
                        </button>
                    </form>
                    
                    <div class="text-center mt-3">
                        <a href="index.jsp?page=keranjang" class="text-decoration-none" style="color: var(--latte-primary);">
                             <i class="bi bi-arrow-left"></i> Kembali ke Keranjang
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>