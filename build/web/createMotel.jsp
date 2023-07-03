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
        <title>C-M_motel</title>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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

            <c:if test="${m == null}">
                <c:set var="action" scope="session" value="upmotel"/> 
            </c:if>
            <c:if test="${m != null}">
                <c:set var="action" scope="session" value="updatemotel"/> 
            </c:if>
            <c:if test="${m.mid == null}">
                <c:set var="req" value="required"/> 
            </c:if>

            <form action="${action}" method="post" enctype="multipart/form-data" oninput="checkInputValue('Input','submitButton')">
                <div class="flex items-center">

                    <label class="block flex-grow w-56 text-sm">   
                        <c:if test="${m != null}">
                            <select id="guest" onchange="location = this.value;" class="block flex-grow w-10 px-10 mt-6 mr-2s text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                <option disabled class="text-green-500" selected="">--Update Room--</option>        
                                <c:forEach items="${type}" var="guest">  
                                    <option value="updateroom?roomid=${guest.roomid}">${guest.cateid}</option>              
                                </c:forEach>
                                <option value="createroom?mid=${m.mid}" class="text-blue-500" >+Add Room</option> 
                                <option disabled>──────────</option>
                                <option  disabled class="text-red-600">--Delete Room--</option>        
                                <c:forEach items="${type}" var="guest">  
                                    <option value="deleteroom?roomid=${guest.roomid}&mid=${m.mid}">${guest.cateid}</option>              
                                </c:forEach>                        
                            </select>
                        </c:if>

                        <span class="text-gray-700 dark:text-gray-400">Upload image</span>
                        <input ${req} name="img" type="file" class="block w-80 flex-grow w-10 px-10 mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" accept="image/png, image/gif, image/jpeg" > 
                    </label>
                    <label class="block flex-grow w-56 text-sm">  
                    </label>


                    <input type="hidden" name="img1" value="${m.image1}" />
                </div>
                <span class="text-gray-700 dark:text-gray-400 text-sm">Info Motel</span>                                                    

                <div class="flex items-center">

                    <input id="Input" value="${m.name}" required name="name" class="flex-grow w-full h-8 px-2 text-sm border-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none dark:text-gray-300 " placeholder="Name Motel">

                    <input id="Input" value="${m.address}" required name="address" class="w-20 h-8 px-2 text-sm border-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none dark:text-gray-300" placeholder="Address">

                    <input id="Input" value="${m.coordinates}" required name="coordinates" class="w-24 h-8 px-2 text-sm border-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none dark:text-gray-300 " placeholder="Coordinates">
                </div>

                <label class="block mt-4 text-sm">
                    <span class="text-gray-700 dark:text-gray-400">Description</span>
                    <textarea id="Input" required maxlength="500" name="description"
                              class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                              rows="3"
                              placeholder="Enter Your Motel Description"
                              >${m.description}</textarea>
                    <input type="hidden" value="${m.mid}" name="mid">

                </label>

                <c:if test="${m == null}">
                    <button style="margin-top: 20px" type="submit" class="pt-5 px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                        Create
                    </button>
                </c:if>
                <c:if test="${m != null}">
                    <button id="submitButton" disabled style="margin-top: 20px" type="submit" class="pt-5 px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                        Upload
                    </button>
                </c:if>


                <!--            <div class="flex mt-6 text-sm">
                                <label class="flex items-center dark:text-gray-400">
                                    <input
                                        type="checkbox"
                                        class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                        />
                                    <span class="ml-2">
                                        I agree to the
                                        <span class="underline">privacy policy</span>
                                    </span>
                                </label>
                            </div>-->
            </form>
        </div>
        <script src="js/validateinput.js" type="text/javascript"></script>
    </body>
</html>

