<%
    // Menangkap parameter 'halaman' dari URL
    String hal = request.getParameter("halaman");
    
    if (hal != null && !hal.isEmpty()) {
        String url = hal + ".jsp";
%>
    <jsp:include page="<%= url %>" />
<%
    } else { 
%>
    <%@include file="home.jsp" %>
<%
    }
%>