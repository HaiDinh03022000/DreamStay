<%-- 
    Document   : rooms
    Created on : May 20, 2023, 1:05:52 PM
    Author     : win
--%>
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
        <title>Dream Stay</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!-- Breadcrumb Section Begin -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <h2>Our Rooms</h2>
                            <div class="bt-option">
                                <a href="./home.jsp">Home</a>
                                <span>Rooms</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section End -->

        <!-- Rooms Section Begin -->
        <section class="rooms-section spad">
            <div class="container">
                <div class="row">
                    <c:forEach items="${listM}" var="i">

                        <div class="col-lg-4 col-md-6">
                            <div class="room-item">
                                <img src="${i.image1}" alt="">
                                <div class="ri-text">
                                    <h4>${i.name}</h4>
                                    <h3>${i.price}<span>/Room</span></h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">District:</td>
                                                <td>${i.district}</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Address:</td>
                                                <td>${i.address}</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                    <a href="roomdetail?mid=${i.mid}" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!--                <div class="col-lg-4 col-md-6">
                                        <div class="room-item">
                                            <img src="img/room/room-2.jpg" alt="">
                                            <div class="ri-text">
                                                <h4>Deluxe Room</h4>
                                                <h3>159$<span>/Pernight</span></h3>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Size:</td>
                                                            <td>30 ft</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Capacity:</td>
                                                            <td>Max persion 5</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Bed:</td>
                                                            <td>King Beds</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Services:</td>
                                                            <td>Wifi, Television, Bathroom,...</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="#" class="primary-btn">More Details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="room-item">
                                            <img src="img/room/room-3.jpg" alt="">
                                            <div class="ri-text">
                                                <h4>Double Room</h4>
                                                <h3>159$<span>/Pernight</span></h3>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Size:</td>
                                                            <td>30 ft</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Capacity:</td>
                                                            <td>Max persion 2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Bed:</td>
                                                            <td>King Beds</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Services:</td>
                                                            <td>Wifi, Television, Bathroom,...</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="#" class="primary-btn">More Details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="room-item">
                                            <img src="img/room/room-4.jpg" alt="">
                                            <div class="ri-text">
                                                <h4>Luxury Room</h4>
                                                <h3>159$<span>/Pernight</span></h3>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Size:</td>
                                                            <td>30 ft</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Capacity:</td>
                                                            <td>Max persion 1</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Bed:</td>
                                                            <td>King Beds</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Services:</td>
                                                            <td>Wifi, Television, Bathroom,...</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="#" class="primary-btn">More Details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="room-item">
                                            <img src="img/room/room-5.jpg" alt="">
                                            <div class="ri-text">
                                                <h4>Room With View</h4>
                                                <h3>159$<span>/Pernight</span></h3>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Size:</td>
                                                            <td>30 ft</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Capacity:</td>
                                                            <td>Max persion 1</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Bed:</td>
                                                            <td>King Beds</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Services:</td>
                                                            <td>Wifi, Television, Bathroom,...</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="#" class="primary-btn">More Details</a>
                                            </div>
                                        </div>
                                    </div>-->
                    <!--                <div class="col-lg-4 col-md-6">
                                        <div class="room-item">
                                            <img src="img/room/room-6.jpg" alt="">
                                            <div class="ri-text">
                                                <h4>Small View</h4>
                                                <h3>159$<span>/Pernight</span></h3>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="r-o">Size:</td>
                                                            <td>30 ft</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Capacity:</td>
                                                            <td>Max persion 2</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Bed:</td>
                                                            <td>King Beds</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="r-o">Services:</td>
                                                            <td>Wifi, Television, Bathroom,...</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <a href="#" class="primary-btn">More Details</a>
                                            </div>
                                        </div>
                                    </div>-->
                    <div class="col-lg-12">
                        <div class="room-pagination">
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Rooms Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer Section End -->


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
