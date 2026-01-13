<%@ page import="java.sql.*" %>
<%@ page import="util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nota Pesanan</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            body {
                background-color: #f4f7f6;
                font-family: 'Poppins', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }
            .card {
                background: white;
                width: 380px;
                border-radius: 20px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                text-align: center;
                padding-bottom: 30px;
                overflow: hidden;
            }
            .header {
                background: #28a745;
                color: white;
                padding: 25px;
                border-radius: 0 0 20px 20px;
            }
            .big-number {
                font-size: 35px;
                font-weight: 600;
                color: #333;
                margin: 10px 0;
            }
            .status-badge {
                background: #e2e6ea;
                padding: 5px 15px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: bold;
            }
            .total-box {
                background: #f8f9fa;
                margin: 20px 30px;
                padding: 15px;
                border-radius: 10px;
                border: 1px dashed #ccc;
            }
            .qr-box {
                margin-top: 15px;
            }
            .btn-home {
                display: inline-block;
                background: #28a745;
                color: white;
                padding: 12px 30px;
                text-decoration: none;
                border-radius: 25px;
                font-weight: 600;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <%
                int userId = (int) session.getAttribute("userId");
                int orderId = 0;
                int total = 0;
                String status = "";
                String metode = "";

                try {
                    Connection conn = KoneksiDB.getConnection();
                    String sql = "SELECT * FROM tbl_order WHERE user_id = ? ORDER BY id DESC LIMIT 1";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, userId);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        orderId = rs.getInt("id");
                        total = rs.getInt("total_bayar");
                        status = rs.getString("status");
                        metode = rs.getString("metode_pembayaran");
                    }
                } catch (Exception e) {
                }
            %>

            <div class="header">
                <h2>✓ Berhasil!</h2>
                <p style="margin:0">Pesanan kamu sudah masuk.</p>
            </div>

            <div style="margin-top:20px;">
                <small style="color:#888">NOMOR ANTRIAN</small>
                <div class="big-number">#<%= orderId%></div>
                <span class="status-badge"><%= status%></span>
            </div>

            <div class="total-box">
                <small style="color:#888">TOTAL BAYAR</small>
                <div style="font-size: 22px; font-weight: bold; color: #28a745;">
                    Rp <%= String.format("%,d", total).replace(',', '.')%>
                </div>
            </div>

            <div class="instruction" style="padding: 0 30px;">
                <% if ("QRIS".equalsIgnoreCase(metode)) { %>
                <p style="font-size: 13px;">Silakan Scan QRIS di bawah ini:</p>
                <div class="qr-box">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/d/d0/QR_code_for_mobile_English_Wikipedia.svg" width="150">
                </div>
                <p style="font-size: 11px; color: #d9534f; margin-top: 10px;">*Tunjukkan bukti transfer ke kasir</p>
                <% } else { %>
                <div style="background: #fff3cd; padding: 15px; border-radius: 10px; border: 1px solid #ffeeba;">
                    <p style="font-size: 14px; margin: 0; color: #856404;">Silakan Bayar <b>Tunai</b> di Kasir</p>
                </div>
                <% }%>
            </div>

            <a href="index.jsp" class="btn-home">Kembali ke Menu</a>
        </div>
    </body>
</html>