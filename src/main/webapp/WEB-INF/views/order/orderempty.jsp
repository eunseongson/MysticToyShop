<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-19
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>주문 내역</h2>
<div class="dateBar">
    <form action="orderDateList.do">
        <input type="date" name="startDate">
        <input type="date" name="endDate">
        <input type="submit" value="검색하기">
    </form>
</div>
<h3>주문 내역 없음</h3>
</body>
</html>
