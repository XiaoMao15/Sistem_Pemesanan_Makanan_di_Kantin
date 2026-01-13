<%@ page import="java.sql.*, util.KoneksiDB" %>
<%
    String idStr = request.getParameter("id");

    if (idStr != null && !idStr.isEmpty()) {
        try {
            int id = Integer.parseInt(idStr);
            Connection conn = KoneksiDB.getConnection();

            PreparedStatement psCek = conn.prepareStatement("SELECT role FROM users WHERE id=?");
            psCek.setInt(1, id);
            ResultSet rs = psCek.executeQuery();

            if (rs.next()) {
                String roleUser = rs.getString("role");
                if ("admin".equalsIgnoreCase(roleUser)) {
                    out.println("<script>alert('DILARANG MENGHAPUS ADMIN!'); window.location='admin_dashboard.jsp';</script>");
                    return;
                }
            }

            PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("admin_dashboard.jsp");

        } catch (Exception e) {
            out.println("<script>alert('Gagal menghapus: " + e.getMessage() + "'); window.location='admin_dashboard.jsp';</script>");
        }
    } else {
        response.sendRedirect("admin_dashboard.jsp");
    }
%>