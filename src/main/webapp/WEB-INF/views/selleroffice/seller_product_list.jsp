<%@ page import="lotte.com.toy.dto.ProductResponseDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-21
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ProductResponseDto> list = (List<ProductResponseDto>) request.getAttribute("mysalelist");

    /*
                p.product_id,
               product_name,
               product_img,
               product_cost,
               product_stock,
               product_sell_count,
               c.category_id,
               category_name
     */
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .mini {
            width: 50px;
            height: 70px;
            margin-right: 10px;
            padding: 5px;
        }

        .stockbtn {
            background-color: transparent;
            width: 80px;
            height: 30px;
            text-align: center;
            border: solid 1px #3A4CA8;
            color: #3A4CA8;
            font-size: 14px
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div>
        <strong>상품목록조회</strong>
        <hr>
        <table border="1">
            <tr>
                <col width="600">
                <col width="150">
                <col width="100">
                <col width="100">
                <col width="100">
                <th>상품명</th>
                <th>카테고리</th>
                <th>가격</th>
                <th>현재 재고</th>
                <th>판매량</th>
            </tr>
            <c:forEach var="productResponseDto" items="${mysalelist}">
                <c:set var="cost" value="${productResponseDto.product_cost}"/>
                <%
                    int cost = (int) pageContext.getAttribute("cost");
                    String product_cost = DateUtil.to000(cost);
                    pageContext.setAttribute("product_cost", product_cost);
                %>
                <tr>
                    <td><img class="mini" src="${productResponseDto.product_img}"><a
                            href="/productUpdate.do?product_id=${productResponseDto.product_id}">${productResponseDto.product_name}</a>
                    </td>
                    <td>${productResponseDto.category_name}</td>
                    <td>${product_cost} 원</td>
                    <td>
                        <c:set var="stock" value="${productResponseDto.product_stock}"/>
                        <c:choose>
                            <c:when test="${stock > 0}">
                                <button type="button" id="btn" class="stockbtn"
                                        onclick="stockUpdate(${productResponseDto.product_id})">${productResponseDto.product_stock}</button>
                            </c:when>
                            <c:when test="${stock == 0}">
                                <button style="border-color: #d62516; color: #d62516; text-decoration-line: line-through;" type="button" id="btn" class="stockbtn"
                                        onclick="stockUpdate(${productResponseDto.product_id})">품절
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button style="color: #d62516; text-decoration-line: line-through;" type="button" id="btn" class="stockbtn"
                                        onclick="stockUpdate(${productResponseDto.product_id})">판매종료
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${productResponseDto.product_sell_count}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<script>
    function stockUpdate(product_id) {
        var stock_count = prompt("재고 수정 (숫자만 입력) 0 = 품절 , -1 = 판매종료")
        $.ajax({
            url: '<%=request.getContextPath()%>/stockUpdate.do?product_id=' + product_id + "&product_stock=" + stock_count,
            type: 'get',
            data: {},
            success: function (data) {
                alert("배송준비 처리되었습니다.")
                location.reload();
            }
        });
    }
</script>

</body>
</html>
