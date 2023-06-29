<%-- 
    Document   : rooms
    Created on : May 20, 2023, 1:05:52 PM
    Author     : win
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="css/search.css" rel="stylesheet" type="text/css"/>
        <link href="css/truncate.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <section>
            <c:set var="page" value="${param.page}"/>
            <c:set var="psize" value="6"/>
            <c:if test="${page == null}">
                <c:set var="page" value="1"/>     
            </c:if>         
        </section>
        <jsp:include page="header.jsp"/>
        <form id="frm-search-job" method="GET" action="searchmultifield" ">
            <div class="group-search" >
                <div class="item ">

                    <span class="title"><i class="bi bi-geo-alt"></i>All Districts</span>
                    <select name="district" id="address"  class="form-control" tabindex="-1" aria-hidden="true" required placholder="Vui lòng nhập Quận">
                        <option value="0">District</option>
                        <option ${address == "Hải Châu" ? selected :""} value="Hải Châu">Hải Châu</option>
                        <option ${address == "Ngũ Hành Sơn" ? selected :""} value="Ngũ Hành Sơn">Ngũ Hành Sơn</option>
                        <option ${address == "Sơn Trà" ? selected :""} value="Sơn Trà">Sơn Trà</option>
                        <option ${address == "Cẩm Lệ" ? selected :""} value="Cẩm Lệ">Cẩm Lệ</option>
                        <option ${address == "Liên Chiểu" ? selected :""} value="Liên Chiểu">Liên Chiểu</option>
                    </select>
                </div>
                <div class="item">
                    <span class="title"><i class="bi bi-coin"></i>All Prices</span>
                    <select name="price" id="price" class="form-control"   required placholder="Vui lòng nhập Giá">
                        <option value="0">Giá</option>
                        <option ${price == "1000000" ? selected :""} value="1000000">Less Than 1.M</option>
                        <option ${price == "2000000" ? selected :""} value="2000000">1.M - 2.M</option>
                        <option ${price == "3000000" ? selected :""} value="3000000">2.M - 3.M</option>
                        <option ${price == "4000000" ? selected :""} value="4000000">3tr - 4tr</option>
                        <option ${price == "5000000" ? selected :""} value="5000000">More Than 4.M</option>
                    </select>
                </div>
                <div class="item">
                    <span class="title"><i class="bi bi-houses"></i>All Type Rooms</span>
                    <select name="category" id="salary-advanced" class="form-control" tabindex="-1" aria-hidden="true" required placholder="Vui lòng nhập loại phòng">
                        <option value="0">Room</option>
                        <c:forEach items="${listCate}" var="i">                      
                        <option ${category == i.cateid ? selected :""} value="${i.cateid}">${i.catename}</option>                       
                        </c:forEach>
                    </select>

                </div>

                <div class="button">
                    <p hidden="">a</p>
                    <button class="btn btn-topcv btn-search-job" style="background-color: #dfa974; color: #fff;">Search</button>
                </div>
            </div>
        </form>

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
                    <c:forEach items="${listM}" var="i"  begin="${(page-1)*psize}" end="${page*psize-1}" >

                        <div class="col-lg-4 col-md-6 ">
                            <div class="room-item rounded">
                                <img style="height: 300px;object-fit: cover;" src="img/motelimg/${i.image1}" alt="">
                                <div class="ri-text">
                                    <h4 class="truncate-2">${i.name}</h4>
                                    <h3 >
                                        <c:if test="${i.price < 100000.0}">
                                            Less Than 1.M
                                        </c:if>
                                        <c:if test="${i.price >= 1000000.0 && i.price < 2000000.0}">
                                            1.M - 2.M
                                        </c:if>
                                        <c:if test="${i.price >= 2000000.0 && i.price < 3000000.0}">
                                            2.M - 3.M
                                        </c:if>
                                        <c:if test="${i.price >= 3000000.0 && i.price < 4000000.0}">
                                            3.M - 4.M
                                        </c:if>
                                        <c:if test="${i.price >= 4000000.0}">
                                            More Than 4.M
                                        </c:if>
                                        <span>/Room</span>
                                    </h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Review Score:</td>
                                                <td>
                                                    <c:if test="${i.rscore == 0}">
                                                        <c:forEach begin="1" end="5">
                                                            <i class="icon_star text-warning"></i>
                                                        </c:forEach> (5.0)
                                                    </c:if>
                                                    <c:if test="${i.rscore != 0}">
                                                        <c:forEach begin="1" end="${i.rscore}">
                                                            <i class="icon_star text-warning"></i>
                                                        </c:forEach> (${i.rscore})
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Address:</td>
                                                <td class="truncate">${i.address}</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <a href="roomdetail?mid=${i.mid}&check=1" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                    <!--                    <div class="col-lg-12">
                                            <div class="room-pagination">
                                                <a href="#">1</a>
                                                <a href="#">2</a>
                                                <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                                            </div>
                                        </div>-->
                    <div class="room-pagination">
                        <c:if test="${page > 2}">
                            <a href="rooms?page=<fmt:formatNumber value="1"/>"><i class="fa fa-angle-double-left"></i></a>
                            </c:if>
                            <c:if test="${page != 1}">
                            <a href="rooms?page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><i class="bi bi-arrow-left-short"></i></a>           
                            </c:if>
                        <a class="active" href="rooms?page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>
                        <c:set var="nextPage" value="${page + 1}" />
                        <c:if test="${nextPage > Math.ceil(listM.size() / psize)}">
                            <c:set var="nextPage" value="${page}" />
                        </c:if>
                        <c:if test="${page < (listM.size() / psize)}">
                            <a href="rooms?page=<fmt:formatNumber value="${nextPage}" type="number"/>"><i class="bi bi-arrow-right-short"></i></a>
                            </c:if>
                            <c:if test="${page < (Math.floor( listM.size() / psize))}">
                            <a href="rooms?page=<fmt:formatNumber value="${(listM.size() % psize == 0) ? (listM.size() / psize) : (Math.floor( listM.size() / psize) + 1)}" 
                                              type="number" />"> <i class="fa fa-angle-double-right"></i></a>
                            </c:if>
                    </div>
                </div>
            </div>
        </section>
        <!-- Rooms Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer Section End -->


        <!-- Js Plugins -->

        <script src="js/numberMoneyLoop.js" type="text/javascript"></script>
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
