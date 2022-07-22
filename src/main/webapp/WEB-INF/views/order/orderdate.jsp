<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-19
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
  int totalPrice = 0;
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
<h2>주문 내역</h2>
<div class="dateBar">
  <form action="orderDateList.do">
    <input type="date" name="startDate">
    <input type="date" name="endDate">
    <input type="submit" value="검색하기">
  </form>
</div>

<c:forEach var="orderGroup" items="${orderDateGroup}" varStatus="status">
  <table border="1">
    <c:forEach var="order" items="${dateList[status.index]}">
      <tr>
        <th>
          <c:out value="${order.order_date}"/>&nbsp;
        </th>
        <td>
          <c:out value="${order.order_id}"/>
        </td>
        <td><a href="orderDetail.do?orderId=<c:out value="${order.order_id}"/>">상세보기</a></td>
        <td>
          <p id="shipStatus<c:out value="${order.order_id}"/>"></p>

          <script type="text/javascript">
            (function() {
              let ship = <c:out value="${order.ship_status}"/>;
              if(ship==0){
                $("#shipStatus<c:out value="${order.order_id}"/>").text("구매 미확정");
              }
              else{
                $("#shipStatus<c:out value="${order.order_id}"/>").text("구매 확정");
              }
            }());
          </script>
        </td>
      </tr>
      <tr>
        <th>
          <img alt="" src="<c:out value="${order.product_img}"/>">&nbsp;
        </th>
        <td rowspan="3">
          <c:out value="${order.order_total_price}"/>
          <c:set var="price" value="${order.order_total_price}" />
          <%
            totalPrice+=(Integer)pageContext.getAttribute("price");
          %>
        </td>
      </tr>
      <tr>
        <td></td>
        <td><c:out value="${order.product_name}"/></td>
      </tr>
      <tr>
        <td></td>
        <td><c:out value="${order.order_quantity}"/></td>
      </tr>
    </c:forEach>
    <tr>
      <th>총 결제금액 : <%=totalPrice%></th>
      <%
        totalPrice=0;
      %>
    </tr>
  </table>
</c:forEach>


</body>
</html>
