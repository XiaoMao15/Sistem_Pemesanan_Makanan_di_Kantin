<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar - Kantin Parid</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="body-auth">
    <div class="auth-container">
        <h2>DAFTAR AKUN</h2>
        <form action="proses_register.jsp" method="POST">
            <input type="text" name="nama" class="form-control" placeholder="Nama Lengkap" required>
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <button type="submit" class="btn-gold">DAFTAR SEKARANG</button>
        </form>
        <div class="mt-3">
            <a href="login.jsp" style="color: #a68044; text-decoration: none;">Sudah punya akun? Login</a>
        </div>
    </div>
</body>
</html>