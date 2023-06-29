<%-- 
    Document   : index
    Created on : May 20, 2023, 1:04:03 PM
    Author     : win
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>DreamStay</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

        <!-- Css Styles -->

    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!-- Hero Section Begin -->
        <section class="hero-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero-text">
                            <h1>Dream Stay</h1>
                            <p>Here are the best Motel booking sites, including recommendations for accross Danang
                                and for finding low-priced Motel rooms.</p>
                            <a href="rooms" class="primary-btn">Discover Now</a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="hero-slider owl-carousel">
                <div class="hs-item set-bg" data-setbg="img/hero/caurong1.jpg"></div>

                <div class="hs-item set-bg" data-setbg="img/hero/danang1.jpg"></div>
                <div class="hs-item set-bg" data-setbg="img/hero/danang3.jpg"></div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- About Us Section Begin -->
        <section class="aboutus-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="about-text">
                            <div class="section-title">
                                <span>About Us</span>
                                <h2>DreamStay <br /></h2>
                            </div>
                            <p class="f-para">DreamStay in Vietnam, since 2018, is the ideal place for people seeking a comfortable and convenient stay. Whether you're looking for a short-term accommodation or a place to call home, we have you covered. As a trusted online accommodation provider, DreamStay offers a variety of options.</p>
                            <p class="s-para"> With our passion for travel, we aim to inspire and cater to millions of travelers like you.</p>
                            <a href="about-us.jsp" class="primary-btn about-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-pic">
                            <div class="row">
                                <div class="col-sm-6">
                                    <img src="img/about/about-1.jpg" alt="">
                                </div>
                                <div class="col-sm-6">
                                    <img src="img/about/about-2.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="services-section"></div>
        <!-- Services Section End -->

        <!-- Home Room Section Begin -->
        <section class="hp-room-section">
            <div class="container-fluid">
                <div class="hp-room-items">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <span style="font-size: 150%">Top 4</span>
                                <h2>Most popular Motel</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${listTop4M}" var="i">
                            <div class="col-lg-3 col-md-6">
                                <div class="hp-room-item set-bg" data-setbg="img/motelimg/${i.image1}">
                                    <div class="hr-text">
                                        <h3>${i.name}</h3>
<!--                                        <h2 class="number"><span>/Room</span></h2>-->
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="r-o">Review Score:</td>
                                                    <td><c:forEach begin="1" end="${i.rscore}">
                                                            <i class="icon_star text-warning"></i>
                                                        </c:forEach> (${i.rscore})</td>
                                                </tr>                                             
                                                <tr>
                                                    <td class="r-o">Address:</td>
                                                    <td>${i.address}</td>
                                                </tr>                                               
                                            </tbody>
                                        </table>
                                        <a href="roomdetail?mid=${i.mid}&check=1" class="primary-btn">More Details</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>
            </div>
        </section>
        <!-- Home Room Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Testimonials</span>
                            <h2>What Customers Say?</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="testimonial-slider owl-carousel">
                            <div class="ts-item">
                                <p>After a construction delay in our home, my husband, daughter, and I needed a place to stay in Vietnam for a few nights. We discovered DreamStay and it turned out to be the perfect option. The accommodations were comfortable, the service was excellent, and it made our unexpected stay in Vietnam truly enjoyable..</p>
                                <div class="ti-author">
                                    <div class="rating">
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star-half_alt"></i>
                                    </div>
                                    <h5> - Alexander Vasquez</h5>
                                </div>
                                <img src="img/testimonial-logo.png" alt="">
                            </div>
                            <div class="ts-item">
                                <p>After a construction project took longer than expected, my husband, my daughter and I
                                    needed a place to stay for a few nights. As a Chicago resident, we know a lot about our
                                    city, neighborhood and the types of housing options available and absolutely love our
                                    vacation at Sona Hotel.</p>
                                <div class="ti-author">
                                    <div class="rating">
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star-half_alt"></i>
                                    </div>
                                    <h5> - Alexander Vasquez</h5>
                                </div>
                                <img src="img/testimonial-logo.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Blog Section Begin -->


        <jsp:include page="footer.jsp"/>



        <!-- Js Plugins -->
        <script src="js/numberMoneyLoop.js" type="text/javascript"></script>
    </body>

</html>
