<%
    session.invalidate();
    response.sendRedirect("index.jsp?page=login");
%>