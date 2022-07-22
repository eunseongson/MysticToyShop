<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ReviewListDto" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="lotte.com.toy.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-22
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    List<ReviewListDto> myReviews = (List<ReviewListDto>) request.getAttribute("myReviews");
%>
<html>
<head>
    <title>Title</title>
    <style>
        .reviewContainer {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0px 100px 0 100px;
            margin-bottom: 50px;
        }

        .reviewCount {
            font-size: 18px;
            font-weight: bold;
            justify-content: start;
            width: 1000px;
            margin-top: 50px;
            padding-left: 20px;
            margin-bottom: 50px;
        }

        .reviewCount div {
            display: flex;
            align-items: center;
        }

        .reviewWrapper {
            margin: 0 10px;
            margin-bottom: 20px;
            width: 1000px;
            border: solid 1px gray;
            border-radius: 14px;
            padding: 50px 30px;
        }

        .reviewWrapper .top {
            display: flex;
            justify-content: space-between;
        }

        .reviewWrapper .review_title {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
        }

        .reviewWrapper .review_register_date {
            text-align: right;
            margin: 0;
        }

        /*별점 생성*/
        .review-list__rating {
            display: inline-flex;
            overflow: hidden;
            height: 17px;
            padding-left: 53px;
            font-family: Musinsa, "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
            line-height: 1;
            color: #000000;
            text-align: left;
            align-items: baseline;
        }

        .review-list__rating__unit {
            overflow: hidden;
            width: 90px;
            height: 100%;
            background: url(<%=request.getContextPath()%>/resources/images/ic-star-off.svg) no-repeat;
            background-position: left top;
            background-size: 90px 100%;
        }

        .review-list__rating__active {
            display: block;
            width: 90px;
            height: 100%;
            background: url(<%=request.getContextPath()%>/resources/images/ic-star-on.svg) no-repeat;
            background-position: left top;
            background-size: 90px 100%;
        }

        .bottomData{
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
        }


        .titleWrapper {
            height: 150px;
            overflow: hidden;
            padding: 0px 20px 15px 0;
            display: flex;
        }

        .imageWrapper {

            display: flex;
            align-items: center;
        }

        .imageWrapper img {
            width: 70px;
            height: 90px;
            object-fit: cover;
        }

        .reviewTitle {
            display: flex;
            padding-left: 50px;
            font-size: 18px;
            font-weight: 400;
            align-items: center;
        }

        /*별점 생성 종료*/
    </style>
</head>
<body>
<div>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ page isELIgnored="false" %>
    <%
        int totalPrice = 0;
        int totalCount = 0;
    %>
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
                                <div>나의 리뷰내역</div>
                                <div class="contain">
                                    <a>
                                        <strong id="totalCount">0</strong>
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
                            <div onclick="location.href='<%=request.getContextPath()%>/orderlist.do?${sessionScope.userLogin.user_name}'">
                                주문 내역
                            </div>
                        </li>
                        <li>
                            <div style="color: black">마이 리뷰</div>
                        </li>
                    </ul>
                </div>
                <div class="bottomData">

                    <c:choose>
                        <c:when test="${empty myReviews}">
                            <strong>리뷰가 없어요!</strong>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="review" items="${myReviews}">
                                <c:set var="deleted" value="${review.is_deleted}"/>
                                <div style="display: none"><%=totalCount++%>
                                </div>
                                <div class="reviewWrapper">
                                    <div class="top">
                                        <p class="review_title">${review.review_title}</p>
                                        <p class="review_content">
                        <span class="review-list__rating">
                            <span class="review-list__rating__unit">
                                <c:choose>
                                    <c:when test="${review.review_rate == '1'}">
                                        <span class="review-list__rating__active" style="width: 20%"></span>
                                    </c:when>
                                    <c:when test="${review.review_rate == '2'}">
                                        <span class="review-list__rating__active" style="width: 40%"></span>
                                    </c:when>
                                    <c:when test="${review.review_rate == '3'}">
                                        <span class="review-list__rating__active" style="width: 60%"></span>
                                    </c:when>
                                    <c:when test="${review.review_rate == '4'}">
                                        <span class="review-list__rating__active" style="width: 80%"></span>
                                    </c:when>
                                    <c:when test="${review.review_rate == '5'}">
                                        <span class="review-list__rating__active" style="width: 100%"></span>
                                    </c:when>
                                </c:choose>
                            </span>
                        </span>
                                        </p>
                                    </div>

                                    <c:set var="date" value="${review.review_register_date}"/>
                                    <%
                                        Timestamp date = (Timestamp) pageContext.getAttribute("date");
                                        String register_date = DateUtil.toYYYYMMDD(date);
                                        pageContext.setAttribute("register_date", register_date);
                                    %>

                                    <p class="review_register_date">${register_date}</p>
                                    <div class="titleWrapper">
                                        <div class="imageWrapper">
                                            <img src="${review.product_img}">
                                        </div>
                                        <div class="reviewTitle">${review.product_name}</div>
                                    </div>
                                    <p class="user_name">구매자 : ${review.user_name}</p>
                                    <p class="review_content">${review.review_content}</p>
                                </div>
                                <!--<c:if test="${deleted eq '0'}"> 삭제 체크 -->

                                <!-- </c:if> -->
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("totalCount").innerText = <%=totalCount%>;
    </script>
    </body>
    </html>


</div>
</body>
</html>
