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

    </head>

    <body>
        <section>
            <c:set var="page1" value="${param.page1}"/>          
            <c:set var="psize" value="5"/>
            <c:if test="${page1 == null}">   
                <c:set var="page1" value="1"/>     
            </c:if>         
        </section>
        <section>
            <c:set var="page" value="${param.page}"/>          
            <c:set var="psize" value="5"/>
            <c:if test="${page == null}">
                <c:set var="page" value="1"/>       
            </c:if>         
        </section>
        <jsp:include page="adminheader.jsp"/>

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Notification Manage</h3>
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
                        Waiting Pending
                    </div>
                    <div class="card-body">
                        <table class="table table-striped" id="table1">
                            <thead>
                                <tr>
                                    <th>UserName</th>
                                    <th>Comment
                                        <button class="btn btn-primary" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="bi bi-caret-down-fill"></i></button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                                            <a class="dropdown-item" href="listadmin?type=2&ctype=1">Update</a>
                                            <a class="dropdown-item" href="listadmin?type=2&ctype=2">Create</a> 
                                            <a class="dropdown-item" href="listadmin?type=2">All</a> 
                                        </div>
                                    </th>
                                    <th>Status</th>
                                    <th>Date Up</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${notipending}" var="r" begin="${(page-1)*psize}" end="${page*psize-1}">
                                    <tr>
                                        <td><img  style="border-radius: 50px; width: 50px; height: 50px" src="img/Avatar/${r.avatar}" alt="">
                                            ${r.username}
                                        </td>
                                        <td>${r.textarea}</td>
                                        <td> 
                                            <c:if test="${r.astatus == 7}">
                                                <span class="badge bg-warning">pending</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <span id="duratio-${r.nftid}">${r.dateup}</span>
                                        </td>

                                        <td>     
                                            <a href="notiadmin?alid=${r.nftid}"><i class="bi bi-check2-square text-success"></i></a> 
                                            <c:set var="splitArray" value="${fn:split(r.textarea, ':')}" />
                                            <c:if test="${fn:trim(splitArray[3]) == '' }">
                                                <a href="roomdetail?mid=${fn:trim(splitArray[1])}&check=1"><i class="bi bi-eye-fill"></i></a>  
                                                <a href="admanagemotel?mid=${fn:trim(splitArray[1])}&aleartid=${r.nftid}&link=2"><i class="text-danger bi bi-building-fill-slash"></i></a>
                                                </c:if>
                                            <c:if test="${fn:trim(splitArray[3]) != '' }">      
                                                <a href="roomdetail?mid=${fn:trim(splitArray[3])}&roomid=${fn:trim(splitArray[1])}"><i class="bi bi-eye-fill"></i></a> 
                                                <a href="admanagemotel?roomid=${fn:trim(splitArray[1])}&mid=${fn:trim(splitArray[3])}&aleartid=${r.nftid}&link=2"><i class="text-danger bi bi-building-fill-slash"></i></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                <script>
                                    calculateDuration("${r.dateup}", "duratio-${r.nftid}");
                                </script>
                            </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Table navigation">
                        <ul class="inline-flex items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <c:if test="${page > 2}">
                                        <a href="listadmin?type=2&page=<fmt:formatNumber value="1"/>"><<</a>
                                    </c:if>
                                    <c:if test="${page != 1}">
                                        <a href="listadmin?type=2&page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><</a>           
                                    </c:if>
                                    <c:if test="${notipending.size() != 0}">
                                        <a class="active" href="listadmin?type=2&page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>    
                                    </c:if>
                                    <c:set var="nextPage" value="${page + 1}" />
                                    <c:if test="${nextPage > Math.ceil(notipending.size() / psize)}">
                                        <c:set var="nextPage" value="${page}" />
                                    </c:if>
                                    <c:if test="${page < (notipending.size() / psize)}">
                                        <a href="listadmin?type=2&page=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                    </c:if>
                                    <c:if test="${page < (Math.floor(notipending.size() / psize))}">
                                        <a href="listadmin?type=2&page=<fmt:formatNumber value="${(notipending.size() % psize == 0) ? (notipending.size() / psize) : (Math.floor(notipending.size() / psize) + 1)}" 
                                                          type="number" />"> >></a> </c:if>   
                                    </li>
                                </ol>
                            </ul>
                        </nav>
                    </div>

                </section>
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            Notification History
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>UserName</th>
                                        <th>Comment</th>
                                        <th>Status</th>
                                        <th>Date Up</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${noticomplete}" var="r" begin="${(page1-1)*psize}" end="${page1*psize-1}">
                                    <tr>
                                        <td><img  style="border-radius: 50px; width: 50px; height: 50px" src="img/Avatar/${r.avatar}" alt="">
                                            ${r.username}
                                        </td>
                                        <td>${r.textarea}</td>
                                        <td> 
                                            <c:if test="${r.astatus == 8}">
                                                <span class="badge bg-success">complete</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <span id="duratio-${r.nftid}">${r.dateup}</span>
                                        </td>

                                        <td>     
                                            <a href="dele?id=${r.nftid}&type=3"><i class="bi bi-trash-fill text-secondary"></i></a>
                                        </td>
                                    </tr>
                                <script>
                                    calculateDuration("${r.dateup}", "duratio-${r.nftid}");
                                </script>
                            </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Table navigation">
                        <ul class="inline-flex items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <c:if test="${page1 > 2}">
                                        <a href="listadmin?type=2&page1=<fmt:formatNumber value="1"/>"><<</a>
                                    </c:if>
                                    <c:if test="${page1 != 1}">
                                        <a href="listadmin?type=2&page1=<fmt:formatNumber value="${(page1 != 1)?(page1 -1):1}" type="number" />"><</a>           
                                    </c:if>
                                    <c:if test="${noticomplete.size() != 0}">
                                        <a class="active" href="listadmin?type=2&page1=<fmt:formatNumber value="${page1}" type="number" />">${page1}</a>    
                                    </c:if>
                                    <c:set var="nextPage" value="${page1 + 1}" />
                                    <c:if test="${nextPage1 > Math.ceil(noticomplete.size() / psize)}">
                                        <c:set var="nextPage" value="${page1}" />
                                    </c:if>
                                    <c:if test="${page1 < (noticomplete.size() / psize)}">
                                        <a href="listadmin?type=2&page1=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                    </c:if>
                                    <c:if test="${page1 < (Math.floor(noticomplete.size() / psize))}">
                                        <a href="listadmin?type=2&page1=<fmt:formatNumber value="${(noticomplete.size() % psize == 0) ? (noticomplete.size() / psize) : (Math.floor(noticomplete.size() / psize) + 1)}" 
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
