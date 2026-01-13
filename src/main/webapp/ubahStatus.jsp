<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("penjual")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idPesanan = request.getParameter("id_pesanan"); 
    String statusBaru = request.getParameter("status_baru");

    if (idPesanan != null && statusBaru != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = KoneksiDB.getConnection();
            
            String sql = "UPDATE tbl_order SET status = ? WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, statusBaru);
            ps.setInt(2, Integer.parseInt(idPesanan));
            
            ps.executeUpdate();
            
            response.sendRedirect("penjual_dashboard.jsp?status=updated");
            
        } catch (Exception e) {
            out.println("<h3>Error saat update: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                if(ps != null) ps.close();
                
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        response.sendRedirect("penjual_dashboard.jsp");
    }
%>