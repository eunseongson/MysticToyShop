<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>상품 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/productList.css">
</head>
<body>
<div class="container minWidthContainer flexContainerCol alignCenterContainer mt-5">
    <div class="categoryGridWrap">
        <ul class="categoryGrid">
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=6" class="categoryItem">
                    <span class="text maxtest">연령별</span>
                </a>

            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=2" class="categoryItem">
                    <span class="text maxtest">신생아/유아</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=3" class="categoryItem">
                    <span class="text maxtest">역할놀이/인형/꾸미기</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=4" class="categoryItem">
                    <span class="text maxtest">액션/조종/자동차</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=5" class="categoryItem">
                    <span class="text maxtest">교육완구</span>
                </a>
            </li>
        </ul>
        <ul class="categoryGrid">
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=1" class="categoryItem">
                    <span class="text maxtest">전자게임</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=7" class="categoryItem">
                    <span class="text maxtest">TRU단독존</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=8" class="categoryItem">
                    <span class="text maxtest">프라모델/피규어/BB탄</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=9" class="categoryItem">
                    <span class="text maxtest">건전지</span>
                </a>
            </li>
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=10" class="categoryItem">
                    <span class="text maxtest">스낵</span>
                </a>
            </li>
        </ul>
        <ul class="categoryGrid">
            <li class="categoryItemBox">
                <a href="categoryResult.do?categoryId=11" class="categoryItem">
                    <span class="text maxtest">스포츠/야외완구</span>
                </a>
            </li>
            <li class="categoryItemBox"><a href="categoryResult.do?categoryId=12" class="categoryItem">
                <span class="text maxtest">시즌/파티완구</span>
            </a></li>
        </ul>
    </div>

    <div class="productListContainer">
        <c:choose>
            <c:when test="${not empty productResponseDtoList}">
                <c:set var="i" value="0"/>
                <c:set var="j" value="4"/>
                <table>
                    <c:forEach var="productResponseDto" items="${productResponseDtoList}">
                        <c:if test="${i%j == 0 }">
                            <tr>
                        </c:if>
                        <td class="productItemBlock">
                            <div class="productBoxOneArea">
                                <div class="productImgArea flexContainerRow alignCenterContainer">
                                    <a href="/productDetail.do?productId=${productResponseDto.product_id}">
                                        <img class="productImgTag" src="${productResponseDto.product_img}" alt="No Image">
                                    </a>
                                </div>

                                <div>
                                    <div class="mb-2">
                                        <span class="deliveryInfo">택배배송</span>
                                    </div>
                                    <div>
                                        <a href="/productDetail.do?productId=${productResponseDto.product_id}">
                                            <span>${productResponseDto.product_name}</span>
                                        </a>
                                    </div>
                                    <div>
                                        <strong>${productResponseDto.product_cost}</strong>원
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
            </c:when>
            <c:otherwise>
                <div>카테고리에 해당하는 상품이 존재하지 않습니다.</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>