<%-- File: order.jsp --%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String sessionUser = (String) session.getAttribute("username");
    String sessionNama = (String) session.getAttribute("nama_lengkap");
    
    int totalBayar = 0;
    List<Map<String, Object>> cartList = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cartList != null) {
        for (Map<String, Object> item : cartList) {
            int harga = Integer.parseInt(item.get("harga").toString());
            int qty = Integer.parseInt(item.get("qty").toString());
            totalBayar += (harga * qty);
        }
    }
%>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="checkout-card" style="background: white; border-radius: 20px; border: 1px solid #E3D5CA; overflow: hidden; box-shadow: 0 10px 30px rgba(142, 115, 91, 0.1);">
                <div class="checkout-header" style="background-color: #8E735B; color: white; padding: 25px; text-align: center;">
                    <h4 class="mb-0 fw-bold">Ringkasan Pesanan</h4>
                </div>

                <div class="card-body p-4">
                    <form action="proses_pesanan.jsp" method="POST">
                        <div class="mb-3">
                            <label class="small text-muted">Nama Lengkap</label>
                            <%-- Atribut readonly dihapus dan ditambahkan name="nama_pemesan" --%>
                            <input type="text" name="nama_pemesan" class="form-control" 
                                   value="<%= sessionNama != null ? sessionNama : "" %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="small text-muted">Metode Pembayaran</label>
                            <select name="metode_bayar" class="form-select" required>
                                <option value="" disabled selected>Pilih Metode...</option>
                                <option value="Tunai">Bayar di Kasir (Tunai)</option>
                                <option value="QRIS">QRIS / E-Wallet</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="small text-muted">Catatan Tambahan</label>
                            <textarea class="form-control" name="catatan" rows="2" placeholder="Contoh: Tanpa sambal..."></textarea>
                        </div>

                        <div class="p-3 mb-4" style="background-color: #FDF5E6; border-radius: 15px; border: 1px dashed #8E735B;">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold text-muted">Total Pembayaran</span>
                                <span class="h4 fw-bold text-success mb-0">Rp <%= String.format("%,d", totalBayar) %></span>
                            </div>
                        </div>

                        <input type="hidden" name="total_bayar" value="<%= totalBayar %>">
                        <button type="submit" class="btn btn-confirm w-100 py-3 shadow" 
                                style="background-color: #8E735B; color: white; border-radius: 50px; font-weight: bold; border: none;"
                                <%= (totalBayar == 0) ? "disabled" : "" %>>
                            KONFIRMASI PESANAN
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>