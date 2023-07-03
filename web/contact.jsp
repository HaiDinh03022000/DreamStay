

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
        <title>Template</title>

        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
        <link href="css/starcss.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!-- Contact Section Begin -->
        <section class="contact-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="contact-text">
                            <h2>Contact Info</h2>         
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="c-o">Address:</td>
                                        <td>Khu đô thị FPT City, Ngũ Hành Sơn, Da Nang 550000</td>
                                    </tr>
                                    <tr>
                                        <td class="c-o">Phone:</td>
                                        <td>09 345 67890</td>
                                    </tr>
                                    <tr>
                                        <td class="c-o">Email:</td>
                                        <td>DreamStay@gmail.com</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <c:if test="${sessionScope.acc != null}">
                        <div class="col-lg-7 offset-lg-1">
                            <form action="contactus" class="contact-form" method="post">
                                <p style="color: green">${mess}</p>
                                <div class="row"> 
                                    <div class="col-lg-12">
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
                                    <div class="col-lg-12">
                                        <textarea placeholder="Your Message" name="message"></textarea>
                                        <button type="submit">Submit Now</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.acc == null}">
                        <div class="col-lg-7 offset-lg-1">
                            <form action="#" class="contact-form">
                                <div class="row">    
                                    <div class="col-lg-12">

                                        <button type="submit"><a style="color: white" href="login.jsp">Login To contact us</a></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </div>
                <div class="map">
                    <iframe
                        src="https://maps.google.com/maps?width=600&amp;height=400&amp;hl=en&amp;q=FPT&amp;t=&amp;z=15&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"
                        height="470" style="border:0;" allowfullscreen=""></iframe>

                </div>
            </div>
        </section>
        <!-- Contact Section End -->

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
