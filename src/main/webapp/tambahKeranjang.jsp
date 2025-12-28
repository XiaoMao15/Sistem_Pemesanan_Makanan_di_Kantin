<%-- 
    Document   : tambahKeranjang
    Created on : 28 Dec 2025, 08.29.24
    Author     : ACER
--%>

<%@ page import="java.util.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nama = request.getParameter("nama");
    int harga = Integer.parseInt(request.getParameter("harga"));

    List<Map<String, Object>> cart =
        (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
    }

    boolean found = false;

    for (Map<String, Object> item : cart) {
        if ((int) item.get("id") == id) {
            item.put("qty", (int) item.get("qty") + 1);
            found = true;
            break;
        }
    }

    if (!found) {
        Map<String, Object> item = new HashMap<>();
        item.put("id", id);
        item.put("nama", nama);
        item.put("harga", harga);
        item.put("qty", 1);
        cart.add(item);
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("index.jsp?page=keranjang");
%>