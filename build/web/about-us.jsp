<%-- 
    Document   : about-us
    Created on : May 20, 2023, 1:05:34 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sona | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!-- Breadcrumb Section Begin -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <h2>About Us</h2>
                            <div class="bt-option">
                                <a href="./index.jsp">Home</a>
                                <span>About Us</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section End -->

        <!-- About Us Page Section Begin -->
        <section class="aboutus-page-section spad">
            <div class="container">
                <div class="about-page-text">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="ap-title">
                                <h2>Welcome To DreamStay.</h2>
                                <p>
                                    Welcome to DreamStay in Vietnam. Established in 2018, this motel is situated in the heart of Vietnam. Our motel offers beautifully adorned rooms, designed with utmost care and attention to detail.</p>
                            </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                            <ul class="ap-services">
                                <li><i class="icon_check"></i> Many Variant of choice.</li>
                                <li><i class="icon_check"></i> Fully automatic process</li>
                                
                                <li><i class="icon_check"></i> Refund in one days problem.</li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="about-page-services">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="ap-service-item set-bg" data-setbg="img/about/about-p1.jpg">
                                <div class="api-text">
                                    <h3>Restaurants Services</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ap-service-item set-bg" data-setbg="img/about/about-p2.jpg">
                                <div class="api-text">
                                    <h3>Travel & Camping</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ap-service-item set-bg" data-setbg="img/about/about-p3.jpg">
                                <div class="api-text">
                                    <h3>Event & Party</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Us Page Section End -->

        <!-- Video Section Begin -->
        
        <!-- Video Section End -->

        <!-- Gallery Section Begin -->
        <section class="gallery-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Our Gallery</span>
                            <h2>Discover Our Work</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="gallery-item set-bg" data-setbg="img/gallery/gallery-1.jpg">
                            <div class="gi-text">
                                <h3>Room Luxury</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="gallery-item set-bg" data-setbg="img/gallery/gallery-3.jpg">
                                    <div class="gi-text">
                                        <h3>Room Luxury</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="gallery-item set-bg" data-setbg="img/gallery/gallery-4.jpg">
                                    <div class="gi-text">
                                        <h3>Room Luxury</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="gallery-item large-item set-bg" data-setbg="img/gallery/gallery-2.jpg">
                            <div class="gi-text">
                                <h3>Room Luxury</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Gallery Section End -->

        <jsp:include page="footer.jsp"/>



        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
