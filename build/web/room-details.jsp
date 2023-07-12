<%-- 
   Document   : room-details
   Created on : May 20, 2023, 1:09:14 PM
   Author     : win
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/starcss.css" rel="stylesheet" type="text/css"/>
        <link href="css/changeroom.css" rel="stylesheet" type="text/css"/>
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

        <!-- Room Details Section Begin -->

        <section class="room-details-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="room-details-item">
                            <div class="carousel-container">
                                <img class="carousel-img    " src="img/motelimg/${room.image1}" alt="">
                                <img class="carousel-img" src="img/motelimg/${room.image2}" alt="">
                                <img class="carousel-img" src="img/motelimg/${room.image3}" alt="">
                                <button class="carousel-button carousel-button-left" onclick="previousImage()"><i class="bi bi-arrow-left-short"></i></button>
                                <button class="carousel-button carousel-button-right" onclick="nextImage()"><i class="bi bi-arrow-right-short"></i></button>
                            </div>
                            <div class="type">
                                <c:forEach items="${allid}" var="id">
                                    <a href="roomdetail?mid=${detail.mid}&roomid=${id.roomid}"
                                       class="${rid == id.roomid ? 'active' : ''}">${id.cateid}</a>
                                </c:forEach>
                            </div>
                            <div class="rd-text">
                                <div class="rd-title">
                                    <h3>${detail.name}</h3>
                                    <div class="rdt-right">
                                        <div class="rating">
                                            <c:forEach begin="1" end="${detail.rscore}">
                                                <i class="icon_star"></i>
                                            </c:forEach>
                                            <fmt:formatNumber var="rvs" value="${detail.rscore}" pattern="0.0" />
                                            (${rvs})
                                        </div>
                                        <c:if test="${sessionScope.acc != null && sessionScope.acc.accId != detail.accid}">
                                            <a href="booking?roomid=${room.roomid}">Booking Now</a>
                                        </c:if>
                                        <c:if test="${sessionScope.acc == null}">
                                            <a href="login.jsp">Login Now</a>
                                        </c:if> 
                                    </div>
                                </div>
                                <h3 id="number"> <span>${(room.price)}</span> VNĐ/Room</h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Address:</td>
                                            <td>${detail.address}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p class="f-para">${detail.description}</p>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Date Upload:</td>
                                            <td>${detail.dateupload}</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Map:</td>
                                            <td><a href="${detail.coordinates}"><i class="bi bi-map-fill text-dark"></i></a></td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                        <div class="rd-reviews">
                            <h4>Reviews</h4>
                            <c:forEach items="${review}" var="r">
                                <div class="review-item">
                                    <div class="ri-pic">
                                        <img src="img/Avatar/${r.avatar}" alt="error">
                                    </div>
                                    <div class="ri-text">
                                        <div class="rating">
                                            <c:forEach begin="1" end="${r.rscore}">
                                                <i class="icon_star"></i>
                                            </c:forEach>
                                        </div>
                                        <span id="duration-${r.rvid}">${r.dateup}</span>
                                        <h5>${r.username}</h5>
                                        <p>${r.comment}</p>
                                    </div>
                                    <script>
                                        calculateDuration("${r.dateup}", "duration-${r.rvid}");
                                    </script>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${sessionScope.acc.accId == checkrv && sessionScope.acc != null}">                
                            <div class="review-add">
                                <h4>Add Review</h4>
                                <form action="subreview" method="post" class="ra-form">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div>
                                                <h5>You Rating:</h5>
                                                <div class="rating">
                                                    <input value="5" type="radio" name="rate" id="rate-5">
                                                    <label for="rate-5" class="bi bi-star-fill"></label>
                                                    <input value="4" type="radio" name="rate" id="rate-4">
                                                    <label for="rate-4" class="bi bi-star-fill"></label>
                                                    <input value="3" type="radio" name="rate" id="rate-3">
                                                    <label for="rate-3" class="bi bi-star-fill"></label>
                                                    <input value="2" type="radio" name="rate" id="rate-2">
                                                    <label for="rate-2" class="bi bi-star-fill"></label>
                                                    <input value="1" type="radio" name="rate" id="rate-1">
                                                    <label  for="rate-1" class="bi bi-star-fill"></label>
                                                </div>
                                            </div>
                                            <textarea placeholder="Your Review" name="comment"></textarea>
                                            <input name="mid" type="text" style="display: none;" value ="${detail.mid}" readonly="" >
                                            <input name="roomid" type="text" style="display: none;" value ="${rid}" readonly="" >
                                            <button type="submit">Submit Now</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:if>           
                    </div>
<!--                    <div class="col-lg-4">
                        <div class="room-booking">
                            <h3>Your Reservation</h3>
                            <form action="#">
                                <div class="check-date">
                                    <label for="date-in">Check In:</label>
                                    <input type="text" class="date-input" id="date-in">
                                    <i class="icon_calendar"></i>
                                </div>
                                <div class="check-date">
                                    <label for="date-out">Check Out:</label>
                                    <input type="text" class="date-input" id="date-out">
                                    <i class="icon_calendar"></i>
                                </div>
                                <div class="select-option">
                                    <label for="guest">Room Type</label>
                                    <select id="guest" onchange="location = this.value;">
                                        <c:forEach items="${allid}" var="id">
                                            <option value="roomdetail?mid=${detail.mid}&roomid=${id.roomid}"">${id.cateid}</option>
                                        </c:forEach>
                                    </select>     
                                </div>
                                <div class="select-option">
                                    <label for="room">Room:</label>
                                    <select id="room">
                                        <option value="">1 Room</option>
                                    </select>
                                </div>
                                <button type="submit">Check Availability</button>
                            </form>
                        </div>
                    </div>-->
                </div>
            </div>
        </section>
        <!-- Room Details Section End -->

        <jsp:include page="footer.jsp"/>
        <!-- Js Plugins -->
        <script src="js/moneyNumber.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/moveimg.js" type="text/javascript"></script>
    </body>

</html>