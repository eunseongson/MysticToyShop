<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="lotte.com.toy.dto.OrderDetailDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-18
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    OrderDetailDto order = (OrderDetailDto) request.getAttribute("order");
%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    img{
        width: 80px;
        height: 80px;
    }
</style>
<body>
<h2>주문 상세</h2>
<table>
    <tr>
        <h3><%=order.getProduct_name()%></h3>
    </tr>
    <tr>
        <td>
            <img alt="" src="<%=order.getProduct_img() %>">
        </td>
        <td rowspan="2">회사명</td>
        <p id="shipStatus"></p>
        <script type="text/javascript">
            (function(ship) {
                if(ship==0){
                    $("#shipStatus").text("구매 미확정");
                }
                else{
                    $("#shipStatus").text("구매 확정");
                }
            }(<%=order.getShip_status()%>));
        </script>
    </tr>
    <tr>
        <td></td>
        <td><%=order.getOrder_total_price()%></td>
    </tr>
</table>
<h2>배송정보</h2>
<table>
    <tr>
        받는분&nbsp;&nbsp;&nbsp;<%=order.getUser_name()%>
    </tr>
    <tr>
        휴대폰번호&nbsp;&nbsp;&nbsp;<%=order.getOrder_phone()%>
    </tr>
    <tr>
        배송지&nbsp;&nbsp;&nbsp;<%=order.getOrder_address()%>
    </tr>
    <tr>
        배송메시지&nbsp;&nbsp;&nbsp;<%=order.getOrder_comment()%>
    </tr>
</table>
</body>
</html>
