<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Galeri Tim Kami</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        .flip-card {
            background-color: transparent;
            height: 400px; 
            perspective: 1000px;
            margin-bottom: 30px;
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
            box-shadow: 0 4px 15px 0 rgba(0,0,0,0.1);
            border-radius: 20px;
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .flip-card-front {
            background-color: #ffffff;
            color: gray;
            border: 1px solid #f0f0f0;
        }

        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%; 
            object-fit: cover;  
            border: 5px solid #f8f9fa;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .flip-card-back {
            background: linear-gradient(135deg, #0d6efd, #0a58ca); 
            color: white;
            transform: rotateY(180deg); 
        }
        
        .bg-backend {
            background: linear-gradient(135deg, #c8c8c8, #343a40) !important;
        }
        
        .bg-laporan {
            background: linear-gradient(135deg, #198754, #157347) !important;
        }
        
        .nim-text {
            font-family: monospace;
            background-color: #e9ecef;
            padding: 2px 10px;
            border-radius: 5px;
            font-size: 0.9rem;
            color: #495057;
        }
    </style>
</head>
<body class="bg-light">



    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold text-primary">Our Member</h2>
            <p class="text-muted">Arahkan kursor ke foto anggota untuk melihat detail tugasnya.</p>
        </div>

        <div class="row justify-content-center">
            
            <div class="col-md-4">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="images/MBG.jpeg" class="profile-img" alt="Foto Anggota">
                            
                            <h4 class="fw-bold m-0">Muhammad Bintang Gunawan</h4>
                            <span class="text-muted small mb-2">Backend & Frontend</span>
                            <div class="nim-text">NIM: 0110224003</div>
                        </div>

                        <div class="flip-card-back">
                            <h4 class="fw-bold mb-3"><i class="bi bi-brush"></i> Tugas Frontend & Backend</h4>
                            <ul class="list-unstyled text-start w-100 px-4">
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Design Navbar</li>
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Design Home</li>
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Create Database</li>
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Create Sytstem Order & Sell </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="images/Parid.jpeg" class="profile-img" alt="Foto Anggota">
                            
                            <h4 class="fw-bold m-0">Ahmad Parid Hidayat</h4>
                            <span class="text-muted small mb-2">Backend & Frontend</span>
                            <div class="nim-text">NIM: 0110224025</div>
                        </div>

                        <div class="flip-card-back bg-backend">
                            <h4 class="fw-bold mb-3"><i class="bi bi-database"></i> Tugas Backend & Frontend</h4>
                            <ul class="list-unstyled text-start w-100 px-4">
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Create Database</li>
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Logic Login, Register & Session</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="images/hasna.jpeg" class="profile-img" alt="Foto Anggota">
                            
                            <h4 class="fw-bold m-0">Hasna Ghaniyyah </h4>
                            <span class="text-muted small mb-2">frontend</span>
                            <div class="nim-text">NIM: 0110224062</div>
                        </div>

                        <div class="flip-card-back bg-laporan">
                            <h4 class="fw-bold mb-3"><i class="bi bi-file-text"></i> Tugas Frontend</h4>
                            <ul class="list-unstyled text-start w-100 px-4">
                                <li class="mb-2"><i class="bi bi-check2-square"></i> About us page</li>
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Footer</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="images/Rafif.jpeg" class="profile-img" alt="Foto Anggota">
                            
                            <h4 class="fw-bold m-0">Muhammad Andrian Rafif</h4>
                            <span class="text-muted small mb-2">Backend Developer</span>
                            <div class="nim-text">NIM: 0110224205</div>
                        </div>

                        <div class="flip-card-back bg-backend">
                            <h4 class="fw-bold mb-3"><i class="bi bi-database"></i> Tugas Backend</h4>
                            <ul class="list-unstyled text-start w-100 px-4">
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Logic Keranjang</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="images/Feby.jpeg" class="profile-img" alt="Foto Anggota">
                            
                            <h4 class="fw-bold m-0">Febi Febriani</h4>
                            <span class="text-muted small mb-2">Frontend</span>
                            <div class="nim-text">NIM: 0110224240</div>
                        </div>

                        <div class="flip-card-back bg-backend">
                            <h4 class="fw-bold mb-3"><i class="bi bi-database"></i> Tugas Frontend</h4>
                            <ul class="list-unstyled text-start w-100 px-4">
                                <li class="mb-2"><i class="bi bi-check2-square"></i> Daftar Menu Page</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> </div> <footer class="text-center py-4 mt-5 text-muted">
        <small>&copy; Designed & Developed by Group 9 & I_D.</small>
    </footer>

</body>
</html>