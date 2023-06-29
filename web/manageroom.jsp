<%-- 
    Document   : createMotel
    Created on : Jun 15, 2023, 9:27:23 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Windmill Dashboard - Forms</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
            />
        <script src="./js/init-alpine.js"></script>
        <link rel="stylesheet" href="./css/tailwind.output.css" />
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="css/popup.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <jsp:include page="ownersidebar.jsp"/>

        <!-- General elements -->
        <h4
            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
            >
            Elements
        </h4>
        <div
            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
            >

            <c:if test="${room == null}">
                <c:set var="action" scope="session" value="createroom"/> 
            </c:if>
            <c:if test="${room != null}">
                <c:set var="action" scope="session" value="updateroom"/> 
            </c:if>

            <form action="${action}" method="post" enctype="multipart/form-data" oninput="checkInputValue('numberInput','submitButton')"> 
                <div class="flex items-center">
                    <c:if test="${room == null}">
                        <label class="mb-4 p-2 block mt-4 flex-grow text-sm">      
                            <span class="text-gray-700 dark:text-gray-400 text-sm ">Motel type room</span>
                            <select name="cate" class="block flex-grow w-10 px-10 mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                <c:forEach items="${cate}" var="i">  
                                    <option value="${i.cateid}">${i.catename}</option>              
                                </c:forEach>
                            </select>
                        </label>
                    </c:if>
                    <c:if test="${room.roomid == null}">
                        <c:set var="req" value="required"/> 
                    </c:if>
                    <label class="block flex-grow w-56 text-sm">    
                        <span class="text-gray-700 dark:text-gray-400">Upload image</span>
                        <input ${req} name="img" type="file" multiple="" class="block w-80 mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" accept="image/png, image/gif, image/jpeg" > 
                    </label>
                    <input type="hidden" name="roomid" value="${room.roomid}" />    
                    <input type="hidden" name="mid" value="${mid}" />    
                    
                </div>

                <span class="text-gray-700 dark:text-gray-400 text-sm">Info Motel </span>                                                    

                <div class="flex items-center">
                    <input required  id="numberInput" value="${room.price}" onkeypress="return isNumber(event)" onpaste="return false" name="price" class="w-20 h-8 px-2 text-sm border-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none dark:text-gray-300" placeholder="Price">

                    <input required id="numberInput" value="${room.quantity}" onkeypress="return isNumber(event)" onpaste="return false"e name="quantity" class="w-24 h-8 px-2 text-sm border-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none dark:text-gray-300 " placeholder="Quantity">
                </div>



                <c:if test="${room == null}">
                    <div id="popup" class="popup">
                        <p>Do you want to create more Room continue?</p>
                        <button name="accpect" value="accpect" type="submit">Continue</button>
                        <button name="deny" value="deny">Deny</button>
                    </div>
                </c:if>
                <c:if test="${room != null}">
                    <button id="submitButton" disabled  style="margin-top: 20px" type="submit" class="pt-5 px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                        Update
                    </button>
                </c:if>
            </form>
            <c:if test="${room == null}">
                <button  onclick="openPopup()" style="margin-top: 20px" type="submit" class="pt-5 px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    Create
                </button>
            </c:if>
            <div id="overlay" class="overlay" onclick="closePopup()"></div>
        </div>
        <script src="js/validateinput.js" type="text/javascript"></script>
    </body>
</html>

