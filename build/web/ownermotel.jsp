
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Windmill Dashboard</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./css/tailwind.output.css" />
        <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
        ></script>
        <script src="./js/init-alpine.js"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
            />
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
            defer
        ></script>
        <script src="./js/charts-lines.js" defer></script>
        <script src="./js/charts-pie.js" defer></script>
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

        <!-- Cards -->
        <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"
                          ></path>
                    </svg>
                </div>
                <div>
                    <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                        Total clients
                    </p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                        6389
                    </p>
                </div>
            </div>
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                        fill-rule="evenodd"
                        d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                        clip-rule="evenodd"
                        ></path>
                    </svg>
                </div>
                <div> <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Account balance</p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                        $ 46,760.89
                    </p>
                </div>
            </div>
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"
                          ></path>
                    </svg>
                </div>
                <div>
                    <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">New sales</p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">376</p>
                </div>
            </div>
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
                          d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
                          clip-rule="evenodd"
                          ></path>
                    </svg>
                </div>
                <div>
                    <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Pending contacts</p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">35</p>
                </div>
            </div>
        </div>

        <!-- New Table -->
        <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
            Orders Processed
        </h4>
        <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr
                            class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                            >
                            <th class="px-4 py-3">Client</th>
                            <th class="px-4 py-3">Comment</th>
                            <th class="px-4 py-3">Status</th>
                            <th class="px-4 py-3">Date</th>
                            <th class="px-4 py-3">Action</th>
                        </tr>
                    </thead>
                    <c:forEach items="${noti}" var="i" begin="${(page-1)*psize}" end="${page*psize-1}">
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3">
                                    <div class="flex items-center text-sm">
                                        <!-- Avatar with inset shadow -->
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full" src="img/Avatar/${i.avatar}" alt="" loading="lazy"/>
                                            <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                                        </div>
                                        <div><p class="font-semibold">${i.username}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    <c:set var="sub" value="${fn:substringBefore(i.textarea, '%')}" />${sub}
                                </td>                    
                                <c:if test="${i.astatus == 2}">
                                    <td class="px-4 py-3 text-xs">
                                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                            Approve
                                        </span>
                                    </td>
                                </c:if>
                                <c:if test="${i.astatus == 3}">
                                    <td class="px-4 py-3 text-xs">
                                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                            NotApprove
                                        </span>
                                    </td>
                                </c:if>  
                                <td class="px-4 py-3 text-sm">
                                    <span id="duration-${i.nftid}">${i.dateup}</span>
                                </td>
                                <td class="px-4 py-3">
                                    <div class="flex items-center space-x-4 text-sm">
                                        <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                           aria-label="Edit" href="dele?id=${i.nftid}"><i class="bi bi-trash-fill"></i></a>
                                    </div>

                                </td>
                            </tr>
                        <script>
                            calculateDuration("${i.dateup}", "duration-${i.nftid}");
                        </script>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
            <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
                >
                <span class="flex items-center col-span-3">

                </span>
                <span class="col-span-2"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                    <nav aria-label="Table navigation">
                        <ul class="inline-flex items-center">
                            <li>
                                <c:if test="${page > 2}">
                                    <a href="listdone?page=<fmt:formatNumber value="1"/>"><<</a>
                                </c:if>
                                <c:if test="${page != 1}">
                                    <a href="listdone?page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><</i></a>           
                                </c:if>
                                <c:if test="${noti.size() != 0}">
                                    <a class="active" href="listdone?page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>    
                                </c:if>
                                <c:set var="nextPage" value="${page + 1}" />
                                <c:if test="${nextPage > Math.ceil(noti.size() / psize)}">
                                    <c:set var="nextPage" value="${page}" />
                                </c:if>
                                <c:if test="${page < (noti.size() / psize)}">
                                    <a href="listdone?page=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                </c:if>
                                <c:if test="${page < (Math.floor( noti.size() / psize))}">
                                    <a href="listdone?page=<fmt:formatNumber value="${(noti.size() % psize == 0) ? (noti.size() / psize) : (Math.floor( noti.size() / psize) + 1)}" 
                                                      type="number" />"> >></a> </c:if>   
                                </li>
                            </ul>
                        </nav>
                    </span>
                </div>
            </div>
            <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                latest Notification Get
            </h4>              
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <thead>
                            <tr
                                class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                                >
                                <th class="px-4 py-3">Client</th>
                                <th class="px-4 py-3">Comment</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3">Date</th>
                                <th class="px-4 py-3">Action</th>
                            </tr>
                        </thead>
                    <c:forEach items="${done}" var="i" begin="${(page1-1)*psize}" end="${page1*psize-1}">
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3">
                                    <div class="flex items-center text-sm">
                                        <!-- Avatar with inset shadow -->
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full" src="img/Avatar/${i.avatar}" alt="" loading="lazy"/>
                                            <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                                        </div>
                                        <div><p class="font-semibold">${i.username}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    ${i.textarea}
                                </td>                    
                                <c:if test="${i.astatus == 4}">
                                    <td class="px-4 py-3 text-xs">
                                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                            Complete
                                        </span>
                                    </td>
                                </c:if>
                                <c:if test="${i.astatus == 6}">
                                    <td class="px-4 py-3 text-xs">
                                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                            Cancel
                                        </span>
                                    </td>
                                </c:if>  
                                <td class="px-4 py-3 text-sm">
                                    <span id="duratio-${i.nftid}">${i.dateup}</span>
                                </td>
                                <td class="px-4 py-3">
                                    <div class="flex items-center space-x-4 text-sm">
                                        <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                           aria-label="Edit" href="dele?id=${i.nftid}"><i class="bi bi-trash-fill"></i></a>
                                    </div>

                                </td>
                            </tr>
                        <script>
                            calculateDuration("${i.dateup}", "duratio-${i.nftid}");
                        </script>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
            <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
                >
                <span class="flex items-center col-span-3">

                </span>
                <span class="col-span-2"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                    <nav aria-label="Table navigation">
                        <ul class="inline-flex items-center">
                            <li>
                                <c:if test="${page1 > 2}">
                                    <a href="listdone?page1=<fmt:formatNumber value="1"/>"><<</a>
                                </c:if>
                                <c:if test="${page1 != 1}">
                                    <a href="listdone?page1=<fmt:formatNumber value="${(page1 != 1)?(page1 -1):1}" type="number" />"><</i></a>           
                                </c:if>
                                <c:if test="${done.size() != 0}">
                                    <a class="active" href="listdone?page1=<fmt:formatNumber value="${page1}" type="number" />">${page}</a>    
                                </c:if>
                                <c:set var="nextPage" value="${page1 + 1}" />
                                <c:if test="${nextPage > Math.ceil(done.size() / psize)}">
                                    <c:set var="nextPage" value="${page1}" />
                                </c:if>
                                <c:if test="${page1 < (done.size() / psize)}">
                                    <a href="listdone?page1=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                </c:if>
                                <c:if test="${page1 < (Math.floor( done.size() / psize))}">
                                    <a href="listdone?page1=<fmt:formatNumber value="${(done.size() % psize == 0) ? (done.size() / psize) : (Math.floor( done.size() / psize) + 1)}" 
                                                      type="number" />"> >></a> </c:if>   
                            </li>
                        </ul>
                    </nav>
                </span>
            </div>
        </div>
    </body>
</html>
