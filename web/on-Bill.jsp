<%-- 
    Document   : adminTable
    Created on : May 31, 2023, 3:03:14 PM
    Author     : win
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tables - Windmill Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"rel="stylesheet"/>
        <link rel="stylesheet" href="./css/tailwind.output.css" />
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <script src="./js/init-alpine.js"></script>
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
        <jsp:include page="ownersidebar.jsp"/>



        <!-- With actions -->
        <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
            Waiting Pending
        </h4>

        <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr
                            class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                            >
                            <th class="px-4 py-3">User</th>
                            <th class="px-4 py-3">Comment</th>
                            <th class="px-4 py-3">Status</th>
                            <th class="px-4 py-3">Date</th>
                            <th class="px-4 py-3">Actions</th>
                        </tr>
                    </thead>
                    <c:forEach items="${noti}" var="i" begin="${(page-1)*psize}" end="${page*psize-1}">
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3">
                                    <div class="flex items-center text-sm">
                                        <!-- Avatar with inset shadow -->
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full"src="img/Avatar/${i.avatar}"alt=""loading="lazy"/>
                                            <div class="absolute inset-0 rounded-full shadow-inner"aria-hidden="true"></div>
                                        </div>
                                        <div><p class="font-semibold">${i.username}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    <c:set var="sub" value="${fn:substringBefore(i.textarea, '%')}" />${sub}
                                </td>

                                <c:if test="${i.astatus == 1 || i.astatus == 5}">
                                    <td class="px-4 py-3 text-xs">
                                        <span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
                                            pending
                                        </span>
                                    </td>
                                </c:if>                          
                                <td class="px-4 py-3 text-sm">
                                    <span id="duration-${i.nftid}">${i.dateup}</span>
                                </td>
                                <td class="px-4 py-3">
                                    <c:if test="${i.astatus == 1 || i.astatus == 5}">
                                        <div class="flex items-center space-x-4 text-sm">
                                            <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                               aria-label="Edit" href="accept?id=${i.nftid}"><i style="color: green" class="bi bi-check-square"></i></a>
                                            <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                               aria-label="Edit" href="deny?id=${i.nftid}"><i style="color: red" class="bi bi-x-square"></i></a>                                    
                                        </div>
                                    </c:if>  
                                </td>
                            </tr>
                        <script>
                            calculateDuration("${i.dateup}", "duration-${i.nftid}");
                        </script>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
            <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                <span class="flex items-center col-span-3">
                </span>
                <span class="col-span-2"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                    <nav aria-label="Table navigation">
                        <ul class="inline-flex items-center">
                            <li>
                                <c:if test="${page > 2}">
                                    <a href="owner?page=<fmt:formatNumber value="1"/>"><<</a>
                                </c:if>
                                <c:if test="${page != 1}">
                                    <a href="owner?page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><</i></a>           
                                </c:if>
                                <c:if test="${noti.size() != 0}">
                                    <a class="active" href="owner?page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>    
                                </c:if>
                                <c:set var="nextPage" value="${page + 1}" />
                                <c:if test="${nextPage > Math.ceil(noti.size() / psize)}">
                                    <c:set var="nextPage" value="${page}" />
                                </c:if>
                                <c:if test="${page < (noti.size() / psize)}">
                                    <a href="owner?page=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                </c:if>
                                <c:if test="${page < (Math.floor( noti.size() / psize))}">
                                    <a href="owner?page=<fmt:formatNumber value="${(noti.size() % psize == 0) ? (noti.size() / psize) : (Math.floor( noti.size() / psize) + 1)}" 
                                                      type="number" />"> >></a> </c:if>   
                                </li>
                            </ul>
                        </nav>
                    </span>
                </div>
            </div>
            <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300 mt-4">
                Motel
            </h4>
            <select id="guest" onchange="location = this.value;" style="width: 200px" class="mb-6 flex-grow text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                <option disabled class="text-green-500" selected="">--View Info--</option>
            <c:forEach items="${ownerlist}" var="guest">  
                <c:set var="shortString" value="${fn:substring(guest.name, 0, 25)}" />
                <option value="owner?mid=${guest.mid}">${shortString}...</option>              
            </c:forEach>
        </select>
        <c:if test="${bill != null && !bill.isEmpty()}">   
            <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300 mt-4">
                Bill-Motel
            </h4>            
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Roomid</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3">Price/M</th>
                                <th class="px-4 py-3">DateDue</th>
                                <th class="px-4 py-3">Actions</th>
                            </tr>
                        </thead>
                        <c:forEach items="${bill}" var="i" begin="${(page1-1)*psize}" end="${page1*psize-1}">
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                                <tr class="text-gray-700 dark:text-gray-400">
                                    <td class="px-4 py-3 text-sm">
                                        ${i.roomid}
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                        <c:if test="${i.condition == 1}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Shelf
                                            </span>
                                        </c:if>
                                        <c:if test="${i.condition != 1}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
                                                Expired
                                            </span>
                                        </c:if>
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                        <fmt:formatNumber value="${i.price/1000000}" pattern="#.##'M'" var="formattedIncome" />
                                        ${formattedIncome} VNÐ
                                    </td>               
                                    <td class="px-4 py-3 text-sm">
                                        <span id="duration-${i.billid}">${i.datedue}</span>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex items-center space-x-4 text-sm">
                                            <c:if test="${i.condition == 1}">
                                                <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                                   aria-label="Edit" href="#"><i class="bi bi-trash"></i></a>  
                                                </c:if>
                                        </div>      
                                    </td>
                                </tr>
                            <script>
                                calculateFuture("${i.datedue}", "duration-${i.billid}");
                            </script>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
                <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                    <span class="flex items-center col-span-3">
                    </span>
                    <span class="col-span-2"></span>
                    <!-- Pagination -->
                    <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                        <nav aria-label="Table navigation">
                            <ul class="inline-flex items-center">
                                <li>
                                    <c:if test="${page1 > 2}">
                                        <a href="owner&page1=<fmt:formatNumber value="1"/>"><<</a>
                                    </c:if>
                                    <c:if test="${page1 != 1}">
                                        <a href="owner&page1=<fmt:formatNumber value="${(page1 != 1)?(page1 -1):1}" type="number" />"><</a>           
                                    </c:if>
                                    <c:if test="${bill.size() != 0}">
                                        <a class="active" href="lowner&page1=<fmt:formatNumber value="${page1}" type="number" />">${page1}</a>    
                                    </c:if>
                                    <c:set var="nextPage" value="${page1 + 1}" />
                                    <c:if test="${nextPage1 > Math.ceil(bill.size() / psize)}">
                                        <c:set var="nextPage" value="${page1}" />
                                    </c:if>
                                    <c:if test="${page1 < (bill.size() / psize)}">
                                        <a href="owner&page1=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                    </c:if>
                                    <c:if test="${page1 < (Math.floor(bill.size() / psize))}">
                                        <a href="owner&page1=<fmt:formatNumber value="${(bill.size() % psize == 0) ? (bill.size() / psize) : (Math.floor(bill.size() / psize) + 1)}" 
                                                          type="number" />"> >></a> </c:if>   
                                    </li>
                                </ul>
                            </nav>
                        </span>
                    </div>
                </div>
        </c:if>      
        <c:if test="${review != null && !review.isEmpty()}">      
            <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300 mt-4">
                Review-Motel
            </h4>
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <thead>
                            <tr
                                class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                                >
                                <th class="px-4 py-3">Sender</th>
                                <th class="px-4 py-3">Comment</th>
                                <th class="px-4 py-3">Score</th>
                                <th class="px-4 py-3">Date</th>
                                <th class="px-4 py-3">Actions</th>
                            </tr>
                        </thead>
                        <c:forEach items="${review}" var="i" begin="${(page1-1)*psize}" end="${page1*psize-1}">
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                                <tr class="text-gray-700 dark:text-gray-400">
                                    <td class="px-4 py-3">
                                        <div class="flex items-center text-sm">
                                            <!-- Avatar with inset shadow -->
                                            <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                <img class="object-cover w-full h-full rounded-full"src="img/Avatar/${i.avatar}"alt=""loading="lazy"/>
                                                <div class="absolute inset-0 rounded-full shadow-inner"aria-hidden="true"></div>
                                            </div>
                                            <div><p class="font-semibold">${i.username}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                        ${i.comment}
                                    </td>
                                    <td class="px-4 py-3 text-xs">
                                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                            <c:forEach begin="1" end="${i.rscore}">
                                                <i class="bi bi-star-fill"></i>
                                            </c:forEach>
                                        </span>
                                    </td>                     
                                    <td class="px-4 py-3 text-sm">
                                        <span id="duratio-${i.rvid}">${i.dateup}</span>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex items-center space-x-4 text-sm">
                                            <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                               aria-label="Edit" href="delereview?rvid=${i.rvid}"><i class="bi bi-trash"></i></a>                                   
                                        </div>      
                                    </td>
                                </tr>
                            <script>
                                calculateDuration("${i.dateup}", "duratio-${i.rvid}");
                            </script>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
                <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                    <span class="flex items-center col-span-3">
                    </span>
                    <span class="col-span-2"></span>
                    <!-- Pagination -->
                    <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                        <nav aria-label="Table navigation">
                            <ul class="inline-flex items-center">
                                <li>
                                    <c:if test="${page1 > 2}">
                                        <a href="owner&page1=<fmt:formatNumber value="1"/>"><<</a>
                                    </c:if>
                                    <c:if test="${page1 != 1}">
                                        <a href="owner&page1=<fmt:formatNumber value="${(page1 != 1)?(page1 -1):1}" type="number" />"><</a>           
                                    </c:if>
                                    <c:if test="${review.size() != 0}">
                                        <a class="active" href="lowner&page1=<fmt:formatNumber value="${page1}" type="number" />">${page1}</a>    
                                    </c:if>
                                    <c:set var="nextPage" value="${page1 + 1}" />
                                    <c:if test="${nextPage1 > Math.ceil(review.size() / psize)}">
                                        <c:set var="nextPage" value="${page1}" />
                                    </c:if>
                                    <c:if test="${page1 < (review.size() / psize)}">
                                        <a href="owner&page1=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                    </c:if>
                                    <c:if test="${page1 < (Math.floor(review.size() / psize))}">
                                        <a href="owner&page1=<fmt:formatNumber value="${(review.size() % psize == 0) ? (review.size() / psize) : (Math.floor(review.size() / psize) + 1)}" 
                                                          type="number" />"> >></a> </c:if>   
                                    </li>
                                </ul>
                            </nav>
                        </span>
                    </div>
                </div>
        </c:if> 
        <c:if test="${notidone != null && !notidone.isEmpty()}">      
            <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300 mt-4">
                History Notifications
            </h4>
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">User</th>
                                <th class="px-4 py-3">Comment</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3">Date</th>
                                <th class="px-4 py-3">Actions</th>
                            </tr>
                        </thead>
                        <c:forEach items="${notidone}" var="i">
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                                <tr class="text-gray-700 dark:text-gray-400">
                                    <td class="px-4 py-3">
                                        <div class="flex items-center text-sm">
                                            <!-- Avatar with inset shadow -->
                                            <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                <img class="object-cover w-full h-full rounded-full"src="img/Avatar/${i.avatar}"alt=""loading="lazy"/>
                                                <div class="absolute inset-0 rounded-full shadow-inner"aria-hidden="true"></div>
                                            </div>
                                            <div><p class="font-semibold">${i.username}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                        <c:if test="${fn:contains(i.textarea,'%')}">
                                            <c:set var="sub" value="${fn:substringBefore(i.textarea, '%')}" />${sub}
                                        </c:if>   
                                        <c:if test="${!fn:contains(i.textarea,'%')}">
                                            ${i.textarea}
                                        </c:if>   
                                    </td>
                                    <td class="px-4 py-3 text-xs">
                                        <c:if test="${i.astatus == 2}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Approve
                                            </span>
                                        </c:if>
                                        <c:if test="${i.astatus == 3}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
                                                NotApprove
                                            </span>                                   
                                        </c:if>
                                        <c:if test="${i.astatus == 4}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Complete
                                            </span>                                  
                                        </c:if>  
                                    </td>                                    
                                    <td class="px-4 py-3 text-sm">
                                        <span id="durat-${i.nftid}">${i.dateup}</span>
                                    </td>  
                                    <td class="px-4 py-3">
                                        <div class="flex items-center space-x-4 text-sm">
                                            <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                               aria-label="Edit" href="#"><i class="bi bi-trash"></i></a>                                   
                                        </div>      
                                    </td>
                                </tr>
                            <script>
                                calculateDuration("${i.dateup}", "durat-${i.nftid}");
                            </script>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </c:if> 
    </body>
</html>
