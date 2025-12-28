<%-- 
    Document   : hapusKeranjang
    Created on : 28 Dec 2025, 08.29.45
    Author     : ACER
--%>

<%@ page import="java.util.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    List<Map<String, Object>> cart =
        (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart != null) {
        cart.removeIf(item -> (int) item.get("id") == id);
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("index.jsp?page=keranjang");
%>