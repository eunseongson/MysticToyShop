<%@ page import="lotte.com.toy.dto.QnaListDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ReviewListDto" %>
<%@ page import="lotte.com.toy.util.DateUtil" %>
<%@ page import="java.sql.Timestamp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ReviewListDto> reviews = (List<ReviewListDto>) request.getAttribute("reviews");
%>

<%
    int totalCnt = 0;
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/productDetail.css">
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

        /*별점 생성 종료*/
    </style>
</head>
<body>
<div class="container my-5">
    <input type="hidden" name="productId" value="${productResponseDto.product_id}"/>
    <div class="productWrapArea">
        <div class="productImgArea">
            <div>
                <img class="productImgTag" src="${productResponseDto.product_img}" alt="">
            </div>
        </div>
        <div class="productDetailTopArea">
            <div class="productTitleArea">

                <div class="brandArea">
                    <div>${productResponseDto.seller_company_name}<span class="arrowSpan"></span></div>
                    <div class="utilBtnArea">
                        <button type="button" class="shareBtn"></button>
                    </div>
                </div>
            </div>
            <div class="productPriceArea">
                <div>
                    <div class="h2">${productResponseDto.product_name}</div>
                </div>
                <hr>
                <div>
                    <strong class="h4">${productResponseDto.product_cost}</strong><span> 원</span>
                </div>
            </div>
            <div class="priceOptionBox">
                <div><span class="limitInfo">1일 동안 최대 5개 구매 가능</span></div>
                <div class="priceFlexContainer">
                    <div class="spinnerBox">
                        <button type="button" class="btn minus lookDisabled" onclick="minus()">-</button>
                        <div class="number">
                            <input type="number" class="quantity" id="quantity" name="quantity" max="5"
                                   onchange="updateCartCount()" value="1">
                            <label for="quantity" class="blind"></label>
                        </div>
                        <button type="button" class="btn plus lookDisabled" onclick="plus()">+</button>
                    </div>
                    <div id="totalPrice"><strong class="h4">${productResponseDto.product_cost}</strong><span> 원</span>
                    </div>
                </div>
            </div>
            <div class="buttonGroup">
                <button class="btn btnCart" onclick="goToCart()">장바구니 담기</button>
                <button class="btn btnOrder" onclick="goToOrder()">바로 구매하기</button>
            </div>
        </div>
    </div>
    <div>
        <div class="scrollArea">
            <ul>
                <li>
                    <button type="button" id="pInfo" style="color: black"
                            onclick="location.href='<%=request.getContextPath()%>/productDetail.do?productId=${productResponseDto.product_id}'">
                        상품 정보
                    </button>
                </li>
                <li>
                    <button type="button" id="pReview" style="color: black; font-weight: bold">상품 리뷰</button>
                </li>
                <li>
                    <button type="button" id="pQna"
                            onclick="location.href='<%=request.getContextPath()%>/findQnaList.do?productId=${productResponseDto.product_id}'">
                        Q&A
                    </button>
                </li>
            </ul>
        </div>
        <div class="reviewContainer">
            <div class="reviewCount">
                <div>리뷰(&nbsp<p id="count" style="margin: 0"></p>&nbsp)</div>
            </div>

            <c:choose>
                <c:when test="${empty reviews}">
                    <p>아직까지 작성된 리뷰가 없어요!</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="review" items="${reviews}">
                        <c:set var="deleted" value="${review.is_deleted}"/>
                        <div style="display: none"><%=totalCnt++%>
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

<script>
    document.getElementById("count").innerText = <%=totalCnt%>;
</script>

<script type="text/javascript">
    function minus() {
        let productCount = $("input[name=quantity]").val();
        if (productCount > 1) {
            productCount = Number(productCount) - 1;
            $("input[name=quantity]").val(productCount);
            updateCartCount();
        } else {
            alert('최소 구매 수량은 1개입니다');
        }
    }

    function plus() {
        let productCount = $("input[name=quantity]").val();
        if (productCount < Number($("input[name=quantity]").attr('max'))) {
            productCount = Number(productCount) + 1;
            $("input[name=quantity]").val(productCount);
            updateCartCount();
        } else {
            alert('1일 동안 최대 5개 구매 가능합니다');
        }
    }

    function updateCartCount() {

        let productCount = $("input[name=quantity]").val();

        if (productCount > Number($("input[name=quantity]").attr('max'))) {
            alert('1일 동안 최대 5개 구매 가능합니다');
            $("input[name=quantity]").val(5);
            return;
        }
        if (productCount < 1) {
            alert('최소 구매 수량은 1개입니다');
            $("input[name=quantity]").val(1);
            return;
        }

        productCount = $("input[name=quantity]").val();

        document.getElementById("totalPrice").innerHTML = '<strong class="h4">' + Number(${productResponseDto.product_cost}) * Number(productCount) + '</strong><span> 원</span>';
        document.getElementById("totalPrice2").innerHTML = '<strong class="h4">' + Number(${productResponseDto.product_cost}) * Number(productCount) + '</strong><span> 원</span>';
    }

    function goToCart() {

        let checkLogin = '${empty sessionScope.userLogin}';
        console.log(checkLogin);
        if (checkLogin == 'true') {
            alert("로그인 후 이용해주세요");
            location.href = '<%=request.getContextPath()%>/login.do';
            return;
        } else {

            let data = {
                'cart_quantity': $("input[name=quantity]").val(),
                'user_id': '${sessionScope.userLogin.user_id}',
                'product_id': '${productResponseDto.product_id}'
            }

            $.ajax({
                url: '<%=request.getContextPath()%>/cartinsert.do',
                type: 'post',
                data: data,
                success: function (data) {
                    console.log(data);
                    var checkCartConfirm = confirm(data);
                    if (checkCartConfirm) {
                        location.href = '<%=request.getContextPath()%>/cart.do';
                    }
                }
            });
        }

    }

    function goToOrder() {
        location.href = '<%=request.getContextPath()%>/orderbyproduct.do?productId=${productResponseDto.product_id}&quantity=' + $("input[name=quantity]").val();
    }

</script>
</body>
</html>
