package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KoneksiDB {
    private static Connection koneksi;

    public static Connection getConnection() {
        if (koneksi == null) {
            try {
                String url = "jdbc:postgresql://localhost:5432/kantin_db"; 
                String user = "postgres"; 
                String pass = "12345"; // <-- GANTI INI

                Class.forName("org.postgresql.Driver");
                koneksi = DriverManager.getConnection(url, user, pass);
                System.out.println("Koneksi Berhasil!");
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("Koneksi Gagal: " + e.getMessage());
            }
        }
        return koneksi;
    }
}