<%-- 
    Document   : checkout
    Created on : 2 Jan 2026, 23.53.09
    Author     : ACER
--%>

<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f7f4f1;
    }

    .checkout-container {
        max-width: 600px;
        margin: 50px auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #6b4f3b;
        margin-bottom: 20px;
    }

    h3 {
        color: #6b4f3b;
        border-bottom: 2px solid #eee;
        padding-bottom: 5px;
    }

    ul {
        list-style: none;
        padding: 0;
        margin-top: 15px;
    }

    ul li {
        display: flex;
        justify-content: space-between;
        padding: 8px 0;
        border-bottom: 1px dashed #ddd;
    }

    .total {
        margin-top: 20px;
        font-size: 18px;
        font-weight: bold;
        text-align: right;
        color: #333;
    }

    .thankyou {
        margin-top: 25px;
        text-align: center;
        color: #555;
    }

    .btn-back {
        display: block;
        width: fit-content;
        margin: 30px auto 0;
        padding: 10px 20px;
        background: #c19a6b;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    }

    .btn-back:hover {
        background: #a67c52;
    }
</style>

<div class="checkout-container">
<%
    List<Map<String, Object>> cart =
        (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
    <h2>Checkout Gagal</h2>
    <p style="text-align:center;">Keranjang kosong.</p>
<%
    } else {
        int total = 0;
%>
    <h2>Checkout Berhasil 🎉</h2>

    <h3>Detail Pesanan</h3>
    <ul>
    <%
        for (Map<String, Object> item : cart) {
            int harga = (int) item.get("harga");
            int qty = (int) item.get("qty");
            int subtotal = harga * qty;
            total += subtotal;
    %>
        <li>
            <span><%= item.get("nama") %> (x<%= qty %>)</span>
            <span>Rp <%= subtotal %></span>
        </li>
    <%
        }
    %>
    </ul>

    <div class="total">
        Total Bayar: Rp <%= total %>
    </div>

    <div class="thankyou">
        Terima kasih sudah memesan di <b>Kantin Kita</b> 🙏
    </div>

<%
        // Kosongkan keranjang setelah checkout
        session.removeAttribute("cart");
    }
%>

    <a href="index.jsp?page=order" class="btn-back">Kembali ke Menu</a>
</div>
