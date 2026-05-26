<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.io.File,java.util.Map,java.util.LinkedHashMap,java.util.List,java.util.ArrayList" %>
<%
    // Map to store Year -> List of Image File Names
    Map<Integer, List<String>> memoriesMap = new LinkedHashMap<>();
    String memoriesPath = application.getRealPath("/assets/memories");
    
    if (memoriesPath != null) {
        for (int year = 2026; year >= 2011; year--) {
            File yearFolder = new File(memoriesPath, String.valueOf(year));
            if (yearFolder.exists() && yearFolder.isDirectory()) {
                File[] files = yearFolder.listFiles((dir, name) -> {
                    String lower = name.toLowerCase();
                    return lower.endsWith(".jpg") || lower.endsWith(".jpeg") || lower.endsWith(".png");
                });
                
                if (files != null && files.length > 0) {
                    List<String> imageList = new ArrayList<>();
                    for (File f : files) {
                        imageList.add(f.getName());
                    }
                    memoriesMap.put(year, imageList);
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Memories - Golden Star Club</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="icon" type="image/png" href="assets/images/logo.png">
    <link rel="stylesheet" href="assets/css/style.css?v=20260524-logo-fix">
</head>
<body>
    
    <!-- Header Banner -->
    <section class="py-5 bg-dark-blue text-center" style="padding-top: 100px !important;">
        <div class="container fade-in-section">
            <h1 class="text-light">Saraswati Puja <span class="gold-text">Memories</span></h1>
            <div class="heading-underline mx-auto mt-3 mb-4"></div>
            <p class="text-light">A visual journey of our devotion and celebration over the years.</p>
            <a href="index.jsp" class="btn btn-outline-light mt-3"><i class="fas fa-arrow-left me-2"></i>Back to Home</a>
        </div>
    </section>

    <!-- Dynamic Year-wise Gallery Section -->
    <section class="py-5 bg-light-blue">
        <div class="container">
            
            <!-- Check if there are memories -->
            <% if (memoriesMap.isEmpty()) { %>
                <div class="text-center text-light mt-5">
                    <h4><i class="fas fa-images gold-text mb-3"></i><br>New memories are being uploaded. Check back soon!</h4>
                </div>
            <% } else { %>

                <!-- Iterate through each Year -->
                <% for (Map.Entry<Integer, List<String>> entry : memoriesMap.entrySet()) { 
                    int year = entry.getKey();
                    List<String> images = entry.getValue();
                %>
                    <div class="row justify-content-center fade-in-section">
                        <div class="col-lg-10">
                            <div class="memory-card text-center">
                                <h2 class="year-title"><%= year %> Celebration</h2>
                                
                                <!-- Bootstrap Image Slider for this Year -->
                                <div id="carousel-<%= year %>" class="carousel slide carousel-fade shadow-lg rounded" data-bs-ride="carousel">
                                    <div class="carousel-inner rounded">
                                        <% for (int i = 0; i < images.size(); i++) { 
                                            String imgName = images.get(i);
                                            String activeClass = (i == 0) ? "active" : "";
                                        %>
                                            <div class="carousel-item <%= activeClass %>">
                                                <img src="assets/memories/<%= year %>/<%= java.net.URLEncoder.encode(imgName, "UTF-8").replace("+", "%20") %>" 
                                                     class="d-block w-100 carousel-img-memories" alt="<%= year %> Memory" loading="lazy">
                                            </div>
                                        <% } %>
                                    </div>
                                    
                                    <!-- Carousel Controls -->
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel-<%= year %>" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carousel-<%= year %>" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } %>
        </div>
    </section>

    <!-- Scroll To Top Button -->
    <a href="#" id="scrollToTopBtn" class="scroll-to-top">
        <i class="fas fa-chevron-up"></i>
    </a>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.js?v=20260524-memories"></script>

</body>
</html>
