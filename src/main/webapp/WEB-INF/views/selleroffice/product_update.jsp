<%@ page import="lotte.com.toy.dto.CategoryDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.dto.ProductDto" %>
<%--
  Created by IntelliJ IDEA.
  User: BTC-N08
  Date: 2022-07-18
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%
    List<CategoryDto> categories = (List<CategoryDto>) request.getAttribute("categories");
    request.setCharacterEncoding("utf-8");
    ProductDto dto = (ProductDto)request.getAttribute("dto");
%>
<html>
<head>
    <%-- Summernote import--%>
    <script src="resources/summernote/summernote-lite.js"></script>
    <link rel="stylesheet" href="resources/summernote/summernote-lite.css"/>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
    <title>Title</title>
    <style type="text/css">
        /*        body{
                    background-color: #e2e2e2;
                }*/
        .temp {
            width: 80%;
            background-color: white;
            border: solid 0.5px;
            padding-left: 15px;
            padding-right: 15px;
            margin-bottom: 10px;
            padding-bottom: 5px;
        }

        .category_radio {
        }

        .input-box {
            margin-bottom: 5px;
        }

        .writeReviewDetailPhoto .picUploadList li .picUploadBtn {
            padding-top: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="../writeAf.do" id="frm" method="post" enctype="multipart/form-data">
        <input type="hidden" name="seller_id" value="<%=dto.getSeller_id()%>">
        <div class="temp" style="height:80px;">
            <h3 style="font-size: 17pt; float: left ;">상품등록 <span style="color: red; font-size: 8pt;">• 필수입력</span></h3>
        </div>
        <div class="temp">
            <p>카테고리</p>
            <hr>
            <div class="input-box">
                <% for (CategoryDto c : categories) {%>
                <% if(c.getCategory_id() == dto.getCategory_id()) {%>
                <input class="category_radio" type="radio" name="category_id" id="category<%=c.getCategory_id()%>"
                       value="<%=c.getCategory_id()%>" checked="checked"> <label><%=c.getCategory_name()%>
                <%}else {%>
                <input class="category_radio" type="radio" name="category_id" id="category<%=c.getCategory_id()%>"
                       value="<%=c.getCategory_id()%>"> <label><%=c.getCategory_name()%>
            </label>
                <% } %>
                <% }%>
            </div>
        </div>
        <div class="temp">
            <p>상품명</p>
            <hr>
            <div class="input-box">
                <input type="text" id="product_name" name="product_name" value="<%=dto.getProduct_name()%>" size="80" placeholder="상품명">
            </div>
        </div>
        <div class="temp">
            <p>판매가</p>
            <hr>
            <div class="input-box">
                <input type="number" min="1000" step="100" id="product_cost" name="product_cost" value="<%=dto.getProduct_cost()%>" size="20"
                       placeholder="판매가"><span>원</span>
            </div>
        </div>
        <div class="temp">
            <p>재고수량</p>
            <hr>
            <div class="input-box">
                <input type="number" min="10" max="200" size="20" value="<%=dto.getProduct_stock()%>" id="product_stock" name="product_stock"
                       placeholder="숫자만입력"><span>개</span>
            </div>
        </div>
        <div class="writeReviewDetailPhoto">
            <div class="picUploadBtn picture">
                <i><img src="//static.lotteon.com/p/product/plugin/assets/img/btn_icon_upload_camera_new.svg"
                        alt=""></i>
                <span>사진첨부</span>
                <input type="file" multiple="multiple" id="titleImage" name="fileload" accept="image/*" class="btnFile">
                <input type="hidden" name="product_img" id="pr_img" value="<%=dto.getProduct_img()%>">
            </div>
        </div>
        <div class="temp">
            <p>상세설명</p>
            <hr>
            <textarea class="summernote" id="product_info" name="product_info"><%=dto.getProduct_info()%></textarea>
        </div>
        <button type="button" id="writebtn" onclick="product_wrtie()">상품등록</button>
    </form>
</div>
<script>
    var imagefile;

    $("#titleImage").on("change", function (event) {
        imagefile = event.target.files[0];
    });
</script>

<script>
    $('.summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: false,
        lang: "ko-KR",
        placeholder: "이미지 드래그시에 등록됩니다.",
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload: function (files) {
                /*                uploadSummernoteImageFile(files[0],this);*/
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                        this);
                }
            },
            onPaste: function (e) {
                var clipboardData = e.originalEvent.clipboardData;
                if (clipboardData && clipboardData.items && clipboardData.items.length) {
                    var item = clipboardData.items[0];
                    if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                        e.preventDefault();
                    }
                }
            }
        }
    });

    function uploadSummernoteImageFile(file, editor) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            data: data,
            type: "POST",
            url: "<%=request.getContextPath()%>/uploadSummernoteImageFile.do",
            contentType: false,
            processData: false,
            enctype: 'multipart/form-data',
            success: function (data) {
                //항상 업로드된 파일의 url이 있어야 한다.
                console.log(data["url"]);
                $(editor).summernote('insertImage', data["url"]);
            },
            error: function (data) {
                console.log(data);
            }
        });
    }

    function product_wrtie() {

        var category_id = $("input[name='category_id']:checked").val();
        var product_name = $("#product_name").val();
        var product_cost = $("#product_cost").val();
        var product_stock = $("#product_stock").val();
        var product_info = $("#product_info").val();

        if (category_id === "") {
            alert("카테고리를 선택하세요");
            $("#category1").focus();
        }
        if (product_name == "") {
            alert("상품 이름을 입력하세요.")
            $("#product_name").focus();
        }
        if (product_cost == "") {
            alert("가격을 입력하세요.");
            $("#product_cost").focus();
        }
        if (product_stock == "") {
            alert("재고를 입력하세요.");
            $("#product_stock").focus();
        }
        if (product_info == "") {
            alert("상세설명을 입력하세요.");
            $("#product_info").focus();
        }

        if (imagefile != "") {
            var data = new FormData();
            data.append("file", imagefile);
            $.ajax({
                data: data,
                type: "POST",
                url: "<%=request.getContextPath()%>/titleImageUpload.do",
                contentType: false,
                processData: false,
                enctype: 'multipart/form-data',
                success: function (data) {
                    // const produdct_img = $("<input type='hidden' name='product_img' value = " + data["url"] + ">");
                    // $("#frm").append(produdct_img);
                    $("#pr_img").attr("value", data["url"]);
                    $("#frm").submit();
                },
                error: function (data) {
                }
            });
        } else {
            $("#frm").submit();
        }
    }
</script>
</body>
</html>