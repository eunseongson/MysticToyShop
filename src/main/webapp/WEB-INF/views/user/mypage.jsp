<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>mypage</title>
    <link href="<%=request.getContextPath()%>/resources/css/mypage.css"
                                                rel="stylesheet">
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
                        <div><strong>첫 구매 우대 -</strong> 적립 5%</div>
                        <div><strong>첫 구매 우대 -</strong> 20,000원 이상 무료배송</div>
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
                        <button type="button" style="color: black">주문 내역</button>
                    </li>
                    <li>
                        <button type="button">나의 리뷰</button>
                    </li>
                </ul>
            </div>

            <div class="bottomData">
                aaa
            </div>
        </div>
    </div>
</div>
</body>
</html>
