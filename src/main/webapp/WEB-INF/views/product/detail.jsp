<%@ page import="lotte.com.toy.dto.QnaListDto" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/productDetail.css">
    <style>
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
    <div class="scrollArea">
        <ul>
            <li>
                <button type="button" id="pInfo" style="color: black; font-weight: bold">상품 정보</button>
            </li>
            <li>
                <button type="button" id="pReview"
                        onclick="location.href='<%=request.getContextPath()%>/findReviewList.do?productId=${productResponseDto.product_id}'">상품 리뷰</button>
            </li>
            <li>
                <button type="button" id="pQna"
                        onclick="location.href='<%=request.getContextPath()%>/findQnaList.do?productId=${productResponseDto.product_id}'">Q&A</button>
            </li>
        </ul>
    </div>
    <div class="productDetailContentArea">
        <div class="productDetailContents">
            <div>
                <div class="h3">판매자 정보</div>
            </div>
            <div class="sellerInfoBox">
                <div class="sellerProperties">
                    <dl>
                        <dt>브랜드</dt>
                        <dd>${productResponseDto.seller_company_name}</dd>
                    </dl>
                    <dl>
                        <dt>email</dt>
                        <dd>${productResponseDto.seller_email}</dd>
                    </dl>
                    <dl>
                        <dt>사업장 연락처</dt>
                        <dd>${productResponseDto.seller_company_number}</dd>
                    </dl>
                    <dl>
                        <dt>사업장 소재지</dt>
                        <dd>${productResponseDto.seller_address}</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="optionContents">
            <div class="productOptionContent">
                <div class="bundleOptionContents">
                    <div class="priceWon">
                        <div class="mb-1"><span class="limitInfo">1일 동안 최대 5개 구매 가능</span></div>
                        <div class="priceFlexContainer">
                            <div class="spinnerBox me-2">
                                <button type="button" class="btn minus lookDisabled" onclick="minus()">-</button>
                                <div class="number">
                                    <input type="number" class="quantity" name="quantity" max="5"
                                           onchange="updateCartCount()" value="1">
                                    <label for="quantity" class="blind"></label>
                                </div>
                                <button type="button" class="btn plus lookDisabled" onclick="plus()">+</button>
                            </div>
                            <div id="totalPrice2"><strong
                                    class="h4">${productResponseDto.product_cost}</strong><span> 원</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

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
