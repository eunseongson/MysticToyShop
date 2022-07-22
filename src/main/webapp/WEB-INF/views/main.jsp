<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .bannerContainer{
            height: 500px;
        }
        .carousel-inner img {
            object-fit: fill;
            border-radius: 1vw;
        }
        .carousel-inner{
            padding-left: 32px;
        }
        .carousel-item{
            width: 100%;
            height: 468px;
        }
        .btnBorder{
            border: solid 1px black;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="container my-5 py-4 minWidthContainer">
    <div class="bannerContainer">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%=request.getContextPath()%>/resources/images/mainPoster/1.png">
                </div>
                <div class="carousel-item">
                    <img src="<%=request.getContextPath()%>/resources/images/mainPoster/2.png">
                </div>
                <div class="carousel-item">
                    <img src="<%=request.getContextPath()%>/resources/images/mainPoster/3.png">
                </div>
                <div class="carousel-item">
                    <img src="<%=request.getContextPath()%>/resources/images/mainPoster/4.png">
                </div>
                <div class="carousel-item">
                    <img src="<%=request.getContextPath()%>/resources/images/mainPoster/5.png">
                </div>
                <div class="carousel-item">
                    <img src="<%=request.getContextPath()%>/resources/images/mainPoster/6.png">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>
    </div>
    <div class="btnArea flexContainerRow alignCenterContainer">
        <button class="btn btnBorder" type="button" onclick="location.href='<%= request.getContextPath()%>/productList.do'">상품 더보기</button>
    </div>
    <div class="flexContainerRow alignCenterContainer">
        <c:forEach var="productResponseDto1" items="${productResponseDtoList1}">
            <div class="productBoxOneArea">
                <div class="productImgArea flexContainerRow alignCenterContainer">
                    <a href="/productDetail.do?productId=${productResponseDto1.product_id}">
                        <img class="productImgTag" src="${productResponseDto1.product_img}" alt="">
                    </a>
                </div>
                <div>
                    <div class="mb-2">
                        <span class="deliveryInfo">택배배송</span>
                    </div>
                    <div>
                        <a href="/productDetail.do?productId=${productResponseDto1.product_id}">
                            <span>${productResponseDto1.product_name}</span>
                        </a>
                    </div>
                    <div>
                        <strong>${productResponseDto1.product_cost}</strong>원
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
    <div class="flexContainerRow alignCenterContainer">
        <c:forEach var="productResponseDto2" items="${productResponseDtoList2}">
            <div class="productBoxOneArea">
                <div class="productImgArea flexContainerRow alignCenterContainer">
                    <a href="/productDetail.do?productId=${productResponseDto2.product_id}">
                        <img class="productImgTag" src="${productResponseDto2.product_img}" alt="No Image">
                    </a>
                </div>

                <div>
                    <div class="mb-2">
                        <span class="deliveryInfo">택배배송</span>
                    </div>
                    <div>
                        <a href="/productDetail.do?productId=${productResponseDto2.product_id}">
                            <span>${productResponseDto2.product_name}</span>
                        </a>
                    </div>
                    <div>
                        <strong>${productResponseDto2.product_cost}</strong>원
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>

</div>
</body>
</html>