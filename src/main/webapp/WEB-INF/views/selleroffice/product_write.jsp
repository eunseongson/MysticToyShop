<%@ page import="lotte.com.toy.dto.CategoryDto" %>
<%@ page import="java.util.List" %>
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
    int seller_id = (int) request.getAttribute("seller_id");
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
<body style="text-align: center">
<div id="content" style="margin-top: 30px;">
    <form action="../writeAf.do" id="frm" method="post" enctype="multipart/form-data">

    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-6">
                <h4 style="float: left ;">📝 상품등록
                    <span style="color: red; font-size: 8pt;">• 필수입력</span>
                </h4>
            </div>

        </div>

        <%--카테고리 시작--%>
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4 mt-4">
                <h6 style="float:left;">💡 카테고리</h6>
                <div style="float:left;">
                    <% for (CategoryDto c : categories) {%>
                        <div class="form-check-inline">
                            <input class="category_radio" type="radio" name="category_id" id="category<%=c.getCategory_id()%>"
                                   value="<%=c.getCategory_id()%>">
                            <label class="form-check-label"><%=c.getCategory_name()%></label>
                        </div>
                        <% } %>
                </div>
            </div>
        </div>


        <%--상품명--%>
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4">
                <h6 style="float:left;">🎁 상품명</h6>
                <div class="form-group">
                    <input type="text" name="product_name" class="form-control" placeholder="상품명을 입력하세요.">
                </div>
            </div>
        </div>

        <%--판매가--%>
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4">
                <h6 style="float:left;">💰 판매가격</h6>
                <div class="form-group">
                    <input type="number" name="product_cost" class="form-control" placeholder="판매가격을 입력해주세요">
                </div>
            </div>
        </div>

        <%--재고수량--%>
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4">
                <h6 style="float:left;">🚚 재고수량</h6>
                <div class="form-group">
                    <input type="number" name="product_stock" class="form-control" placeholder="재고수량을 입력해주세요">
                </div>
            </div>
        </div>

        <%--이미지--%>
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4">
                <h6 style="float:left;">📸 업로드</h6>
                <div class="picUploadBtn picture">
                    <input type="file" multiple="multiple" name="fileload" accept="image/*" class="btnFile">
                    <br>
                    <br>
                    <input type = "hidden" id="file_where_use" name="file_where_use" value="1">
                    <input type = "hidden" id="file_use_id" name="file_use_id" value="1">
                    <i ><img  src="//static.lotteon.com/p/product/plugin/assets/img/btn_icon_upload_camera_new.svg" alt=""></i>
                    <span >사진첨부</span>
                    <button type="button" class="btn btn-light" id="btnsubmit">자료올리기</button>
                </div>
            </div>
        </div>

        <%--상세설명--%>
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4">
                <h6 style="float:left;">✏ 상세설명</h6>
                <div>
                    <textarea class="summernote" name="product_info"></textarea>
                </div>
            </div>
        </div>

        <%--상세설명--%>
        <div class="row">
            <div class="col-xl-8 col-lg-2 mb-4">
                <button type="button" id="btnsubmit2" class="btn btn-primary">상품 등록</button>
            </div>
        </div>
    </div>

    </form>
    </div>
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
