<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>DreamPayment</title>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <link href="css/payment3.css" rel="stylesheet" type="text/css"/>
        <link href="css/truncate.css" rel="stylesheet" type="text/css"/>

    </head>


    <body className="snippet-body">

        <a href="./index">
            <img style=" width: 200px;
                 margin-left: 20%" src="img/login1234.png" alt="">
        </a>


        <div class="container d-lg-flex justify-content-lg-center">
            <div class="box-1 bg-light user mr-2">
                <div class="d-flex align-items-center mb-3">
                    <img src="img/Avatar/${avatar}"
                         class="pic rounded-circle" alt="">
                    <p class="ps-2 name">${sessionScope.acc.user}</p>
                </div>
                <div class="box-inner-1 pb-3 mb-3 ">
                    <div class="d-flex justify-content-between mb-3 userdetails">
                        <p class="fw-bold">${motel.name}</p>
                    </div>
                    <div id="my" class="carousel slide carousel-fade img-details" data-bs-ride="carousel"
                         data-bs-interval="2000">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active"
                                    aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="img/motelimg/${detail.image1}"
                                     class="d-block w-100" >
                            </div>
                            <div class="carousel-item">
                                <img src="img/motelimg/${detail.image2}"
                                     class="d-block w-100 h-100">
                            </div>
                            <div class="carousel-item">
                                <img src="img/motelimg/${detail.image3}"
                                     class="d-block w-100">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#my" data-bs-slide="prev">
                            <div class="icon">
                                <span class="fas fa-arrow-left"></span>
                            </div>
                            <span class="visually-hidden">Previous</span>
                        </button>

                        <button class="carousel-control-next" type="button" data-bs-target="#my" data-bs-slide="next">
                            <div class="icon">
                                <span class="fas fa-arrow-right"></span>
                            </div>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <p class="description info my-3">${motel.description}
                    </p>
                    <button type="button" class="show-more-button btn btn-default">Show more</button>
                    <p class="fw-bold">Maybe you will like</p>
                    <div class="radiobtn">
                        <c:forEach items="${ran}" var="r">
                            <label class="box">                               
                                <div class="d-flex flex-column">
                                    <!--<div class="course">-->
                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <span class="fw-bold truncate">${r.name}</span>
                                    </div>
                                    <span class="truncate-3">${r.description}</span>
                                    <a href="roomdetail?mid=${r.mid}&check=1"> View</a>
                                    <!--</div>-->
                                </div>                                
                            </label>
                        </c:forEach>                   
                    </div>
                </div>
            </div>
            <div  class="box-2">
                <div class="box-inner-2 ml-2">
                    <div>
                        <p class="fw-bold">Payment Details</p>
                        <p class="dis mb-3">Complete your purchase by providing your payment details</p>
                    </div> 
                    <c:if test="${hide == null}">
                        <p class="dis fw-bold mb-2" style="color: ${color}">${messs}</p>
                        <div class="my-3 cardname d-flex">                 
                            <p class="dis fw-bold mb-2">How Long: </p>
                            <select class="dis fw-bold mb-2" name="month" onchange="calculateTotal(this.value)">
                                <option class="dis fw-bold mb-2" selected disabled>Choose Month</option>
                                <c:forEach begin="1" end="12" var="month">
                                    <option class="dis fw-bold mb-2" value="${month}">${month} Month</option>
                                </c:forEach>
                            </select><i class="dis fw-bold bi bi-calendar-check"></i>                             
                        </div>
                        <div class="address">
                            <div class="d-flex flex-column dis">
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <p>Service Fee</p>
                                    <p><span id="serviceFeeSpan" class="number"></span> VND</p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <p>VAT</p>
                                    <p><span id="vatSpan" class="number"></span> VND</p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <p class="fw-bold">Total</p>
                                    <p class="fw-bold"><span id="totalSpan" class="number"></span> VND</p>                                   
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="address">                     
                        <div class="d-flex flex-column dis">
                            <c:if test="${mess == null && color != 'green'}">
                                <form action="tranfervnpay" id="frmCreateOrder" method="post">
                                    <input data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." 
                                           id="amount" name="amount" type="hidden" value="">

                                    <input name="roomid" type="hidden" value="${detail.roomid}">
                                    <div class="address">
                                        <div class="d-flex flex-column dis">
                                            <button style="active {
                                                        background-color: yellow;
                                                    }" class="btn btn-primary mt-2">VNPay<i class="bi bi-credit-card-2-back"></i>                                   
                                            </button>    
                                        </div>
                                    </div>
                                </form>
                                <c:if test="${sessionScope.acc.payid != null}">
                                    <button style="active {
                                                background-color: yellow;
                                            }" 
                                            id="toggleButton3" onclick="toggleCard('cardContainer3', 'toggleButton3')" class="btn btn-primary mt-2">Pay Card
                                    </button>
                                </c:if>
                            </c:if>
                            <c:if test="${sessionScope.acc.payid == null}">
                                <a href="Loadinfo?type=3"style="active {
                                       background-color: yellow;
                                   }" class="btn btn-primary mt-2">Connect Credit Card</a>
                            </c:if>
                            <c:if test="${mess != null && color == 'green'}">
                                <a href="Loadinfo?type=5&show=1"style="active {
                                       background-color: yellow;
                                   }" class="btn btn-primary mt-2">View Your Order</a>
                            </c:if>
                        </div>
                    </div>
                    <div id="changeStatus"></div>
                    <form action="payment" method="post">
                        <c:if test="${mess == null}">
                            <c:set var="hish" value="none"/>
                        </c:if>
                        <c:if test="${mess != null}">
                            <c:set var="hish" value="block"/>
                        </c:if>
                        <c:if test="${sessionScope.acc.payid != null}">
                            <div id="cardContainer3" style="display: ${hish}">
                                <div class="mb-3">
                                    <p class="dis fw-bold mb-2">Email address</p>
                                    <input name="email" class="form-control" type="email" value="${listinfo.email}" readonly="">
                                </div>
                                <p class="dis fw-bold mb-2">Card details</p>
                                <p class="form-label" style="color: ${color}">${mess}</p>

                                <div class="d-flex align-items-center justify-content-between card-atm border rounded">
                                    <div class="far fa-credit-card ps-3"></div>
                                    <input name="numcard" type="text" id="number" value="${card.numcard}" class="form-control" maxlength="19" placeholder="Card details" onkeyup="formatCardNumber()"  readonly="">
                                    <div class="d-flex w-50">
                                        <input name="rdate"  type="text" id="expiration" class="form-control px-0" value="${card.releasedate}" placeholder="MM/YY"  readonly="">

                                        <input name="pincode" type="password" maxlength=6 class="form-control px-0" value="${pincode}" ${lock} placeholder="  PIN">
                                    </div>
                                </div>
                                <div class="my-3 cardname">
                                    <p class="dis fw-bold mb-2">Cardholder name</p>
                                    <input value="${card.fullname}" class="form-control" type="text"  readonly="">  
                                    <input name="total" type="hidden" value="">
                                    <input name="roomid" type="hidden" value="${detail.roomid}">
                                    <input name="condition" type="hidden" value="${condition}">
                                    <input name="bid" type="hidden" value="${bid}">
                                </div>
                                <div class="my-3 cardname">
                                    <p class="dis fw-bold mb-2">Message</p>
                                    <textarea class="form-control" name="text" rows="2" cols="10" ${lock} >${text}</textarea>                             
                                </div>
                                <div class="address">
                                    <div class="d-flex flex-column dis">
                                        <c:if test="${sessionScope.acc.payid != null && pincode == null}">
                                            <button style="active {
                                                        background-color: yellow;
                                                    }" class="btn btn-primary mt-2">Pay<span class="fas fa-dollar-sign px-1"></span>
                                            </button>
                                        </c:if> 
                                    </div>
                                </div>
                            </div>                       
                        </c:if>                         
                    </form>                       
                </div>
            </div>
        </div> 
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js'></script>   
        <script src="js/show-more.js" type="text/javascript"></script>
        <script>
                                        var detailPrice = ${detail.price};
        </script>
        <script src="js/pment.js" type="text/javascript"></script>
        <script src="js/vnpay.js" type="text/javascript"></script>
        <script src="js/HideShow.js" type="text/javascript"></script>
    </body>
</html>