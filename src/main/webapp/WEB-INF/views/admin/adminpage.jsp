<%--
  Created by IntelliJ IDEA.
  User: hhgg0
  Date: 2023-10-02
  Time: 오전 1:35
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
    <div>
        <h2>admin</h2>
    </div>
</main>
</body>
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
