<%@ page import="java.sql.*, util.KoneksiDB" %>
<%
    String id = request.getParameter("id");
    try {
        Connection conn = KoneksiDB.getConnection();
        PreparedStatement ps = conn.prepareStatement("DELETE FROM tbl_menu WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        response.sendRedirect("kelola_menu.jsp");
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>