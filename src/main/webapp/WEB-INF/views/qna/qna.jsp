<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-20
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int productId = (Integer)request.getAttribute("productId");
    String productImg = (String)request.getAttribute("productImg");
    String productName = (String)request.getAttribute("productName");
%>
<html>
<head>
    <title>Title</title>
</head>

<style>
    .reviewContainer {
        margin-top: 20px;
        width: 100%;
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

    .myLotteWrap{
        padding: 50px 400px;
    }


</style>

<body>
<div>
    <div class="myLotteWrap">
        <div class="reviewContainer">
            <div class="titleWrapper">
                <div class="imageWrapper">
                    <img alt="" src=<%=productImg%>>
                </div>
                <div class="reviewTitle"><%=productName%></div>
            </div>
            <div class="contentWrapper">
                <form id="qnaForm" action="<%=request.getContextPath() %>/qnaAf.do" method="post">
                    <table>
                        <colgroup>
                            <col style="width: 110px">
                            <col style="width: auto;">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" id="title" name="qnaTitle" placeholder="제목을 입력해주세요." class="inp">
                            </td>
                        </tr>
                        <tr>
                            <th>후기작성</th>
                            <td>
                                <div class="field_cmt">
                                    <textarea id="content" name="qnaContent" cols="100" rows="10" placeholder="내용을 입력해주세요."></textarea>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="productId" value="<%=productId%>">
                </form>
            </div>
            <div class="reviewButtonWrapper">
                <button type="button" id="goReviewAf">등록</button>
            </div>
        </div>
    </div>

</div>
<script !src="">
    const qnaForm = document.getElementById("qnaForm");
    document.getElementById("goReviewAf").addEventListener("click", function () {
        const title = document.getElementById("title");
        const content = document.getElementById("content");

        if (title.value === '') {
            alert("제목을 입력해주세요");
        }
        else if (content.value === '') {
            alert("내용을 입력해주세요");
        }
        else {
            alert("등록이 완료되었습니다");
            qnaForm.submit();   // qna 등록 성공
        }
    })
</script>
</body>
</html>
