<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-26
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/main.jsp"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/mypage/mypage.css">
</head>
<body>
<main class="main-style">
    <div class="sidebar">
        <div class="mypage-sidebar">
            <ul class="mypage-sidebar-list">
                <li class="order-list-btn">
                    주문조회
                </li>
                <li class="password-list-btn">
                    비밀번호 변경
                </li>
                <li class="address-content-btn">
                    주소
                </li>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="main-content">
            <div class="mypage-content">
                <div class="user-info hidden-mypage">
                    <p id="user-name">이름: </p>
                    <p id="email">이메일: </p>
                    <p id="phone-number">전화번호: </p>
                </div>
                <div class="address-info">

                </div>
                <div class="order-list hidden-mypage">
                    주문조회
                </div>
                <div class="password-change hidden-mypage">
                    비밀번호 변경
                </div>
                <div class="address-content hidden-mypage">
                    주소
                </div>
            </div>
        </div>
    </div>

</main>
</body>
</html>
<script>
    const token =  localStorage.getItem("Token");
    console.log(token);
    $.ajax({
        url:'${pageContext.request.contextPath}/user/userinfo',
        type: 'GET',
        dataType: 'json',
        headers: {"Authorization": token},
        success:function (response){
            console.log(response);
            const name = response.username;
            const email = response.email;
            const phoneNumber = response.phoneNumber;
            $('#user-name').append(name);
            $('#email').append(email);
            $('#phone-number').append(phoneNumber);
        },
        error:function (response){
            console.log(response);
        }
    })
</script>