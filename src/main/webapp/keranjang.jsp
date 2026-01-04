<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .cart-card { border-radius: 15px; border: 1px solid #E3D5CA; background: white; }
    .table-latte thead { background-color: #8E735B; color: white; }
    .btn-checkout { background-color: #8E735B; color: white; border-radius: 50px; font-weight: bold; width: 100%; }
    .btn-checkout:hover { background-color: #5E503F; color: white; }
</style>

<div class="container py-4">
    <h3 class="fw-bold mb-4" style="color: #5E503F;"><i class="bi bi-cart3 me-2"></i>Keranjang Belanja</h3>
    
    <div class="row">
        <div class="col-md-8">
            <div class="cart-card shadow-sm p-3">
                <table class="table table-hover table-latte">
                    <thead>
                        <tr>
                            <th>Menu</th>
                            <th>Harga</th>
                            <th class="text-center">Jumlah</th>
                            <th>Subtotal</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                            int total = 0;
                            if (cart == null || cart.isEmpty()) {
                        %>
                            <tr><td colspan="5" class="text-center py-4">Keranjang Anda masih kosong.</td></tr>
                        <%
                            } else {
                                for (Map<String, Object> item : cart) {
                                    int harga = (int) item.get("harga");
                                    int qty = (int) item.get("qty");
                                    int subtotal = harga * qty;
                                    total += subtotal;
                        %>
                            <tr class="align-middle">
                                <td class="fw-bold"><%= item.get("nama") %></td>
                                <td>Rp <%= String.format("%,d", harga) %></td>
                                <td class="text-center"><%= qty %></td>
                                <td class="fw-bold text-success">Rp <%= String.format("%,d", subtotal) %></td>
                                <td>
                                    <a href="hapusKeranjang.jsp?id=<%= item.get("id") %>" class="btn btn-sm btn-outline-danger">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <%      } 
                            } 
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-4">
            <div class="cart-card shadow-sm p-4">
                <h5 class="fw-bold mb-3">Ringkasan</h5>
                <div class="d-flex justify-content-between mb-3">
                    <span>Total Harga</span>
                    <span class="fw-bold">Rp <%= String.format("%,d", total) %></span>
                </div>
                <hr>
                <a href="index.jsp?page=order" class="btn btn-checkout py-2 <%= (total == 0) ? "disabled" : "" %>">
                    Order Now <i class="bi bi-arrow-right ms-2"></i>
                </a>
            </div>
        </div>
    </div>
</div>