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
            <c:set var="page" value="${param.page}"/>
            <c:set var="psize" value="5"/>
            <c:if test="${page == null}">
                <c:set var="page" value="1"/>     
            </c:if>         
        </section>

        <jsp:include page="ownersidebar.jsp"/>


        <h4>${mess}</h4>
        <!-- With actions -->
        <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
            All motel
        </h4>
        <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                            <th class="px-4 py-3">Motel</th>
                            <th class="px-4 py-3">Address</th>
                            <th class="px-4 py-3">Rating</th>
                            <th class="px-4 py-3">Price</th>
                            <th class="px-4 py-3">Actions</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ownerlist}" var="i" begin="${(page-1)*psize}" end="${page*psize-1}">
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3">
                                    <div class="flex items-center text-sm">
                                        <!-- Avatar with inset shadow -->
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full"src="img/motelimg/${i.image1}"alt=""loading="lazy"/>
                                            <div class="absolute inset-0 rounded-full shadow-inner"aria-hidden="true"></div>
                                        </div>
                                        <div><p class="font-semibold"></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    ${i.name}
                                </td>                    
                                <td class="px-4 py-3 text-xs">
                                    <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                        <c:forEach begin="1" end="${i.rscore}">
                                            <i class="bi bi-star-fill"></i>
                                        </c:forEach>
                                    </span>
                                </td> 
                                <td class="px-4 py-3 text-sm">
                                    ${i.price   }
                                </td>                             
                                <td class="px-4 py-3">

                                    <div class="flex items-center space-x-4 text-sm">
                                        <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                           aria-label="Edit" href="updatemotel?mid=${i.mid}"><i class="bi bi-building-gear"></i></a>
                                        <a class="flex items-center justify-between text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400"
                                           aria-label="Edit" href="deletemotel?id=${i.mid}"><i style="color: red" class="bi bi-x-square"></i></a>                                    
                                    </div>
                                </td>
                            </tr>            
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
                                    <a href="managemotel?page=<fmt:formatNumber value="1"/>"><<</a>
                                </c:if>
                                <c:if test="${page != 1}">
                                    <a href="managemotel?page=<fmt:formatNumber value="${(page != 1)?(page -1):1}" type="number" />"><</i></a>           
                                </c:if>
                                <c:if test="${ownerlist.size() != 0}">
                                    <a class="active" href="managemotel?page=<fmt:formatNumber value="${page}" type="number" />">${page}</a>    
                                </c:if>
                                <c:set var="nextPage" value="${page + 1}" />
                                <c:if test="${nextPage > Math.ceil(ownerlist.size() / psize)}">
                                    <c:set var="nextPage" value="${page}" />
                                </c:if>
                                <c:if test="${page < (ownerlist.size() / psize)}">
                                    <a href="managemotel?page=<fmt:formatNumber value="${nextPage}" type="number"/>">></a>
                                </c:if>
                                <c:if test="${page < (Math.floor( noti.size() / psize))}">
                                    <a href="managemotel?page=<fmt:formatNumber value="${(ownerlist.size() % psize == 0) ? (ownerlist.size() / psize) : (Math.floor( ownerlist.size() / psize) + 1)}" 
                                                      type="number" />"> >></a> </c:if>   
                                </li>
                            </ul>
                        </nav>
                    </span>
            </div>
        </div>



    </body>
</html>
