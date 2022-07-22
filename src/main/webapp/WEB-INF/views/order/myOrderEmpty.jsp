<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>mypage</title>
    <link href="<%=request.getContextPath()%>/resources/css/mypage.css"
          rel="stylesheet">
    <style>

    </style>
    <script src="https://kit.fontawesome.com/079869d0a6.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">

    <div class="contentWrap">
        <div class="membershipUserWrap">
            <div class="memberInner">
                <div class="profileWrap">
                    <button>
                        <i class="fa-solid fa-user"></i>
                    </button>
                    <div class="nicknameWrap">
                        <p class="infoWord">쇼핑하기 좋은 날이에요!</p>
                        <div class="nickName">${sessionScope.userLogin.user_name}님!</div>
                    </div>
                </div>
                <div class="membershipList">
                    <ul>
                        <li>
                            <div>나의 주문내역</div>
                            <div class="contain">
                                <a>
                                    <strong>0</strong>
                                    <span>개</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                    <div class="benefit">
                        <div><strong>회원 구매 우대 -</strong> 적립 5%</div>
                        <div><strong>회원 구매 우대 -</strong> 20,000원 이상 무료배송</div>
                    </div>
                </div>

            </div>
            <div class="memberInfoBanner">
                <img src="<%=request.getContextPath() %>/resources/images/myBanner.png" alt="">
            </div>
        </div>
        <div class="myLotteWrap">
            <div class="scrollArea">
                <ul>
                    <li class="first">
                        <div style="color: black">주문 내역</div>
                    </li>
                    <li>
                        <div onclick="location.href='<%=request.getContextPath()%>/findMyReviewList.do?userId=${sessionScope.userLogin.user_id}'">마이 리뷰</div>
                    </li>
                </ul>
            </div>

            <div class="bottomData">
                <div class="dateBar">
                    <form action="orderDateList.do">
                        <div class="orrderDate">
                            <input type="date" name="startDate" value="${startDate}">
                            <input type="date" name="endDate" value="${endDate}">
                            <input type="submit" class="dateBtn" value="기간검색">
                        </div>
                    </form>
                </div>
                <div class="noOrderWrapper">
                    <div>
                        <i class="fa-solid fa-cart-plus"></i>
                        <div>주문 내역이 없습니다</div>
                    </div>
                    <button type="button" class="orderBtn" onclick="location.href='<%=request.getContextPath() %>/productList.do'">지금 쇼핑하러 가기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
