<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
 
    try {
        String idStr = request.getParameter("id_produk");
        String nama = request.getParameter("nama_produk");
        String hargaStr = request.getParameter("harga_produk");
        String qtyStr = request.getParameter("qty");

        if (idStr != null && nama != null && hargaStr != null) {
            
            int id = Integer.parseInt(idStr);
            int harga = Integer.parseInt(hargaStr);
            int qty = (qtyStr != null) ? Integer.parseInt(qtyStr) : 1;

          ArrayList<Map<String, Object>> cart = (ArrayList<Map<String, Object>>) session.getAttribute("cart");
            
            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean isExist = false;
            for (Map<String, Object> item : cart) {
                int itemId = (int) item.get("id");
                
                if (itemId == id) {
                    int oldQty = (int) item.get("qty");
                    item.put("qty", oldQty + qty);
                    isExist = true;
                    break;
                }
            }

            if (!isExist) {
                Map<String, Object> newItem = new HashMap<>();
                newItem.put("id", id);
                newItem.put("nama", nama);
                newItem.put("harga", harga);
                newItem.put("qty", qty);
                newItem.put("subtotal", harga * qty); 
                
                cart.add(newItem);
            }

            session.setAttribute("cart", cart);
        }

      response.sendRedirect("index.jsp?page=daftar_menu");

    } catch (Exception e) {
        out.println("<h3>Terjadi Kesalahan: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>