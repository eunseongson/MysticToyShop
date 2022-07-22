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
                            <div>나의 주문내역</div>
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

                <c:forEach var="orderGroup" items="${orderDateGroup}" varStatus="status">
                    <c:forEach var="order" items="${dateList[status.index]}">
                        <div style="display: none">
                        <%= totalCount++%>
                        </div>
                        <div class="orderContainer">
                            <div class="imgWrapper">
                                <img alt="" src="<c:out value="${order.product_img}"/>">&nbsp;
                            </div>
                            <div class="textWrapper">
                                <div class="title"><c:out value="${order.product_name}"/></div>
                                <div class="textBottom">
                                        <%--가격 계산--%>
                                    <c:set var="price" value="${order.order_total_price}"/>
                                    <c:set var="quantity" value="${order.order_quantity}"/>

                                    <%
                                        totalPrice = (Integer) pageContext.getAttribute("price") * (Integer) pageContext.getAttribute("quantity");
                                    %>
                                    <div class="price"><%=totalPrice%>원
                                    </div>&nbsp;<p>|</p>&nbsp;
                                    <div class="count"><c:out value="${order.order_quantity}"/>개</div>
                                </div>

                            </div>
                            <div class="shipWrapper">
                                <div id="shipStatus<c:out value="${order.order_id}"/>"
                                     style="font-size: 20px; font-weight: bold"></div>

                            </div>
                            <div class="buttonWrapper">
                                <button type="button" class="detailBtn" onclick="location.href = 'orderDetail.do?orderId=<c:out value="${order.order_id}"/>' ">상세보기</button>
                                <form id="reviewForm" name="frm" action="/review.do" method="post">
                                    <input type="hidden" value="${order.product_img}" id="image${order.order_id}" name="product_img">
                                    <input type="hidden" value="${order.product_name}" id="title${order.order_id}" name="product_name">
                                    <input type="hidden" value=" ${order.product_id}" id="productId${order.order_id}" name="product_id">
                                    <input type="hidden" value=" ${order.order_id}" id="productId${order.order_id}" name="order_id">
                                    <button type="submit" class="reviewBtn" id="reviewBtn${order.order_id}" style="display: none" >리뷰쓰기</button>
                                </form>

                            </div>
                            <script type="text/javascript">
                                (function () {
                                    let ship = <c:out value="${order.ship_status}"/>;
                                    let review = ${order.reviewCheck}
                                    if (ship == 0) {
                                        $("#shipStatus<c:out value="${order.order_id}"/>").text("배송중");
                                    } else {
                                        $("#shipStatus<c:out value="${order.order_id}"/>").text("배송완료");
                                    }
                                    if(review == 0 && ship == 1){
                                        $("#reviewBtn<c:out value="${order.order_id}"/>").show();
                                    }
                                }());
                            </script>
                        </div>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("totalCount").innerText = <%=totalCount%>;
</script>
</body>
</html>
