<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Mengambil data role dari session untuk menentukan tampilan
    String role = (String) session.getAttribute("role");
    if (role == null) {
        role = "guest"; // Jika belum login, dianggap tamu
    }
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sistem Kantin - Multi Role</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            .content-area {
                min-height: 500px;
                padding-top: 20px;
            }
            body {
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12"><%@ include file="header.jsp" %></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <%@ include file="menu.jsp" %>
                </div>
            </div>

            <div class="row content-area">
                <div class="container">
                    <%
                        String p = request.getParameter("page");
                        if (p == null) {
                            p = "home";
                        }
                    %>

                    <%-- Logika Routing Halaman --%>
                    <% if (p.equals("order")) {%>
                    <%@ include file="order.jsp" %>
                    <% } else if (p.equals("home")) {%>
                    <%@ include file="main.jsp" %>
                    <% } else if (p.equals("keranjang")) {%>
                    <%@ include file="keranjang.jsp" %>
                    <% } else if (p.equals("daftar_menu")) { %>
                    <%@ include file="daftar_menu.jsp" %>
                    <% } else if (p.equals("about")) { %>
                    <%@ include file="about.jsp" %>
                    <% } else if (p.equals("contact")) { %>
                    <%@ include file="contact.jsp" %>
                    <% } else if (p.equals("gallery")) { %>
                    <%@ include file="gallery.jsp" %>
                    <% } else {%>
                    <%@ include file="main.jsp" %>
                    <% }%>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12"><%@ include file="footer.jsp" %></div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>