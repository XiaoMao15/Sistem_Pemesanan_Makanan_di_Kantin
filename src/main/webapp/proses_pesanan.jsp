<%@ page import="java.util.*" %>
<%@ page import="dao.OrderDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Object userIdObj = session.getAttribute("userId");
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        String totalStr = request.getParameter("total_bayar");
        String metode = request.getParameter("metode_bayar");

        if (userIdObj == null) {
            out.println("<script>alert('Sesi Habis! Silakan Login Kembali.'); window.location='login.jsp';</script>");
            return;
        }
        if (cart == null || cart.isEmpty()) {
            out.println("<script>alert('Keranjang Kosong!'); window.location='index.jsp?page=menu';</script>");
            return;
        }

        int userId = (int) userIdObj;
        int totalBayar = Integer.parseInt(totalStr != null ? totalStr : "0");
        if(metode == null) metode = "Tunai";

        OrderDAO daoPesanan = new OrderDAO();
        boolean sukses = daoPesanan.simpanPesanan(userId, totalBayar, metode, cart);

        if (sukses) {
            session.removeAttribute("cart"); 
            out.println("<script>alert('Pesanan Berhasil!'); window.location='nota.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal Simpan Database!'); window.history.back();</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>