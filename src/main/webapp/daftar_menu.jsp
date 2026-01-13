<%@ page import="java.sql.*, util.KoneksiDB" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    :root {
        --latte-dark: #4B3832;
        --latte-medium: #854442;
        --latte-light: #FFF4E6;
        --latte-accent: #BE9B7B;
        --star-color: #FFD700;
        --bg-soft: #f8f9fa;
    }

    body {
        background-color: var(--bg-soft);
    }

    .menu-header {
        text-align: center;
        margin-bottom: 40px;
        color: var(--latte-dark);
    }
    
    .menu-header h2 {
        font-weight: 800;
        letter-spacing: -1px;
    }

    .search-box {
        max-width: 500px;
        margin: 0 auto 40px;
        position: relative;
    }
    
    .search-box input {
        border-radius: 50px;
        padding: 12px 25px;
        border: 2px solid var(--latte-accent);
        background-color: white;
        box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        transition: 0.3s;
    }
    
    .search-box input:focus {
        border-color: var(--latte-medium);
        box-shadow: 0 0 0 4px rgba(133, 68, 66, 0.1);
        outline: none;
    }

    .card-order {
        border: none;
        border-radius: 15px;
        transition: all 0.3s ease;
        background: white;
        height: 100%;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        display: flex;
        flex-direction: column;
    }

    .card-order:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 20px rgba(75, 56, 50, 0.15);
    }

    .card-img-wrapper {
        height: 180px;
        overflow: hidden;
        position: relative;
    }
    
    .card-img-wrapper img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: 0.5s;
    }
    
    .card-order:hover .card-img-wrapper img {
        transform: scale(1.05);
    }

    .badge-category {
        position: absolute;
        top: 10px;
        left: 10px;
        background: rgba(255, 255, 255, 0.9);
        color: var(--latte-dark);
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 700;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .badge-stok {
        position: absolute;
        top: 10px;
        right: 10px;
        background: var(--latte-medium);
        color: white;
        font-size: 0.7rem;
        padding: 3px 8px;
        border-radius: 4px;
    }

    .card-body {
        padding: 20px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }

    .card-title {
        font-weight: 700;
        color: var(--latte-dark);
        margin-bottom: 5px;
        font-size: 1.1rem;
    }

    .card-desc {
        font-size: 0.85rem;
        color: #777;
        margin-bottom: 15px;
        display: -webkit-box;
        -webkit-line-clamp: 2; 
        -webkit-box-orient: vertical;
        overflow: hidden;
        flex-grow: 1;
    }

    .price-tag {
        font-size: 1.2rem;
        font-weight: 800;
        color: var(--latte-medium);
        margin-bottom: 15px;
    }

    .btn-add {
        background-color: var(--latte-dark);
        color: white;
        border: none;
        border-radius: 10px;
        padding: 10px;
        width: 100%;
        font-weight: 600;
        transition: 0.3s;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }
    
    .btn-add:hover {
        background-color: var(--latte-medium);
        color: white;
    }

    .btn-disabled {
        background-color: #ccc;
        cursor: not-allowed;
        color: #666;
    }

    .item-habis {
        opacity: 0.6;
        filter: grayscale(100%);
    }
</style>

<div class="container py-5">
    
    <div class="menu-header">
        <h2>Daftar Menu FoodieCall</h2>
        <p class="text-muted">Temukan makanan favoritmu hari ini</p>
    </div>

    <div class="search-box">
        <input type="text" id="searchInput" class="form-control" placeholder="Cari menu apa hari ini? (Misal: Nasi Goreng...)">
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4" id="menuContainer">
        
        <%
            try {
                Connection conn = KoneksiDB.getConnection();
                
                String sql = "SELECT * FROM tbl_menu ORDER BY kategori ASC, nama_menu ASC";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);

                boolean adaMenu = false;

                while(rs.next()) {
                    adaMenu = true;
                    int idMenu = rs.getInt("id");
                    String nama = rs.getString("nama_menu");
                    int harga = rs.getInt("harga");
                    int stok = rs.getInt("stok");
                    String kategori = rs.getString("kategori");
                    String gambar = rs.getString("gambar_url");
                    String deskripsi = rs.getString("deskripsi");
                    
                    boolean isHabis = (stok <= 0);
        %>

        <div class="col menu-item" data-name="<%= nama.toLowerCase() %>">
            <div class="card-order <%= isHabis ? "item-habis" : "" %>">
                
                <div class="card-img-wrapper">
                    <img src="<%= (gambar != null && !gambar.isEmpty()) ? gambar : "img/no-image.jpg" %>" alt="<%= nama %>">
                    
                    <div class="badge-category"><%= kategori %></div>
                    
                    <% if(isHabis) { %>
                        <div class="badge-stok" style="background:red;">HABIS</div>
                    <% } else { %>
                        <div class="badge-stok">Sisa: <%= stok %></div>
                    <% } %>
                </div>

                <div class="card-body">
                    <h5 class="card-title"><%= nama %></h5>
                    <p class="card-desc"><%= (deskripsi != null) ? deskripsi : "Enak dan lezat!" %></p>
                    <div class="price-tag">Rp <%= String.format("%,d", harga).replace(',', '.') %></div>

                    <% if(!isHabis) { %>
                        <form action="tambahKeranjang.jsp" method="post">
                            <input type="hidden" name="id_produk" value="<%= idMenu %>">
                            <input type="hidden" name="nama_produk" value="<%= nama %>">
                            <input type="hidden" name="harga_produk" value="<%= harga %>">
                            <input type="hidden" name="qty" value="1">
                            
                            <button type="submit" class="btn-add">
                                <i class="bi bi-cart-plus-fill"></i> Pesan
                            </button>
                        </form>
                    <% } else { %>
                        <button class="btn-add btn-disabled" disabled>
                            <i class="bi bi-x-circle"></i> Stok Habis
                        </button>
                    <% } %>
                </div>

            </div>
        </div>

        <% 
                }  
                
                if(!adaMenu) {
        %>
            <div class="col-12 text-center py-5">
                <h4 class="text-muted">Belum ada menu yang tersedia saat ini.</h4>
            </div>
        <%
                }

            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error memuat menu: " + e.getMessage() + "</div>");
            }
        %>

    </div> </div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const searchInput = document.getElementById('searchInput');
        const menuItems = document.querySelectorAll('.menu-item');

        searchInput.addEventListener('keyup', function(e) {
            const searchString = e.target.value.toLowerCase();

            menuItems.forEach(item => {
                const namaMenu = item.getAttribute('data-name');
                if (namaMenu.includes(searchString)) {
                    item.style.display = ""; 
                } else {
                    item.style.display = "none"; 
                }
            });
        });
    });
</script>