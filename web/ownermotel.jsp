
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
                        Total Customer
                    </p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                        ${data[0]}
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
                <div> <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Incomes</p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                        <fmt:formatNumber value="${data[1]/1000000}" pattern="#.##'M'" var="formattedIncome" />
                        ${formattedIncome} VNÐ
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
                    <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Total Bills</p>
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">${data[2]}</p>
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
                    <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">${data[3]}</p>
                </div>
            </div>
        </div>

        <!-- New Table -->
        <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
            Top1 Motel
        </h4>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                        <th class="px-4 py-3">Motel</th>
                        <th class="px-4 py-3">Name</th>
                        <th class="px-4 py-3">Address</th>
                        <th class="px-4 py-3">Rating</th>
                        <th class="px-4 py-3">Price/M</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                    <tr class="text-gray-700 dark:text-gray-400">
                        <td class="px-4 py-3">
                            <div class="flex items-center text-sm">
                                <!-- Avatar with inset shadow -->
                                <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                    <img class="object-cover w-full h-full rounded-full"src="img/motelimg/${motel.image1}"alt=""loading="lazy"/>
                                    <div class="absolute inset-0 rounded-full shadow-inner"aria-hidden="true"></div>
                                </div>
                                <div><p class="font-semibold"></p>
                                </div>
                            </div>
                        </td>
                        <td class="px-4 py-3 text-sm">
                            ${motel.name}
                        </td>   
                        <td class="px-4 py-3 text-sm">
                            ${motel.address}
                        </td> 
                        <td class="px-4 py-3 text-xs">
                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                <c:forEach begin="1" end="${motel.rscore}">
                                    <i class="bi bi-star-fill"></i>
                                </c:forEach>
                            </span>
                        </td> 
                        <td class="px-4 py-3 text-sm">
                            <fmt:formatNumber value="${motel.price/1000000}" pattern="#.##'M'" var="formattedIncome" />
                            ${formattedIncome} VNÐ
                        </td>                         
                    </tr>            
                </tbody>
            </table>
        </div>
        <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
            Latest Bill
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
                            <th class="px-4 py-3">Dateup</th>
                        </tr>
                    </thead>
                    <c:forEach items="${bill}" var="i">
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
                                <td class="px-4 py-3 text-sm">
                                    <span id="duratio-${i.billid}">${i.dateup}</span>
                                </td>
                            </tr>
                        <script>
                            calculateFuture("${i.datedue}", "duration-${i.billid}");
                            calculateDuration("${i.dateup}", "duratio-${i.billid}");
                        </script>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                    Charts
                </h2>
                <div class="grid gap-6 mb-8 md:grid-cols-2">
                    <div
                        class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >
                        <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                            Revenue
                        </h4>
                        <canvas id="pie"></canvas>
                        <div
                            class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                            >
                             Chart legend 
                            <div class="flex items-center">
                                <span
                                    class="inline-block w-3 h-3 mr-1 bg-blue-500 rounded-full"
                                    ></span>
                                <span>Shirts</span>
                            </div>
                            <div class="flex items-center">
                                <span
                                    class="inline-block w-3 h-3 mr-1 bg-teal-600 rounded-full"
                                    ></span>
                                <span>Shoes</span>
                            </div>
                            <div class="flex items-center">
                                <span
                                    class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                                    ></span>
                                <span>Bags</span>
                            </div>
                        </div>
                    </div>
                    <div
                        class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >
                        <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                            Traffic
                        </h4>
                        <canvas id="line"></canvas>
                        <div
                            class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                            >
                             Chart legend 
                            <div class="flex items-center">
                                <span
                                    class="inline-block w-3 h-3 mr-1 bg-teal-600 rounded-full"
                                    ></span>
                                <span>Organic</span>
                            </div>
                            <div class="flex items-center">
                                <span
                                    class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                                    ></span>
                                <span>Paid</span>
                            </div>
                            <div class="flex items-center">
                                <span
                                    class="inline-block w-3 h-3 mr-1 bg-blue-600 rounded-full"
                                    ></span>
                                <span>Paid</span>
                            </div>
                        </div>
                    </div>
                </div>
    </body>
</html>
