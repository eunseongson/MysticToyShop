<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:getAsString name="title"/></title>
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        body{
            height: 100%;
        }
        #footer{
            margin-top: auto;
            height:50px;
        }

        #sidebar-left {
            width: 15%;
            height:1000px;
            padding: 5px;
            margin-right: 20px;
            margin-bottom: 20px;
            float: left;
            background-color: #f8f8f8;
            border: 0px solid #bcbcbc;
            font-size:10px;
        }
        .body{
            min-height: 750px;
            height:80%;
            width: 100%;
        }

    </style>
</head>
<body>

<!-- 상단 메뉴 -->
<tiles:insertAttribute name="header"/>
<!-- 상단 메뉴 끝 -->

<div id="sidebar-left">
    <tiles:insertAttribute name="side"/>
</div>

<!-- 내용 시작 -->
<div class="body"><tiles:insertAttribute name="body"/></div>
<!-- 내용 끝 -->

<!-- 하단 부분 -->
<div id="footer"><tiles:insertAttribute name="footer"/></div>
<!-- 하단부 끝 -->
</body>
</html>