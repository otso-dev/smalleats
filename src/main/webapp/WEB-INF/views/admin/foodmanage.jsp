<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-23
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/adminHeader.jsp"/>
<html>
<head>
    <title>admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/admin/admin.css">
</head>
<body>
    <main class="main-style">
        <div class="sidebar">
            <ul class="admin-sidebar-list">
                <li class="user-manage-btn" onclick="location='/admin/usermanage'">
                    유저 관리
                </li>
                <li class="user-manage-btn" onclick="location='/admin/partnermanage'">
                    파트너 유저 관리
                </li>
                <li onclick="approvedFoods()">
                    입점 음식점
                </li>
                <li onclick="pendingFoods()">
                    입점 신청 음식점
                </li>
                <li onclick="location='/admin/category'">
                    음식점 카테고리 등록
                </li>
            </ul>
        </div>
        <div class="food-content">
            <c:choose>
                <c:when test="${empty pendingFoodList}">
                    <p>입점을 신청한 음식점이 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="pendingFoodList" items="${pendingFoodList}">
                        <div class="food-box" onclick="location='/admin/detailpendingfood/${pendingFoodList.foodId}'">
                            <div class="food-img-box">

                            </div>
                            <footer class="food-footer">
                                <div class="food-name-box">
                                    <p>음식점 이름: ${pendingFoodList.foodName}</p>
                                    <p>지역: ${pendingFoodList.foodAddressSido}</p>
                                    <p>주소: ${pendingFoodList.foodRoadAddress}</p>
                                </div>
                                <div class="food-delivery-box">
                                    <p>오픈시간: ${pendingFoodList.foodOpen}</p>
                                    <p>마감시간: ${pendingFoodList.foodClose}</p>
                                </div>
                            </footer>
                            <c:if test="${pendingFoodList.pendingStatus eq 'PENDING'}">
                                <button type="button" onclick="adminFoodSubject(${pendingFoodList.pendingFoodId})">음식점 등록</button>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>

<script>
    function adminFoodSubject(foodId){
        $.ajax({
            url:"/admin/food/register",
            type:"POST",
            contentType: "application/json",
            data:JSON.stringify({
                foodId: foodId
            }),success:function (response){
                alert(response + "등록성공");
            },error:function (response){
                alert(response + "등록실패");
            }
        })
    }
</script>
<script>
    function pendingFoods(){
        const pendingStatus = "PENDING";
        location.href = "/admin/foodmanage?pendingStatus=" + pendingStatus;
    }
    function approvedFoods(){
        const pendingStatus = "APPROVED";
        location.href = "/admin/foodmanage?pendingStatus=" + pendingStatus;
    }
</script>
</html>
