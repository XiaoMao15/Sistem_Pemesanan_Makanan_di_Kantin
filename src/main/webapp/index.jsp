<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sistem Kantin</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <style>
            .row { margin-bottom: 10px; }
            .content-area { min-height: 500px; }
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12"><%@ include file="header.jsp" %></div>
            </div>

            <div class="row">
                <div class="col-md-12"><%@ include file="menu.jsp" %></div>
            </div>

            <div class="row content-area">
                <% 
                    String p = request.getParameter("page");
                    if (p == null) { p = "home"; } // Antisipasi agar tidak error null pointer
                %>

                <% if (p.equals("order")) { %>
                    <div class="col-md-12">
                        <%@ include file="order.jsp" %>
                    </div>
                <% } else { %>
                    <div class="col-md-4">
                        <%@ include file="sidebar.jsp" %>
                    </div>

                    <div class="col-md-8">
                        <%
                            if (p.equals("home")) {
                                %> <%@ include file="main.jsp" %> <%
                            } else if (p.equals("keranjang")) {
                                %> <%@ include file="keranjang.jsp" %> <%
                            } else if (p.equals("login")) {
                                %> <%@ include file="login.jsp" %> <%
                            } else if (p.equals("about")) {
                                %> <%@ include file="about.jsp" %> <%
                            } else if (p.equals("contact")) {
                                %> <%@ include file="contact.jsp" %> <%
                            } else if (p.equals("makanan")) {
                                %> <%@ include file="makanan.jsp" %> <%
                            } else if (p.equals("minuman")) {
                                %> <%@ include file="minuman.jsp" %> <%
                            } else if (p.equals("snack")) {
                                %> <%@ include file="snack.jsp" %> <%
                            } else {
                                %> <%@ include file="main.jsp" %> <%
                            }
                        %>
                    </div>
                <% } %>
            </div>

            <div class="row">
                <div class="col-md-12"><%@ include file="footer.jsp" %></div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>