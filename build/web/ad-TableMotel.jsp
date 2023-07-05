<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Notification</title>

        <link rel="stylesheet" href="assets/css/main/app.css">
        <link rel="stylesheet" href="assets/css/main/app-dark.css">
        <link rel="shortcut icon" href="assets/images/logo/favicon.svg" type="image/x-icon">
        <link rel="shortcut icon" href="assets/images/logo/favicon.png" type="image/png">
        <link rel="stylesheet" href="assets/extensions/simple-datatables/style.css">
        <link rel="stylesheet" href="assets/css/pages/simple-datatables.css">
        <link href="css/truncate.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <section>
            <c:set var="page" value="${param.page}"/>          
            <c:set var="psize" value="10"/>
            <c:if test="${page == null}">
                <c:set var="page" value="1"/>       
            </c:if>         
        </section>
        <jsp:include page="adminheader.jsp"/>
        <style>
            .truncate-4 {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 50px;
            }
        </style>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Motel Manage</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        All Motel
                    </div>
                    <div class="card-body">
                        <table class="table table-striped" id="table1">
                            <thead>
                                <tr>
                                    <th>Motel Name</th>
                                    <th>AVG Price</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${motel}" var="r" begin="${(page-1)*psize}" end="${page*psize-1}">
                                    <tr>
                                        <td><c:set var="shortString" value="${fn:substring(r.name, 0, 30)}" />${shortString}...</td>
                                        <td><fmt:formatNumber value="${r.price / 1000000}" var="money" type="number" pattern="0.0 'M'" />${money} VNÐ</td>
                                        <td><span >${r.address}</span></td>
                                        <td>                                               
                                            <a href="roomdetail?mid=${r.mid}&check=1"><i class="bi bi-eye-fill"></i></a> - 
                                                <c:if test="${r.condition == 1}">
                                                <a href="admanagemotel?mid=${r.mid}&link=3"><i class="text-danger bi bi-building-fill-slash"></i></a>   
                                                </c:if>
                                                <c:if test="${r.condition == 0}">
                                                <a href="admanagemotel?mid=${r.mid}&link=3"><i class="text-success bi bi-building-fill-slash"></i></a>   
                                                </c:if>
                                        </td>
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Table navigation">
                        <ul class="inline-flex items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <c:if test="${page > 2}">
                                        <a href="listadmin?type=3&page=<fmt:formatNumber value="1"/>"><<</a>
                                    </c:if>
                                    <c:if test="${page != 1}">
                                        <a href="listadmin?type=3&page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><</a>           
                                    </c:if>
                                    <c:if test="${motel.size() != 0}">
                                        <a class="active" href="listadmin?type=3&page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>    
                                    </c:if>
                                    <c:set var="nextPage" value="${page + 1}" />
                                    <c:if test="${nextPage > Math.ceil(motel.size() / psize)}">
                                        <c:set var="nextPage" value="${page}" />
                                    </c:if>
                                    <c:if test="${page < (motel.size() / psize)}">
                                        <a href="listadmin?type=3&page=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                    </c:if>
                                    <c:if test="${page < (Math.floor(motel.size() / psize))}">
                                        <a href="listadmin?type=3&page=<fmt:formatNumber value="${(motel.size() % psize == 0) ? (motel.size() / psize) : (Math.floor(motel.size() / psize) + 1)}" 
                                                          type="number" />"> >></a> </c:if>   
                                </li>
                            </ol>
                        </ul>
                    </nav>
                </div>
            </section>                
        </div>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/app.js"></script>

        <script src="assets/extensions/simple-datatables/umd/simple-datatables.js"></script>
        <script src="assets/js/pages/simple-datatables.js"></script>

    </body>

</html>
