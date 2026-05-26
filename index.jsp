<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.io.File,java.net.URLEncoder,java.util.Arrays,java.util.Comparator"%>
<%!
    private String photoUrl(String fileName) throws java.io.UnsupportedEncodingException {
        return "assets/photos/" + URLEncoder.encode(fileName, "UTF-8").replace("+", "%20");
    }
%>
<%
    File photoDir = new File(application.getRealPath("/assets/photos"));
    File[] clubPhotos = photoDir.listFiles((dir, name) -> {
        String lowerName = name.toLowerCase();
        return lowerName.endsWith(".jpg") || lowerName.endsWith(".jpeg");
    });
    if (clubPhotos == null) {
        clubPhotos = new File[0];
    }
    Arrays.sort(clubPhotos, Comparator.comparing(File::getName, String.CASE_INSENSITIVE_ORDER));
    String firstPhotoUrl = clubPhotos.length > 0 ? photoUrl(clubPhotos[0].getName()) : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Golden Star Club</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="icon" type="image/png" href="assets/images/logo.png">
    <link rel="stylesheet" href="assets/css/style.css?v=20260526-member-social-gap">
</head>
<body>

    <!-- =========================
         HEADER SECTION (NAVBAR)
         ========================= -->
    <nav class="navbar navbar-expand-lg fixed-top" id="mainNavbar">
        <div class="container">
            <!-- Club Logo & Name -->
            <a class="navbar-brand d-flex align-items-center" href="#home">
                <span class="logo-frame" aria-hidden="true">
                    <img src="assets/images/logo.png" class="brand-logo" alt="">
                </span>
                <span class="brand-title">GOLDEN STAR CLUB</span>
            </a>
            
            <!-- Mobile Hamburger Menu -->
            <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa-solid fa-bars text-white"></i>
            </button>
            
            <!-- Navigation Links -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="#home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#members">Members</a></li>
                    <li class="nav-item"><a class="nav-link" href="memories.jsp">Memory</a></li>
                    <li class="nav-item"><a class="nav-link" href="#gallery">Gallery</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- =========================
         HOME SECTION (HERO)
         ========================= -->
    <section id="home" class="hero-section d-flex align-items-center justify-content-center text-center">
        <div class="overlay"></div> <!-- Dark overlay for readability -->
        <div class="container hero-content z-1">
            <h1 class="display-2 fw-bold mb-4 slide-in-down">Welcome to Golden Star Club</h1>
            <p class="lead mb-5 slide-in-up">Celebrating Saraswati Puja with Unity and Joy</p>
            <a href="#about" class="btn btn-gold btn-lg px-5 py-3 rounded-pill slide-in-up-delay">Explore Us</a>
        </div>
    </section>

    <!-- About Section (Scroll Target) -->
    <section id="about" class="py-5 bg-light-blue text-center text-white">
        <div class="container py-5">
            <h2 class="fw-bold mb-4 gold-text">About Our Club</h2>
            <p class="lead w-75 mx-auto">GOLDEN STAR CLUB is a cultural and community club based in Hatgacha Palpara, Kalna, Purba Bardhaman. Our journey began in 2013. Every year, we proudly organize Saraswati Puja with devotion, creativity, and unity, bringing people together to celebrate tradition and culture.<br><br>

