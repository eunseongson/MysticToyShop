<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.QnaListDto" %>
<%@ page import="lotte.com.toy.dto.UserDto" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-20
  Time: 오후 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%
    List<QnaListDto> qnas = (List<QnaListDto>)request.getAttribute("qnas");
    List<String> writers = (List<String>) request.getAttribute("writers");
%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .users figure.profileImg[data-v-05ce94ee]{
        background: url("//static.lotteon.com/p/product/assets/img/img_profile_default_random_05.svg") no-repeat 50%/cover;
    }
    .blind, .hiddenTxt{
        overflow: hidden;
        display: inline-block;
        border: 0;
        margin: 0;
        width: 1px;
        height: 1px;
        clip: rect(1px,1px,1px,1px);
        -webkit-clip-path: inset(50%);
        clip-path: inset(50%);
        position: absolute;
        top: 0!important;
        left: 0!important;
    }
    .users figure[data-v-05ce94ee]{
        width: 38px;
        height: 38px;
        border-radius: 50%;
        overflow: hidden;
    }
    .util[data-v-2d2cca6e]{
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        width: 100%;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        padding-bottom: 20px;
        border-bottom: 1px solid #333;
    }
    .info[data-v-597ad349]{
        padding: 24px 0 12px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        justify-content: space-between;
        font-size: 13px;
        line-height: 1.46;
        letter-spacing: -.02em;
    }
    .reviewList[data-v-05ce94ee]{
        border-bottom: 1px solid #eee;
        padding: 23px 0 20px;
    }
    .uswersAndMoremenu[data-v-05ce94ee]{
        position: relative;
    }
    .users[data-v-05ce94ee]{
        position: relative;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
    }
    .contents .options[data-v-05ce94ee]{
        margin-top: 7px;
        vertical-align: top;
        font-size: 14px;
        line-height: 1.57;
        color: #757575;
        display: block;
        white-space: nowrap;
        -webkit-line-clamp: 1;
        -webkit-box-orient: horizontal;
        overflow: hidden;
        text-overflow: ellipsis;
        display: inline-block;
        max-width: 100%;
        margin-right: 20px;
    }
    .date[data-v-05ce94ee]{
        margin-left: auto;
        font-size: 13px;
        line-height: 1.46;
        color: #999;
    }
    .contents .texts[data-v-05ce94ee]{
        display: block;
        padding-top: 10px;
        text-align: left;
        font-size: 15px;
        line-height: 1.47;
        font-family: NotoSansKR,Malgun Gothic,arial,sans-serif;
        color: #333;
        padding: 0;
    }
    .users .identities .userNameWrap .userName[data-v-05ce94ee]{
        display: inline-block;
        font-size: 16px;
        line-height: 1.5;
    }
    .dataNull.alert.white[data-v-748e3961], .dataNull.alert[data-v-748e3961], .dataNull.default[data-v-748e3961]{
        background-image: url("//static.lotteon.com/p/product/assets/img/icon_no_result.svg");
    }
    .dataNull[data-v-748e3961]{
        margin-top: 80px;
        padding-bottom: 80px;
        padding-top: 60px;
        background-repeat: no-repeat;
        background-position: center 0;
        background-size: 60px auto;
    }
    .dataNull p[data-v-748e3961]{
        padding-top: 15px;
        font-size: 15px;
        line-height: 1.64;
        letter-spacing: -.02em;
        text-align: center;
    }
    .services[data-v-0832fcd3]{
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        padding: 15px 0;
        border-bottom: 1px solid #eee;
        font-size: 14px;
        line-height: 1.57;
    }
    .services .btnGoQuestion[data-v-0832fcd3]{
        margin-left: auto;
        padding: 12px 22px;
        border-radius: 6px;
        background-color: #343b4d;
        color: #fff;
    }
</style>
<body>
<div data-v-9b64bfe4 id="reviewMain" class="productReviewWrap">
    <div data-v-2d2cca6e data-v-9b64bfe4 class="reviewPanel summaryExists">
        <div data-v-2d2cca6e class="util">
            <div data-v-2d2cca6e class="sum">
                <strong data-v-2d2cca6e>리뷰</strong>
                <span data-v-2d2cca6e>( <%=qnas.size()%> )</span>
            </div>
        </div>
    </div>
    <div data-v-597ad349 data-v-9b64bfe4 class="reviewFilter">
        <div data-v-597ad349 class="info">
            <span data-v-597ad349 class="total"> 총 <%=qnas.size()%>건 </span>
        </div>
    </div>
    <!-- qna버튼 -->
    <div data-v-0832fcd3 class="services">
        <button type="button" class="btnGoQuestion">
            질문하기
        </button>
    </div>
    <!-- 여기까지 -->
    <c:set var="sizeQna" value="${qnas}"/>
    <c:choose>
        <c:when test="${empty sizeQna}">
            <div data-v-748e3961 class="dataNull default">
                <p data-v-748e3961>선택 상품의 Q&A가 없어요!</p>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="qna" items="${qnas}" varStatus="status">
                <div data-v-05ce94ee data-v-9b64bfe4 class="reviewList">
                    <div data-v-05ce94ee class="uswersAndMoremenu">
                        <div data-v-05ce94ee class="users">
                            <figure data-v-05ce94ee class="profileImg">
                                <span data-v-05ce94ee class="blind">유저 썸네일 이미지</span>
                            </figure>
                            <div data-v-05ce94ee class="identities">
                                <div data-v-05ce94ee class="userNameWrap">
                                    <strong data-v-05ce94ee class="userName"><c:out value="${writers[status.index]}"/></strong>
                                </div>
                                <div data-v-05ce94ee class="badges"></div>
                            </div>
                        </div>
                    </div>
                    <div data-v-05ce94ee class="contents">
                        <div data-v-05ce94ee class="options">
                            상품명 : <c:out value="${qna.product_name}"/>

                        </div>
                        <div data-v-05ce94ee class="texts">
                    <span data-v-05ce94ee class="texting">
                    <strong>Q   <c:out value="${qna.qna_title}"/></strong><br>
                    <c:out value="${qna.qna_content}"/>
                    </span>
                        </div>

                    </div>
                    <div data-v-05ce94ee class="underAction">
                        <span data-v-05ce94ee class="date"><c:out value="${qna.qna_register_date}"></c:out></span>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>
