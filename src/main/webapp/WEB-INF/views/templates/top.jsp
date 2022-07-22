<%@ page import="lotte.com.toy.dto.SellerDto" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
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
    <link rel="shortcut icon" href='/favicon.ico' type="image/x-icon">
    <link rel="icon" href='/favicon.ico' type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/resources/css/top.css">
</head>
<body>
<!-- 상단 메뉴 -->
<!-- nav 상단 고정-->
<header class="headerWideArea">
    <div class="headerWrapper">
        <div class="headerInnerContent innerContent">
            <c:choose>
                <c:when test="${not empty sessionScope.userLogin}">
                    <a class="nav-link" href="<%=request.getContextPath()%>/orderlist.do">${sessionScope.userLogin.user_name}님</a>
                    <a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
                </c:when>
                <c:when test="${not empty sessionScope.sellerLogin}">
                    <a class="nav-link" href="<%=request.getContextPath()%>/orderlist.do">${sessionScope.sellerLogin.seller_name}님</a>
                    <a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-link" href="<%=request.getContextPath()%>/login.do">로그인</a>
                    <a class="nav-link" href="<%=request.getContextPath()%>/signup.do">회원가입</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="headerMainContent innerContent">
            <div class="headerLogoArea"><a class="" href="<%=request.getContextPath()%>/main.do"><img class="logoArea" src="resources/images/logo6_trans.png" alt=""></a></div>
            <div class="searchAreaWrap">
                <div class="searchArea">
                    <label for="headerSearchId" class="searchBlind">검색어</label>
                    <input type="search" id="headerSearchId" placeholder="검색어를 입력하세요" autocomplete="off">
                    <button type="button" class="btnSearchInner" onclick="search()"><span class="searchBlind">검색</span></button>
                </div>
            </div>
            <div class="buttonArea">
                <ul>
                    <c:choose>
                        <c:when test="${not empty sessionScope.userLogin}">
                            <li><a class="myPageBtn" href="<%=request.getContextPath()%>/orderlist.do">마이페이지</a></li>
                        </c:when>
                        <c:when test="${not empty sessionScope.sellerLogin}">
                            <li><a class="myPageBtn" href="<%=request.getContextPath()%>/seller_main.do?seller_id=${sessionScope.sellerLogin.seller_id}">판매자 센터</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="myPageBtn" href="<%=request.getContextPath()%>/login.do">마이페이지</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li><a class="cartBtn" href="<%=request.getContextPath()%>/cart.do">장바구니</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
    function search(){
        location.href = 'searchResult.do?productName='+$('#headerSearchId').val();
    }
</script>
</body>
</html>