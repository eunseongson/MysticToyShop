<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>Mystic-Toy-Shop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link
            href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
            rel="stylesheet">
</head>
<style>
    * {
        font-family: 'Noto Sans KR', sans-serif;
    }

    ul, ol {
        list-style: none;
    }

    a {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .header {
        position: relative;
        border-bottom: 1px solid #EEE;
        background-color: #fff;
    }

    #nav {
        width: 980px;
        margin: 3px auto 0;
        text-align: center;
    }

    #nav > ul > li {
        display: inline-block;
        vertical-align: middle;
    }

    #nav > ul > li > a {
        display: block;
        position: relative;
        height: 40px;
        line-height: 40px;
        padding: 0 24px;
        font-size: 14px;
        letter-spacing: 0.1em;
        white-space: nowrap;
    }
</style>
<body>
<!-- 상단 메뉴 -->

<div id="header_section" class="header">
    <div style="margin-left: 10px;">

        <div id="nav" style="margin-left: 10px;">
            <ul>
                <li><h5 class="logo">
                    <img class="logoArea" style="width: 120px;" src="resources/images/logo4_trans.png" alt="">
                    <a href="<%=request.getContextPath()%>/seller_main.do?seller_id=${sessionScope.sellerLogin.seller_id}">판매자센터</a>
                </h5></li>
                <li class=""><a href="/main.do">구매자화면</a></li>
                <li class=""><a href="#">판매자</a></li>
                <li class=""><a href="#">공지사항</a></li>
                <li class=""><a href="#">이벤트</a></li>
                <li class=""><a href="/logout.do">로그아웃</a></li>
            </ul>

        </div>
    </div>


</div>


<%--<nav class="navbar navbar-expand-lg navbar-light bg-white mb-2">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/main.do">판매자센터</a>

&lt;%&ndash;
        <a class="navbar-brand" href="<%=request.getContextPath()%>/login.do">로그인</a>
        <a class="navbar-brand" href="<%=request.getContextPath()%>/signup.do">회원가입</a>
&ndash;%&gt;

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="flex">
                <div class="float-end">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cart.do"> 장바구니 </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


    </div>
</nav>--%>
</body>
</html>