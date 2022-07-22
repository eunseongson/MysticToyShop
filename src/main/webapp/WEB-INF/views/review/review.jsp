<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>mypage</title>
    <link href="<%=request.getContextPath()%>/resources/css/mypage.css"
          rel="stylesheet">
    <style>
        .reviewContainer {
            margin-top: 20px;
            width: 100%;
            height: 1000px;
            padding: 0 100px;
        }

        .titleWrapper {
            height: 150px;
            overflow: hidden;
            padding: 20px 20px 15px 0;
            display: flex;
        }

        .imageWrapper {

            display: flex;
            align-items: center;
        }

        .imageWrapper img {
            width: 100px;
            height: 120px;
            object-fit: cover;
        }

        .reviewTitle {
            display: flex;
            padding-left: 50px;
            font-size: 18px;
            font-weight: 400;
            align-items: center;
        }

        .contentWrapper {
            margin-bottom: 50px;
        }

        .reviewButtonWrapper {
            display: flex;
            justify-content: center;
        }

        .reviewButtonWrapper button {
            width: 200px;
            height: 48px;
            margin: 0 auto;
            border: 1px solid #3A4CA8;
            background-color: #3A4CA8;
            font-size: 14px;
            color: #fff;
            line-height: 46px;
        }

        table {
            width: 100%;
            border-top: 1px solid #dddfe1;
            border-bottom: 1px solid #dddfe1;
        }

        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }

        th {
            text-align: center;
            border-top: 1px solid #dddfe1;
            background-color: #f7f7f7;
            font-size: 12px;
            color: #666;
            word-break: break-all;
            padding: 0;
        }

        tr {
            border-bottom: 1px solid #dddfe1;
        }

        td {
            padding: 10px 0 10px 10px;
        }

        input {
            width: 100%;
            height: 34px;
            padding: 0 10px;
            border: 1px solid #dddfe1;
            font-size: 12px;
            color: #000;
            line-height: 18px;
            outline: none;
        }

        textarea {
            resize: vertical;
            margin: 0;
            font-family: inherit;
            width: 100%;
            height: 300px;
            padding: 10px;
            border: 1px solid #dddfe1;
            font-size: 12px;
            color: #000;
            line-height: 18px;
            outline: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="contentWrap">
        <div class="membershipUserWrap">
            <div class="memberInner">
                <div class="profileWrap">
                    <button></button>
                    <div class="nicknameWrap">
                        <p class="infoWord">쇼핑하기 좋은 날이에요!</p>
                        <div class="nickName">손은성님!</div>
                    </div>
                </div>
                <div class="membershipList">
                    <ul>
                        <li>
                            <div>나의 주문내역</div>
                            <div class="contain">
                                <a>
                                    <strong>0</strong>
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
                    <li>
                        <div style="color: black">리뷰 쓰기</div>
                    </li>
                </ul>
            </div>

            <div class="reviewContainer">
                <div class="titleWrapper">
                    <div class="imageWrapper">
                        <img src="${image}">
                    </div>
                    <div class="reviewTitle">${title}</div>
                </div>
                <div class="contentWrapper">
                    <form action="/reviewAf.do" id="reviewForm" method="post">
                        <table>
                            <colgroup>
                                <col style="width: 110px">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>제목</th>
                                <td>
                                    <input type="text" name="reviewTitle" placeholder="제목을 입력해주세요." class="inp">
                                </td>
                            </tr>
                            <tr>
                                <th>후기작성</th>
                                <td>
                                    <div class="field_cmt">
                                    <textarea id="fieldCmt" name="reviewContent" cols="100" rows="10" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며,
일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다.
반품/환불 문의는 1:1문의로 가능합니다."></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>평점</th>
                                <td>
                                    <div id="myform">
                                        <fieldset>
                                            <input type="radio" name="reviewRate" value="5" id="rate1"><label for="rate1">⭐</label>
                                            <input type="radio" name="reviewRate" value="4" id="rate2"><label for="rate2">⭐</label>
                                            <input type="radio" name="reviewRate" value="3" id="rate3"><label for="rate3">⭐</label>
                                            <input type="radio" name="reviewRate" value="2" id="rate4"><label for="rate4">⭐</label>
                                            <input type="radio" name="reviewRate" value="1" id="rate5"><label for="rate5">⭐</label>
                                        </fieldset>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="productId" value="${productId}">
                    </form>
                </div>
                <div class="reviewButtonWrapper">
                    <button type="button" onclick="goReviewAf()">리뷰등록</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script !src="">
    function goReviewAf() {
        const form = document.getElementById("reviewForm");
        form.submit();
    }
</script>
</body>
</html>


<%--  Created by IntelliJ IDEA.--%>
<%--  User: BTC-N06--%>
<%--  Date: 2022-07-20--%>
<%--  Time: 오후 5:30--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%--%>
<%--  int productId = (Integer)request.getAttribute("productId");--%>
<%--  System.out.println(productId);--%>
<%--%>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>리뷰 작성</h1>--%>
<%--<div>--%>
<%--  <form action="/reviewAf.do">--%>
<%--    리뷰제목 : <input type="text" name="reviewTitle">--%>
<%--    리뷰내용 : <input type="text" name="reviewContent">--%>
<%--    평점 : <input type="text" name="reviewRate">--%>
<%--    <input type="hidden" name="productId" value="<%=productId%>">--%>
<%--    <input type="submit" value="작성하기">--%>
<%--  </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
