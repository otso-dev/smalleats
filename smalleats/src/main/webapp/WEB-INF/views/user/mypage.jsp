<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-26
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../Include/main.jsp"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/mypage/mypage.css">
</head>
<body>
<main class="main-style">
    <div class="sidebar">
        <div class="mypage-sidebar">
            mypageside
        </div>
    </div>
    <div class="content">
        <div class="main-content">
            <div class="mypage-content">
                <div class="user-info">
                    <p>이름</p>
                    <p>이메일</p>
                    <p>전화번호</p>
                    <button type="button">비밀번호 수정</button>
                </div>
                <div class="address-info">

                </div>
            </div>
        </div>
    </div>

</main>
</body>
</html>
<script>
    const token =  localStorage.getItem("Bearer");
    console.log(token);
    $.ajax({
        url:'${pageContext.request.contextPath}/mypage/userinfo',
        type: 'GET',
        dataType: 'json',
        headers: {"Authorization": token},
        success:function (response){
            console.log(response.responseJSON);
        },
        error:function (response){
            console.log(response.responseJSON);
        }
    })
</script>