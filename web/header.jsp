<%-- 
    Document   : header
    Created on : May 21, 2023, 9:33:07 AM
    Author     : win
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
        <link href="css/style-header-1.css" rel="stylesheet" type="text/css"/>
        <link href="css/note.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/cdatetime.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Section Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="canvas-open">
            <i class="icon_menu"></i>
        </div>
        <div class="offcanvas-menu-wrapper">
            <div class="canvas-close">
                <i class="icon_close"></i>
            </div>
            <div class="search-icon search-switch">
                <i class="icon_search"></i>
            </div>
            <div class="header-configure-area">
                <div class="language-option">
                    <a class="mt-2" href="login.jsp"><i class="bi bi-person-circle text-black-50 pr-2 fs-2"></i></a>
                </div>
                <a href="rooms" class="bk-btn">Booking Now</a>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li class="active"><a href="./index">Home</a></li>
                    <li><a href="rooms">Rooms</a></li>
                    <li><a href="./about-us.jsp">About Us</a></li>
                    <li><a href="./pages.jsp">Pages</a>
                        <ul class="dropdown">
                            <li><a href="./room-details.jsp">Room Details</a></li>
                            <li><a href="./blog-details.jsp">Blog Details</a></li>
                            <li><a href="#">Family Room</a></li>
                            <li><a href="#">Premium Room</a></li>
                        </ul>
                    <li><a href="./contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="top-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <ul class="top-widget">
                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
            </ul>
        </div>
        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <header class="header-section header-normal">
            <div class="top-nav">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <ul class="tn-left ">
                                <li><i class="fa fa-phone"></i> (+84) 345 67890</li>
                                <li><i class="fa fa-envelope"></i> DreamStay@gmail.com</li>
                                    <c:if test="${sessionScope.acc != null}">
                                    <li><a href="Loadinfo" style="color: black"><i class="fa fa-user-circle"></i> ${sessionScope.acc.user}</a></li>     
                                    </c:if>
                                    <c:if test="${sessionScope.acc.accType == 1}">
                                    <li><a href="listdone" style="color: black"><i class="bi bi-building-fill-gear"></i>Motel</a></li>     
                                    </c:if>
                                    <c:if test="${sessionScope.acc.accId == 1}">
                                    <li><a href="getincomeadmin" style="color: black"><i class="bi bi-kanban"></i>Manage Admin</a></li>     
                                    </c:if>
                            </ul>
                        </div>
                        <div class="col-lg-4">
                            <div class="tn-right">
                                <div class="top-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>                                  
                                </div>
                                <a href="rooms" class="bk-btn">Booking Now</a>
                                <div class="language-option">
                                    <c:if test="${sessionScope.acc != null}">
                                        <a href="Logout" style="color: black"><i class="bi bi-box-arrow-right text-black-50"></i> Logout</a>     
                                    </c:if>
                                    <c:if test="${sessionScope.acc == null}">
                                        <a href="login.jsp" style="color: black"><i class="bi bi-person-circle text-black-50"></i>Login</a>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="./index">
                                    <img style="" src="img/login1234.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="nav-menu">
                                <nav class="mainmenu">
                                    <ul>
                                        <li><a href="index">Home</a></li>
                                        <li><a href="rooms">Rooms</a></li>
                                        <li><a href="./about-us.jsp">About Us</a></li>
                                        <li><a href="./contact.jsp">Contact</a></li>
                                            <c:if test="${sessionScope.acc != null}"> 
                                                <c:if test="${sessionScope.acc.accType == 1}"> <c:set var="type" scope="session" value="owner"/> </c:if>
                                                <c:if test="${sessionScope.acc.accType == 0}"> <c:set var="type" scope="session" value="Loadinfo?type=4"/> </c:if>
                                            <li id="notificationBell"><a href="<c:out value="${type}"/>"><i class="bi bi-bell-fill"></i>
                                                    <c:forEach items="${sessionScope.listnt}" var="i">
                                                        <c:if test="${!flag && i.seen == 0}">
                                                            <span class="notifi">...</span>
                                                            <c:set var="flag" value="true" />
                                                        </c:if>                             
                                                    </c:forEach></a>
                                                <ul class="dropdown">
                                                    <c:forEach items="${sessionScope.listnt}" var="i">
                                                        <li >   
                                                            <img src="img/Avatar/${i.avatar}">
                                                            <div>                                                               
                                                                <strong>${i.username}</strong>
                                                                <c:if test="${fn:contains(i.textarea, '%')}">
                                                                    <c:set var="sub" value="${fn:substringBefore(i.textarea, '%')}" />${sub}<br>
                                                                </c:if>
                                                                <c:if test="${!fn:contains(i.textarea, '%')}">
                                                                    ${i.textarea}
                                                                </c:if>
                                                                <p class="dateup"><span id="duration-${i.nftid}">${i.dateup}</span></p>
                                                            </div>
                                                        </li>                                                      
                                                        <script>
                                                            calculateDuration("${i.dateup}", "duration-${i.nftid}");
                                                        </script>
                                                    </c:forEach>
                                                </ul>

                                            </li>                                           
                                        </c:if>

                                    </ul>
                                </nav>
                                <div class="nav-right search-switch">
                                    <i class="icon_search"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header End -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form action="search" method="post" class="search-model-form">
                    <input value="${textS}" type="text" name="text" id="search-input" placeholder="Search here.....">

                </form>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/mainlogin.js" type="text/javascript"></script>
        <script src="js/readNoti.js" type="text/javascript"></script>
    </body>
</html>
