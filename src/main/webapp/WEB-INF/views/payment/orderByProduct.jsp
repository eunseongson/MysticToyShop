<%@ page import="lotte.com.toy.dto.CartProductDto" %>
<%@ page import="lotte.com.toy.dto.ProductDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    ProductDto product = (ProductDto) request.getAttribute("productDto");
    int productId = (Integer) request.getAttribute("productId");
    int quantity = (Integer) request.getAttribute("quantity");
    int totalPrice = 0;
    int orderCount = 1;
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
</head>
<body>
<div class="h3 d-flex justify-content-center my-5">주문/결제하기</div>
<div class="container my-5 minWidthContainer">
    <div class="flexTableContainer orderPayWrap">
        <div class="cardTitle">상품 정보</div>
        <div class="productBox cardBoxBorderContainer">
            <div class="productImgContainer">
                <img class="productImg" alt="" src="<%=product.getProduct_img()%>"/>
            </div>
            <div>
                <div class="productName">
                    <div class="h4"><%=product.getProduct_name()%>
                    </div>
                </div>
                <div class="productProperties">
                    <dl>
                        <dt>수량</dt>
                        <dd><%=quantity%>
                        </dd>
                    </dl>
                    <dl>
                        <dt>가격</dt>
                        <dd><%=product.getProduct_cost()%>원
                        </dd>
                    </dl>
                </div>
            </div>
            <%
                totalPrice += (product.getProduct_cost()) * (quantity);
            %>
        </div>
        <div class="h3">배송 정보</div>

        <form name="frm" action="singlepayment.do" method="post" onsubmit="return checkForm()">
            <div class="deliveryContainer">
                <div class="deliveryContentContainer alignCenterContainer">
                    <div class="mb-3">
                        <label for="orderName" class="mb-2">받는분</label>
                        <div style="width: 300px;"><input class="form-control" type="text" name="orderName" id="orderName" size="10" value="${sessionScope.userLogin.user_name}"/></div>
                    </div>
                    <div class="mb-3">
                        <label for="orderAddress" class="mb-2">배송지</label>
                        <div class="formLength"><input class="form-control" type="text" name="orderAddress" id="orderAddress" value="${sessionScope.userLogin.user_address}"/></div>
                    </div>
                    <div class="mb-3">
                        <label for="orderPhone" class="mb-2">전화번호</label>
                        <div style="width: 300px;"><input class="form-control" type="text" name="orderPhone" id="orderPhone" value="${sessionScope.userLogin.user_phone}"/></div>
                    </div>
                    <div class="mb-3">
                        <label for="orderComment" class="mb-2">배송 요청사항</label>
                        <div class="formLength"><input class="form-control" type="text" name="orderComment" id="orderComment" placeholder="배송 전 연락주세요"/></div>
                    </div>
                </div>
            </div>

            <div class="h3">결제 수단</div>
            <div class="paymentContainer">
                <div class="paymentContentContainer">
                    <ul>
                        <li>
                            <button class="btn paymentBtn" type="button"><span class="btnSpan"><span class="icoLpay">간편결제</span></span></button>
                        </li>
                        <li>
                            <button class="btn paymentBtn" type="button"><span class="btnSpan"><span class="icoCard">신용카드</span></span></button>
                        </li>
                        <li>
                            <button class="btn paymentBtn" type="button"><span class="btnSpan"><span class="icoKpay">카카오페이</span></span></button>
                        </li>
                        <li>
                            <button class="btn paymentBtn" type="button"><span class="btnSpan"><span class="icoNpay">네이버페이</span></span></button>
                        </li>
                    </ul>

                </div>
            </div>

            <input type="hidden" name="productId" value=<%=productId%>>
            <input type="hidden" name="quantity" value=<%=quantity%>>

            <div class="flexContainerCol alignCenterContainer mb-3 priceContainer">
                <div class="h3 mb-3">총 결제금액</div>
                <div class="mb-3">
                    총 <strong class="colorPrimary"><%=orderCount%></strong> 건
                </div>
                <div class="mb-3">
                    총 상품금액 : <strong class="colorPrimary"><%=totalPrice%></strong> 원
                </div>
                <strong class="my-5">위 내용을 확인하였으며 결제에 동의합니다</strong>
                <input class="btnOrder" type="submit" value="주문하기">
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    function checkForm() {
        if (frm.orderName.value == "" || frm.orderAddress.value == "" || frm.orderPhone.value == "" || frm.orderComment.value == "") {
            alert("빈칸을 채워주세요!");
            return false;
        }
    }
</script>
</body>
</html>
