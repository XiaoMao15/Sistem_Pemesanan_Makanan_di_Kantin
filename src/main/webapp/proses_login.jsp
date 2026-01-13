<%@page import="util.KoneksiDB, java.sql.*"%>

<%

    // 1. Ambil data dari form login

    String user = request.getParameter("username");

    String pass = request.getParameter("password");



    try {

        // 2. Hubungkan ke Database

        Connection con = KoneksiDB.getConnection();

        

        // Pastikan kolom 'role' sudah ada di tabel users (Hasil ALTER TABLE)

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");

        ps.setString(1, user);

        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();



        if (rs.next()) {

            // 3. Simpan data user ke dalam Session

            session.setAttribute("username", rs.getString("username"));

            session.setAttribute("nama", rs.getString("nama_lengkap"));

            session.setAttribute("userId", rs.getInt("id"));

            

            // Ambil role dari database (Pastikan sudah jalankan SQL ALTER TABLE)

            String role = rs.getString("role");

            session.setAttribute("role", role);



            // 4. Pengalihan Halaman berdasarkan Role

            if ("admin".equalsIgnoreCase(role)) {

                response.sendRedirect("admin_dashboard.jsp");

            } else if ("penjual".equalsIgnoreCase(role)) {

                response.sendRedirect("penjual_dashboard.jsp");

            } else {

                // Default untuk pelanggan atau jika role tidak dikenal

                response.sendRedirect("index.jsp");

            }



        } else {

            // Jika login gagal

            response.sendRedirect("login.jsp?error=1");

        }

        

    } catch (Exception e) {

        // Menampilkan pesan error jika terjadi kegagalan sistem

        out.println("<div style='color:red; padding:20px; border:1px solid red; font-family:sans-serif;'>");

        out.println("<h3>Terjadi Kesalahan Database:</h3>");

        out.println("<p>" + e.getMessage() + "</p>");

        out.println("<hr><small>Pastikan Anda sudah menambah kolom 'role' di pgAdmin.</small>");

        out.println("</div>");

        e.printStackTrace();

    }

%>