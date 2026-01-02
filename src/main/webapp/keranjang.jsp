<%-- 
    Document   : keranjang
    Created on : 25 Dec 2025, 12:36:22
    Author     : MyBook Hype AMD
--%>

<%@ page import="java.util.*" %>

<h2>Keranjang Belanja</h2>

<%
    List<Map<String, Object>> cart =
        (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
    <p>Keranjang masih kosong.</p>
<%
    } else {
        int total = 0;
%>

<table border="1" cellpadding="10">
    <tr>
        <th>Nama Menu</th>
        <th>Harga</th>
        <th>Jumlah</th>
        <th>Subtotal</th>
        <th>Aksi</th>
    </tr>

<%
    for (Map<String, Object> item : cart) {
        int harga = (int) item.get("harga");
        int qty = (int) item.get("qty");
        int subtotal = harga * qty;
        total += subtotal;
%>
    <tr>
        <td><%= item.get("nama") %></td>
        <td>Rp <%= harga %></td>
        <td><%= qty %></td>
        <td>Rp <%= subtotal %></td>
        <td>
            <a href="hapusKeranjang.jsp?id=<%= item.get("id") %>">Hapus</a>
        </td>
    </tr>
<%
    }
%>
    <tr>
        <td colspan="3"><b>Total</b></td>
        <td colspan="2"><b>Rp <%= total %></b></td>
    </tr>
</table>
    
<div style="margin-top:20px; text-align:right;">
    <form action="checkout.jsp" method="post">
        <button type="submit"
                style="padding:10px 20px;
                       background:#C19A6B;
                       color:white;
                       border:none;
                       border-radius:5px;
                       cursor:pointer;">
            Checkout
        </button>
    </form>
</div>

<%
    }
%>