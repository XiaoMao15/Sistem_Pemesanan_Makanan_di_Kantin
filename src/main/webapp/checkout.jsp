<%-- 
    Document   : checkout
    Created on : 2 Jan 2026, 23.53.09
    Author     : ACER
--%>

<%@ page import="java.util.*" %>

<h2>Checkout Berhasil</h2>

<%
    List<Map<String, Object>> cart =
        (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
    <p>Tidak ada item untuk di-checkout.</p>
<%
    } else {
        int total = 0;
%>

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
        <%= item.get("nama") %> 
        (x<%= qty %>) - Rp <%= subtotal %>
    </li>
<%
        }
%>
</ul>

<h3>Total Bayar: Rp <%= total %></h3>

<p>Terima kasih sudah memesan di Kantin Kami ?</p>

<%
        // Hapus keranjang setelah checkout
        session.removeAttribute("cart");
    }
%>

<a href="index.jsp?page=order">Kembali ke Menu</a>
