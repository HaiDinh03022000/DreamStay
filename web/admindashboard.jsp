<%-- 
    Document   : admindashboard
    Created on : Jun 23, 2023, 4:35:16 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>

        <link rel="stylesheet" href="assets/css/main/app.css">
        <link rel="stylesheet" href="assets/css/main/app-dark.css">

        <link rel="stylesheet" href="assets/css/shared/iconly.css">

    </head>

    <body>

        <jsp:include page="adminheader.jsp"/>
        <div class="page-heading">
            <h3>Profile Statistics</h3>
        </div>
        <div class="page-content">
            <section class="row">
                <div class="col-12 col-lg-9">
                    <div class="row">
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-4 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                            <div class="stats-icon purple mb-2">
                                                <i class="iconly-boldProfile"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                            <h6 class="text-muted font-semibold">Accounts</h6>
                                            <h6 class="font-extrabold mb-0">${income.ttaccounts}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-4 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                            <div class="stats-icon blue mb-2">                                             
                                                <i class="bi bi-cash-coin mb-4" style="margin-right: 11px"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                            <h6 class="text-muted font-semibold">Incomes</h6>
                                            <fmt:formatNumber value="${income.ttmoney/1000000}" pattern="#.##'M'" var="formattedIncome" />
                                            <h6 class="font-extrabold mb-0">${formattedIncome}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-4 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                            <div class="stats-icon green mb-2">
                                                <i class="iconly-boldAdd-User"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                            <h6 class="text-muted font-semibold">Owners</h6>
                                            <h6 class="font-extrabold mb-0">${income.ttowners}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-4 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                            <div class="stats-icon red mb-2">
                                                <i class="bi bi-building-check mb-4" style="margin-right: 11px"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                            <h6 class="text-muted font-semibold">Rooms</h6>
                                            <h6 class="font-extrabold mb-0">${income.ttrooms}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-xl-12">
                            <div class="card">
                                <div class="card-header d-flex">
                                    <h4>Latest Notifications :</h4>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="listadmin?type=2">View More</a></li>
                                    </ol>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-lg">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Comment</th>
                                                    <th>Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${noti}" var="r">
                                                    <tr>
                                                        <td class="col-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="avatar avatar-md">
                                                                    <img src="img/Avatar/${r.avatar}">
                                                                </div>
                                                                <p class="font-bold ms-3 mb-0">${r.username}</p>
                                                            </div>
                                                        </td>
                                                        <td class="col-auto">
                                                            <p class=" mb-0">${r.textarea}</p>
                                                        </td>
                                                        <td class="col-auto">
                                                            <p class=" mb-0">
                                                                <span id="duratio-${r.nftid}">${r.dateup}</span>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <script>
                                                    calculateDuration("${r.dateup}", "duratio-${r.nftid}");
                                                </script>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-xl-12">
                            <div class="card">
                                <div class="card-header d-flex">
                                    <h4>Latest Contact :</h4>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="listadmin?type=2">View More</a></li>
                                    </ol>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-lg">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Comment</th>
                                                    <th>Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${noti}" var="r">
                                                    <tr>
                                                        <td class="col-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="avatar avatar-md">
                                                                    <img src="img/Avatar/${r.avatar}">
                                                                </div>
                                                                <p class="font-bold ms-3 mb-0">${r.username}</p>
                                                            </div>
                                                        </td>
                                                        <td class="col-auto">
                                                            <p class=" mb-0">${r.textarea}</p>
                                                        </td>
                                                        <td class="col-auto">
                                                            <p class=" mb-0">
                                                                <span id="duratio-${r.nftid}">${r.dateup}</span>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <script>
                                                    calculateDuration("${r.dateup}", "duratio-${r.nftid}");
                                                </script>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3">
                    <div class="card">
                        <h4>Top1 Motel</h4>
                        <div class="card-body py-4 px-4">
                            <div class="d-flex align-items-center">
                                <div class="avatar avatar-xl">
                                    <img src="img/Avatar/${top1.avatar}">
                                </div>
                                <div class="ms-3 name">
                                    <h5 class="font-bold text-warning">${top1.fullname}</h5>
                                    <h6 class="text-muted mb-0">${top1.uAddress}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4>New Account</h4>
                        </div>
                        <div class="card-content pb-4">
                            <c:forEach items="${info}" var="i">
                                <div class="recent-message d-flex px-4 py-3">
                                    <div class="avatar avatar-lg">
                                        <img src="img/Avatar/${i.avatar}">
                                    </div>
                                    <div class="name ms-4">
                                        <h5 class="mb-1">${i.fullname}</h5>
                                        <h6 class="text-muted mb-0">${i.uAddress}</h6>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="px-4">
                                <a href="listadmin?type=1" class='btn btn-block btn-xl btn-outline-primary font-bold mt-3'>View All Account</a>
                            </div>
                        </div>
                    </div>                   
                </div>
                <script src="assets/js/bootstrap.js"></script>
                <script src="assets/js/app.js"></script>

                <!-- Need: Apexcharts -->
                <script src="assets/extensions/apexcharts/apexcharts.min.js"></script>
                <script src="assets/js/pages/dashboard.js"></script>

                </body>

                </html>
