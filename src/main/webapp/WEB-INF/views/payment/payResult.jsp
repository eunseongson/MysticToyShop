<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>결제 완료</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
</head>
<body>
<c:choose>
    <c:when test="${not empty msg}">
        <script type="text/javascript">
            alert('${msg}');
            location.href = 'productDetail.do?productId=${productId}';
            // productId 가진 상품 상세 페이지로 다시 돌아가도록 수정 필요
        </script>
    </c:when>
    <c:when test="${not empty orderDetailDtoList}">
        <div class="container py-5">
            <div class="h2 d-flex justify-content-center my-5">주문 완료<img class="checkImg" src="/resources/images/img_check.gif" alt="No Image"/></div>
            <div class="payResultContainer">
                <div class="h3">배송 정보</div>
                <div class="deliveryContainerForResult">
                    <div class="deliveryContentContainer">
                        <dl>
                            <dt>받는분</dt>
                            <dd>${orderDetailDtoList[0].user_name}</dd>
                        </dl>
                        <dl>
                            <dt>배송지</dt>
                            <dd>${orderDetailDtoList[0].order_address}</dd>
                        </dl>
                        <dl>
                            <dt>휴대전화번호</dt>
                            <dd>${orderDetailDtoList[0].order_phone}</dd>
                        </dl>
                    </div>
                </div>
                <div class="h3">배송 요청사항</div>
                <div class="deliveryContainerForResult">
                    <div class="deliveryContentContainer">
                        <dl>
                            <dt>택배배송</dt>
                            <dd>${orderDetailDtoList[0].order_comment}</dd>
                        </dl>
                    </div>
                </div>
                <div class="h3">상품 정보</div>
                <div class="productListContainer">
                    <c:set var="i" value="0"/>
                    <c:set var="j" value="4"/>
                    <table>
                        <c:forEach var="orderDetailDto" items="${orderDetailDtoList}">
                            <c:if test="${i%j == 0 }">
                                <tr>
                            </c:if>
                            <td class="productItemBlock">
                                <div class="productBoxOneArea">
                                    <div class="productImgArea flexContainerRow alignItemCenterContainer">
                                        <a href="/productDetail.do?productId=${orderDetailDto.product_id}">
                                            <img class="productImgTag" src="${orderDetailDto.product_img}" alt="No Image">
                                        </a>
                                    </div>
                                    <div>
                                        <div>
                                            <a href="/productDetail.do?productId=${orderDetailDto.product_id}">
                                                <span class="productNameInfo">${orderDetailDto.product_name}</span>
                                            </a>
                                        </div>
                                        <div>
                                            <strong>${orderDetailDto.product_cost}</strong>원
                                        </div>
                                    </div>

                                </div>
                            </td>
                            <c:if test="${i%j == j-1 }">
                                </tr>
                            </c:if>
                            <c:set var="i" value="${i+1 }"/>
                        </c:forEach>
                    </table>
                </div>
                <div class="btnArea">
                    <button class="btn btnBorder" type="button" onclick="location.href='orderlist.do'">주문 내역 더보기</button>
                </div>
            </div>
        </div>
    </c:when>
</c:choose>
</body>
</html>