Over the years, our club has become a symbol of friendship, teamwork, and memorable celebrations within our community. ✨</p>
        </div>
    </section>
    
    <!-- Members Section (Scroll Target) -->
    <section id="members" class="py-5 premium-members-section text-center text-white">
        <div class="container py-5">
            <div class="mb-5 fade-in-section">
                <h2 class="display-5 fw-bold mb-3 gold-text member-title">Club Members</h2>
                <div class="heading-underline mx-auto mb-4"></div>
                <p class="lead w-75 mx-auto text-light">Our club stands tall on the pillars of our hardworking and dedicated members who volunteer their time and energy to make every event a grand success.</p>
            </div>

            <div class="member-slider fade-in-section" aria-label="Golden Star Club members">
                <div class="member-slider-track">
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member1.jpg?v=20260525" alt="Member 1" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+1&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">SOUMEN PAL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/17pD2bfpzp/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/soumenpal03?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member2.jpg" alt="Member 2" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+2&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">RISHAV PAUL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1Cqfquwrnx/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/rishav_paul_0810?igsh=dDBuZG5iNjY1eWxm" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member4.jpg" alt="Member 3" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+3&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">SAHELI PAUL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1E9eNdi7jU/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/radiance_of_nature_saheli?igsh=MWsxNm8zejN5OGM5bA==" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member3.jpg" alt="Member 4" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+4&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">UDITA PAL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1Y1UucAvxR/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/blooms_of_nature_?igsh=MWVudTYyZmJkaWFlMw==" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member5.jpg" alt="Member 5" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+5&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">ADITYA PAL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1BDwscJY3b/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/adityapal9744?igsh=enM4NGJ2dGE4bXdy" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member6.jpg" alt="Member 6" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+6&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">SUBHAM KOLEY</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1CVaz6YRGu/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/subham_5_3_7?igsh=eXZuMGozdGhqZTZ6" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member7.jpg" alt="Member 7" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+7&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">DHIMAN PAUL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1DcP9dcoHS/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/the_pirates_of_caribbean?igsh=cGU4dzFkeGxkYm80" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member8.jpg" alt="Member 8" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+8&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">SOHINI PAUL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/1CaQfE9rw7/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/sohinipaul19?igsh=NDRmcDhvZ2lwdXc4" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member9.jpg" alt="Member 9" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+9&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">ANKANA PAL</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="#" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/ankana1947?igsh=MWMybTZmdDFhZDY1OQ==" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-slide">
                        <div class="member-card">
                            <div class="member-img-wrapper">
                                <img src="assets/images/member10.jpg" alt="Member 10" class="member-img" loading="lazy" onerror="this.src='https://ui-avatars.com/api/?name=Member+10&background=FFD700&color=0B1021&size=200'">
                            </div>
                            <h4 class="fw-bold gold-text mt-4 mb-1">SHWETA KOLEY</h4>
                            <p class="text-uppercase tracking-wide text-light mb-0 small fw-semibold">Member</p>
                            <div class="member-social">
                                <a href="https://www.facebook.com/share/18oDdEmESz/" target="_blank" class="member-social-icon fb-icon" aria-label="Facebook Profile"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="#" target="_blank" class="member-social-icon ig-icon" aria-label="Instagram Profile"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =========================
         COUNTDOWN SECTION
         ========================= -->
    <section id="countdown" class="countdown-section py-5 position-relative"<% if (!firstPhotoUrl.isEmpty()) { %> style="--memory-photo: url('<%= firstPhotoUrl %>');"<% } %>>
        <div class="container py-5 z-1 position-relative">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold text-white mb-3">Countdown to Saraswati Puja</h2>
                <div class="heading-underline mx-auto"></div>
            </div>
            
            <!-- Live Timer Cards -->
            <div class="row justify-content-center text-center" id="timer">
                <div class="col-6 col-md-3 mb-4">
                    <div class="countdown-card glass-panel">
                        <h3 id="days" class="display-4 fw-bold gold-text mb-0">00</h3>
                        <p class="text-uppercase text-white mb-0 mt-2">Days</p>
                    </div>
                </div>
                <div class="col-6 col-md-3 mb-4">
                    <div class="countdown-card glass-panel">
                        <h3 id="hours" class="display-4 fw-bold gold-text mb-0">00</h3>
                        <p class="text-uppercase text-white mb-0 mt-2">Hours</p>
                    </div>
                </div>
                <div class="col-6 col-md-3 mb-4">
                    <div class="countdown-card glass-panel">
                        <h3 id="minutes" class="display-4 fw-bold gold-text mb-0">00</h3>
                        <p class="text-uppercase text-white mb-0 mt-2">Minutes</p>
                    </div>
                </div>
                <div class="col-6 col-md-3 mb-4">
                    <div class="countdown-card glass-panel">
                        <h3 id="seconds" class="display-4 fw-bold gold-text mb-0">00</h3>
                        <p class="text-uppercase text-white mb-0 mt-2">Seconds</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =========================
         IMAGE SLIDER SECTION
         ========================= -->
    <section id="gallery" class="py-5 bg-dark-blue fade-in-section">
        <div class="container text-center py-5">
            <h2 class="mb-4 text-light"><span class="gold-text">Our Golden Moments</span></h2>
            <div class="heading-underline mx-auto mb-5"></div>
            
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="memory-card p-4 mb-4">
                        <!-- Bootstrap Carousel -->
                        <div id="clubCarousel" class="carousel slide carousel-fade shadow-lg rounded overflow-hidden" data-bs-ride="carousel">
                            <div class="carousel-inner rounded">
                                <% if (clubPhotos.length > 0) { %>
                                    <% for (int i = 0; i < clubPhotos.length; i++) {
                                        String imageUrl = photoUrl(clubPhotos[i].getName());
                                    %>
                                        <div class="carousel-item <%= i == 0 ? "active" : "" %>" data-bs-interval="3000">
                                            <img src="<%= imageUrl %>" class="d-block w-100 carousel-img-memories" alt="Golden Star Club memory <%= i + 1 %>">
                                        </div>
                                    <% } %>
                                <% } else { %>
                                    <div class="carousel-item active">
                                        <div class="gallery-empty d-flex align-items-center justify-content-center">
                                            <p class="mb-0">Add JPG photos in assets/photos</p>
                                        </div>
                                    </div>
                                <% } %>
                            </div>
                            
                            <!-- Controls -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#clubCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#clubCarousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <a href="memories.jsp" class="btn gold-gradient-btn">
                    View All Memories <i class="fa-solid fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- =========================
         FOOTER SECTION
         ========================= -->
    <footer id="contact" class="footer pt-5 text-white bg-dark-footer text-center">
        <div class="container pt-4">
            
            <div class="row gy-4 justify-content-center">
                <!-- Club Info -->
                <div class="col-lg-4 col-md-6">
                    <h4 class="gold-text mb-4 fw-bold"><i class="fa-solid fa-star me-2"></i> Golden Star Club</h4>
                    <p class="text-light">A premier club dedicated to cultural celebration, unity, and social harmony. Join us in making memories.</p>
                    <div class="social-links mt-4">
                        <a href="https://www.facebook.com/share/1Kd3nxAmFS/" class="social-icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="https://www.instagram.com/goldenstarclub2013?igsh=ZWtxeWhhNW5oYmRn" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
                       
                    </div>
                </div>
                
                <!-- Quick Links -->
                
                
                <!-- Contact Info -->
                <div class="col-lg-3 col-md-6">
                    <h5 class="gold-text text-uppercase mb-4 fw-bold">Contact Info</h5>
                    <ul class="list-unstyled footer-contact text-light">
                        <li class="mb-3"><i class="fa-solid fa-location-dot me-3 gold-text"></i> Hatgacha(palpara), Kalna, Purba Bardhaman, 712146 </li>
                        <li class="mb-3"><i class="fa-solid fa-phone me-3 gold-text"></i> +91 7074980053</li>
                        <li class="mb-3"><i class="fa-solid fa-envelope me-3 gold-text"></i> info@goldenstarclub.com</li>
                    </ul>
                </div>
                
                

                <!-- Feedback Form Include -->
                <jsp:include page="feedback-form.jsp" />
            </div>
            
            <hr class="mt-5 mb-4 border-secondary">
            
            <!-- Centered Logo Top Box -->
           <br> <div class="d-flex justify-content-center mb-5">
                <span class="logo-frame shadow-lg" aria-hidden="true" style="width: 90px; height: 90px; flex-basis: 90px;">
                    <img src="assets/images/logo.png" class="brand-logo" style="max-width: 90px; max-height: 90px;" alt="Golden Star Club">
                </span>
            </div>
            <!-- Bottom Line -->
            <div class="row text-center py-3">
                <div class="col-12">
                     <p class="mb-0 gold-text fw-bold">Developed by<h3><b>SOUMEN PAL</b></p></h3>  email: soumenp050175@gmail.com</p>
                     <div class="footer-profile-links mt-3 justify-content-center">
                        <a href="https://www.facebook.com/share/1THh5tAwDd/" target="_blank" rel="noopener noreferrer">
                            <i class="fa-brands fa-facebook-f"></i>
                            <span>facebook</span>
                        </a>
                        <a href="https://www.instagram.com/soumenpal03?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==" target="_blank" rel="noopener noreferrer">
                            <i class="fa-brands fa-instagram"></i>
                            <span>instagram</span>
                        </a>
                        <p class="mb-0 text-light mt-4"> Thank You for visiting our Club <br> &copy; 2026 Golden Star Club. All Rights Reserved.</p> <br>
                     </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll To Top Button -->
    <a href="#" id="scrollToTopBtn" class="scroll-to-top">
        <i class="fa-solid fa-chevron-up"></i>
    </a>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom External JS -->
    <script src="assets/js/script.js?v=20260524-photos"></script>
</body>
</html>
