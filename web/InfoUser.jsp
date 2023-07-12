<%-- 
    Document   : InfoUser
    Created on : May 26, 2023, 4:00:10 PM
    Author     : hatha
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Profile Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/infouser.css" rel="stylesheet" type="text/css"/>
        <link href="css/tableNoti.css" rel="stylesheet" type="text/css"/>
        <script src="js/HideShow.js" type="text/javascript"></script>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Account settings
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action ${aw1}" data-toggle="list" href="#account-general">General</a>
                            <a class="list-group-item list-group-item-action ${aw2}" data-toggle="list" href="#account-change-password">Change password</a>
                            <a class="list-group-item list-group-item-action ${aw3}" data-toggle="list" href="#account-connections">Connections</a>
                            <a class="list-group-item list-group-item-action ${aw4}" data-toggle="list" href="#account-notifications">Notifications</a>
                            <a class="list-group-item list-group-item-action ${aw5}" data-toggle="list" href="#account-orders">History Order</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade ${allow1}" id="account-general">
                                <form action="uavatar" method="post" enctype="multipart/form-data">
                                    <div class="card-body media align-items-center">

                                        <div class="media-body ml-4">
                                            <label class="btn btn-outline-primary">
                                                <div class="ri-pic">
                                                    <img  style="border-radius: 10px; width: 90px; height: 90px" src="img/Avatar/${listinfo.avatar}" alt="">
                                                </div>
                                                Load image
                                                <input type="file" name="avatar" class="account-settings-fileinput" accept="image/png, image/gif, image/jpeg" >                                                                        
                                            </label>&nbsp;
                                            <button type="submit" value="" class="btn btn-default md-btn-flat">Upload</button><br>
                                            <label class="form-label" style="color: ${color}">${error}</label>
                                        </div>
                                    </div>
                                </form>
                                <form method="post" action="Loadinfo">                                         
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-label">Username:</label>
                                            <input type="text" class="form-control mb-1" value="${sessionScope.acc.user}" readonly="">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Full Name:</label>
                                            <input type="text" name="fullname" class="form-control" value="${listinfo.fullname}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Address:</label>
                                            <input type="text" name="address" class="form-control" value="${listinfo.uAddress}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Number Phone:</label>
                                            <input type="text" name="phone" class="form-control" maxlength="11" value="${listinfo.phoneNum}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Year of Birth:</label>
                                            <input type="text" name="age" class="form-control" value="${listinfo.age}">
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <a href="Loadinfo"><button type="button" class="btn btn-default">Back</button></a>
                                    </div>
                                    <div style="padding-bottom: 1%"></div>
                                </form>
                            </div>
                            <div class="tab-pane fade ${allow2}" id="account-change-password">
                                <form action="changepass">
                                    <div class="card-body pb-2">
                                        <label class="form-label" style="color: ${color}">${mess}</label>
                                        <div class="form-group">
                                            <label class="form-label">Current password</label>
                                            <input type="password" class="form-control" name="cpass" value="${cpass}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input type="password" class="form-control" name="npass" value="${npass}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Repeat new password</label>
                                            <input type="password" class="form-control" name="rnpass" value="${rnpass}">
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <a href="Loadinfo"><button type="button" class="btn btn-default">Back</button></a>
                                    </div>
                                    <div style="padding-bottom: 1%"></div>
                                </form>
                            </div>
                            <div class="tab-pane fade ${allow3}" id="account-connections">
                                <form action="changemail">
                                    <div class="card-body">
                                        <label class="form-label"><strong>Email:</strong></label>
                                        <label class="form-label" style="color: ${color}">${messs}</label>                                       
                                        <input type="email" class="form-control" name="oldemail" value="${listinfo.email}" readonly="">
                                        <input type="email" class="form-control" name="email" value="${email}" placeholder="Enter Email you want to change">
                                        <c:if test="${sessionScope.otp != null}">
                                            <input type="text" class="form-control" name="otp" value="" placeholder="Enter OTP code in your old email to change Email">
                                        </c:if>
                                        <button type="submit" class="btn btn-twitter">Change <strong>Email</strong></button>
                                    </div>
                                </form>
                                <form action="connectPC">
                                    <hr class="border-light m-0">                  
                                    <div class="card-body">
                                        <label class="form-label"><strong>Credit Card:</strong></label>
                                        <label class="form-label" style="color: ${color}">${messss}</label>                                        
                                        <c:if test="${sessionScope.acc.payid == null}">
                                            <input type="text" id="numberInput" minlength="19" maxlength="19" class="form-control" name="paycard" value="${paycard}" placeholder="Enter Your Credit Card">
                                            <c:if test="${sessionScope.paycard != null}">
                                                <input type="text" class="form-control" name="fullname" value="${listPC.fullname}" placeholder="" readonly="">                                  
                                                <input type="password" class="form-control" maxlength="6" max="6" name="pincode" value="" placeholder="Enter your PinCode of Credit Card">                                                                          
                                            </c:if>
                                            <button type="submit" class="btn btn-facebook">Connect to <strong>Credit Card</strong></button>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.payid != null}">
                                            <input type="text" id="" class="form-control" name="numberInput" value="${listpc.numcard}" readonly="" placeholder="">
                                            <input type="text" id="numberInput" minlength="19" maxlength="19" class="form-control" name="paycard" value="${paycard}" placeholder="Enter Your Credit Card you want to change">
                                            <c:if test="${sessionScope.paycard != null}">
                                                <input type="text" class="form-control" name="fullname" value="${listPC.fullname}" placeholder="" readonly="">                                  
                                                <input type="password" class="form-control" maxlength="6" name="pincode" value="" placeholder="Enter your PinCode of Credit Card">                                                                          
                                            </c:if>
                                            <button type="submit" class="btn btn-facebook">Change <strong>Credit Card</strong></button>
                                        </c:if>
                                    </div>
                                </form>
                                <div class="text-right mt-3">
                                    <a href="Loadinfo"><button type="button" class="btn btn-default">Back</button></a>
                                </div>
                                <div style="padding-bottom: 1%"></div>
                            </div>
                            <div class="tab-pane fade ${allow4}" id="account-notifications">
                                <c:if test="${show == null}">
                                    <c:set var="his" value="none"/>
                                </c:if>
                                <c:if test="${show != null}">
                                    <c:set var="his" value="block"/>
                                </c:if>
                                <input type="hidden" name="check" value="4">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Activity</h6> 
                                    <c:if test="${sessionScope.acc.payid == null}">
                                        <span class="switcher-label">Apply to become Owner Motel:</span>
                                        <a href="Loadinfo?type=3">Link</a> Pay card to become Owner Motel
                                    </c:if>
                                    <c:if test="${sessionScope.acc.payid != null}">
                                        <div class="form-group">
                                            <c:if test="${pmess == null}">
                                                <c:set var="hi" value="none"/>
                                            </c:if>
                                            <c:if test="${pmess != null}">
                                                <c:set var="hi" value="block"/>
                                            </c:if>
                                            <label class="switcher">
                                                <span class="switcher-label">Apply to become Owner Motel,:</span>
                                                <button id="toggleButton3" onclick="toggleCard('cardContainer3', 'toggleButton3')" style="padding-bottom: 9px" type="button" class="btn btn-default"><i class="bi bi-building-add"></i></button>
                                            </label>
                                            <div id="cardContainer3" style="display: ${hi}">
                                                <label style="color: ${color}" class="form-label"><strong>${pmess}</strong></label><br>
                                                <label class="form-label"><strong>Fee sent message is 10,000 VNÐ</strong></label>                    
                                                        <c:if test="${sessionScope.acc.accType == 1}">
                                                    <label class="form-label"><strong>You are already an Owner Motel!</strong></label>
                                                    <label class="form-label">Monthly maintenance fee is 100,000 VNÐ</label>
                                                </c:if>
                                                <c:if test="${sessionScope.acc.accType != 1}">

                                                    <form id="myForm" action="becomeowner">       
                                                        <label class="form-label"><strong>Email:</strong></label>
                                                        <input type="text" name="email" class="form-control" value="">
                                                        <label class="form-label"><strong>Current Pass:</strong></label>
                                                        <input id="numberInput" type="password" name="pass" class="form-control" value="">
                                                        <c:if test="${sessionScope.acc.accType != 1}">
                                                            <div class="text-right mt-3">
                                                                <button type="submit" class="btn btn-primary">Submit</button>&nbsp;            
                                                            </div>
                                                        </c:if>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>                                                                                               
                                <div class="text-right mt-3">
                                    <a href="Loadinfo"><button type="button" class="btn btn-default">Back</button></a>
                                </div>
                                <div style="padding-bottom: 1%"></div>
                            </div>
                            <div class="tab-pane fade ${allow5}" id="account-orders">
                                <c:if test="${show == null}">
                                    <c:set var="his" value="none"/>
                                </c:if>
                                <c:if test="${show != null}">
                                    <c:set var="his" value="block"/>
                                </c:if>
                                <input type="hidden" name="check" value="4">
                                <div class="card-body pb-2">
                                    <div class="d-flex align-items-center">
                                        <h6 class="">Bill: </h6>
                                        <button id="toggleButton4" onclick="toggleCard('cardContainer4', 'toggleButton4')" class="btn btn-default">Hide</button>
                                    </div>
                                    <div id="cardContainer4" class="text-right mt-3" style="display: ${his}">
                                        <table class="custom-table" border="1">
                                            <thead>
                                                <tr>
                                                    <th>Comment</th>
                                                    <th>Status</th>
                                                    <th>Money/Month</th>
                                                    <th>Time</th>
                                                    <th class="smaller">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${bill}" var="i">
                                                    <tr>
                                                        <td>${i.description}</td>
                                                        <td >
                                                            <c:if test="${i.condition == 1}">
                                                                <span style="background-color: #00cc00; border-radius: 5px;padding: 5px; color: white">Shelf</span>
                                                            </c:if>
                                                            <c:if test="${i.condition == 0}">
                                                                <span style="background-color: red; border-radius: 5px;padding: 5px; color: white">Expired</span>
                                                            </c:if>
                                                        </td>                                                
                                                        <td><span class="number">${i.price}</span> VNÐ</td>
                                                        <td><span id="uration-${i.billid}">${i.datedue}</span></td>
                                                        <td class="smaller">
                                                            <input type="hidden" name="condition" value="${i.condition}">
                                                            <a href="booking?conditon=${i.condition}&bid=${i.billid}"><i class="bi bi-building-fill-add"></i></a>
                                                                <c:if test="${i.condition != 1}">
                                                                <a href="deletebill?bid=${i.billid}"><i class="bi bi-trash-fill"></i></a>
                                                                </c:if>
                                                        </td>
                                                    </tr>
                                                <script>
                                                    calculateFuture("${i.datedue}", "uration-${i.billid}");
                                                </script>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-body pb-2">
                                    <div class="d-flex align-items-center">
                                        <h6 class="">Pending: </h6>
                                        <button id="toggleButton1" onclick="toggleCard('cardContainer1', 'toggleButton1')" class="btn btn-default">Hide</button>
                                    </div>
                                    <div id="cardContainer1" class="text-right mt-3" style="display: ${his}">
                                        <table class="custom-table" border="1">
                                            <thead>
                                                <tr>
                                                    <th>Comment</th>
                                                    <th>Status</th>
                                                    <th>Money</th>
                                                    <th>Time</th>
                                                    <th class="smaller">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pending}" var="i">
                                                    <tr>
                                                        <td>
                                                            <c:set var="sub" value="${fn:substringBefore(i.textarea, '%')}" />
                                                            ${sub}
                                                        </td>
                                                        <td>
                                                            <c:if test="${i.astatus == 1}">
                                                                <span style="background-color: #00cc00; border-radius: 5px;padding: 5px; color: white">Processing</span>
                                                            </c:if>
                                                            <c:if test="${i.astatus == 5}">
                                                                <span style="background-color: orange; border-radius: 5px;padding: 5px; color: white">Locked</span>
                                                            </c:if>
                                                        </td>                                                
                                                        <td><fmt:formatNumber value="${i.pmoney / 1000000}" var="money" type="number" pattern="0.0 'M'" />${money} VNÐ</td>
                                                        <td><span id="duration-${i.nftid}">${i.dateup}</span></td>
                                                        <td class="smaller">
                                                            <c:if test="${i.astatus == 1}">
                                                                <a href="dele?id=${i.nftid}&type=1"><i class="bi bi-trash-fill"></i></a>
                                                                </c:if>
                                                        </td>
                                                    </tr>
                                                <script>
                                                    calculateDuration("${i.dateup}", "duration-${i.nftid}");
                                                </script>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <c:if test="${sessionScope.acc.accType != 1}">
                                    <div class="card-body pb-2">
                                        <div class="d-flex align-items-center">
                                            <h6 class="">Notifications: </h6>
                                            <button id="toggleButton2" onclick="toggleCard('cardContainer2', 'toggleButton2')" class="btn btn-default">Hide</button>
                                        </div>
                                        <div id="cardContainer2" class="text-right mt-3" style="display: ${his}">
                                            <table class="custom-table" border="1">
                                                <thead>
                                                    <tr>
                                                        <th>Sender</th>
                                                        <th>Status</th>
                                                        <th>Comment</th>
                                                        <th>Time</th>
                                                        <th class="smaller">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${donepro}" var="i">
                                                        <tr>
                                                            <td><img src="img/Avatar/${i.avatar}">${i.username}</td>                                                                                                   
                                                            <td>
                                                                <c:if test="${i.astatus == 4}">
                                                                    <span style="background-color: #009900; border-radius: 5px;padding: 5px; color: white">Complete</span>
                                                                </c:if>
                                                                <c:if test="${i.astatus == 6}">
                                                                    <span style="background-color: red; border-radius: 5px;padding: 5px; color: white">Out of Date</span>
                                                                </c:if>
                                                            </td>
                                                            <td>${i.textarea}</td> 
                                                            <td><span id="duratio-${i.nftid}">${i.dateup}</span></td>
                                                            <td class="smaller"><a href="dele?id=${i.nftid}&type=2"><i class="bi bi-trash-fill"></i></a></td>
                                                        </tr>
                                                    <script>
                                                        calculateDuration("${i.dateup}", "duratio-${i.nftid}");
                                                    </script>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="text-right mt-3">
                                    <a href="Loadinfo"><button type="button" class="btn btn-default">Back</button></a>
                                </div>
                                <div style="padding-bottom: 1%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="padding-bottom: 2%"></div>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/number.js" type="text/javascript"></script>
        <script src="js/HideShow.js" type="text/javascript"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
