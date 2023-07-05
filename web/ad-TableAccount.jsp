<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DataTable</title>

        <link rel="stylesheet" href="assets/css/main/app.css">
        <link rel="stylesheet" href="assets/css/main/app-dark.css">
        <link rel="shortcut icon" href="assets/images/logo/favicon.svg" type="image/x-icon">
        <link rel="shortcut icon" href="assets/images/logo/favicon.png" type="image/png">

        <link rel="stylesheet" href="assets/extensions/simple-datatables/style.css">
        <link rel="stylesheet" href="assets/css/pages/simple-datatables.css">

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

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Manage Account</h3>
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
                        Account Table
                    </div>
                    <div class="card-body">
                        <table class="table table-striped" id="table1">
                            <thead>
                                <tr>
                                    <th>UserName</th>
                                    <th>
                                        <button class="btn btn-primary dropdown-toggle me-1" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Status</button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                                            <a class="dropdown-item" href="listadmin?type=1&acctype=0">User</a>
                                            <a class="dropdown-item" href="listadmin?type=1&acctype=1">Owner</a>
                                            <a class="dropdown-item" href="listadmin?type=1">All</a>                                       
                                        </div>
                                    </th>
                                    <th>Date Up</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${acc}" var="r" begin="${(page-1)*psize}" end="${page*psize-1}">


                                    <tr>
                                        <td>${r.user}</td>
                                        <td>
                                            <c:if test="${r.accType == 1}">
                                                <span class="badge bg-danger">Owner</span>
                                            </c:if>
                                            <c:if test="${r.accType == 0}">
                                                <span class="badge bg-success">User</span>
                                            </c:if>
                                        </td>
                                        <td>${r.createDate}</td>
                                        <td>
                                            <c:if test="${r.accstatus == 1}">
                                                <a style="color: red" href="updateacc?accid=${r.accId}"><i class="bi bi-hammer"></i></a> - 
                                                </c:if>
                                                <c:if test="${r.accstatus == 0}">
                                                <a style="color: #33cc00" href="updateacc?accid=${r.accId}"><i class="bi bi-hammer"></i></a> - 
                                                </c:if>
                                            <a style="color: gray" href="deleteacc?accid=${r.accId}&acctype=${r.accType}"><i class="bi bi-trash-fill"></i></a>
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
                                        <a href="listadmin?type=1&page=<fmt:formatNumber value="1"/>"><<</a>
                                    </c:if>
                                    <c:if test="${page != 1}">
                                        <a href="listadmin?type=1&page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><</a>           
                                    </c:if>
                                    <c:if test="${acc.size() != 0}">
                                        <a class="active" href="listadmin?type=1&page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>    
                                    </c:if>
                                    <c:set var="nextPage" value="${page + 1}" />
                                    <c:if test="${nextPage > Math.ceil(acc.size() / psize)}">
                                        <c:set var="nextPage" value="${page}" />
                                    </c:if>
                                    <c:if test="${page < (acc.size() / psize)}">
                                        <a href="listadmin?type=1&page=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                    </c:if>
                                    <c:if test="${page < (Math.floor(acc.size() / psize))}">
                                        <a href="listadmin?type=1&page=<fmt:formatNumber value="${(acc.size() % psize == 0) ? (acc.size() / psize) : (Math.floor( acc.size() / psize) + 1)}" 
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
