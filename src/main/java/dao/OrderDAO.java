package dao;

import java.sql.*;
import java.util.*;
import util.KoneksiDB;

public class OrderDAO {

    public boolean simpanPesanan(int userId, int total, String metode, List<Map<String, Object>> cart) {
        Connection conn = KoneksiDB.getConnection();
        
        try {
            if (conn == null || conn.isClosed()) {
                System.out.println("DEBUG: Koneksi Database Bermasalah!");
                return false;
            }
        } catch (SQLException ex) { return false; }

        if (cart == null || cart.isEmpty()) return false;

        String sqlOrder = "INSERT INTO tbl_order (user_id, total_bayar, metode_pembayaran, status) VALUES (?, ?, ?, 'Diproses')";
        String sqlDetail = "INSERT INTO tbl_order_detail (order_id, nama_produk, harga, qty) VALUES (?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false); 

            try (PreparedStatement psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS)) {
                psOrder.setInt(1, userId);
                psOrder.setInt(2, total);
                psOrder.setString(3, metode);
                
                int affected = psOrder.executeUpdate();
                if (affected == 0) { conn.rollback(); return false; }

                try (ResultSet rs = psOrder.getGeneratedKeys()) {
                    if (rs.next()) {
                        int orderId = rs.getInt(1);
                        
                        try (PreparedStatement psDetail = conn.prepareStatement(sqlDetail)) {
                            for (Map<String, Object> item : cart) {
                                psDetail.setInt(1, orderId);
                                psDetail.setString(2, item.get("nama").toString());
                                
                                String hargaRaw = item.get("harga").toString().replaceAll("[^0-9]", "");
                                psDetail.setInt(3, Integer.parseInt(hargaRaw));
                                psDetail.setInt(4, Integer.parseInt(item.get("qty").toString()));
                                psDetail.addBatch();
                            }
                            psDetail.executeBatch();
                            conn.commit(); 
                            return true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            try { conn.rollback(); } catch (SQLException se) {}
            e.printStackTrace();
        }
        return false;
    }
}