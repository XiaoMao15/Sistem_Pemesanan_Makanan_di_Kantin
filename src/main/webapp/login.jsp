<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Kantin Parid</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="body-auth">
    <div class="auth-container">
        <h2>LOGIN</h2>
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Username/Password Salah!</div>
        <% } %>
        <% if(request.getParameter("status") != null) { %>
            <div class="alert alert-success">Daftar Berhasil! Silakan Login.</div>
        <% } %>
        <form action="proses_login.jsp" method="POST">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <button type="submit" class="btn-gold">MASUK</button>
        </form>
        <div class="mt-3">
            <a href="register.jsp" style="color: #a68044; text-decoration: none;">Belum punya akun? Daftar</a><br>
            <a href="index.jsp" style="font-size: 12px; color: gray;">Kembali ke Beranda</a>
        </div>
    </div>
</body>
</html>