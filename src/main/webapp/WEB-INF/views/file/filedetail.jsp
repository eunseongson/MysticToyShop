<%@ page import="lotte.com.toy.dto.FileDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.toy.service.FileService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: haehu
  Date: 2022-07-19
  Time: 오전 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>file</title>
    <style>
        .writeReviewDetailPhoto .picUploadList li .picUploadBtn {
            padding-top: 18px;
            text-align: center;
        }

    </style>
</head>
<body>

<%--
<div class="container">
    <c:forEach var="dto" items="${fileList}">
        &lt;%&ndash;<div>판매자 id : <c:out value="${dto.file_id}"/></div>&ndash;%&gt;
        &lt;%&ndash;<div>${dto.file_original_name}</div>
        <div>${dto.file_name}</div>
        <div>${dto.file_where_use}</div>&ndash;%&gt;
        <img class="img-fluid" src="${dto.file_original_name}" alt="" width="300" height="300">
    </c:forEach>
</div>--%>

<div class="writeReviewDetailPhoto">
      <div class="picUploadBtn picture">
          <form action="fileupload.do" name="fileForm" id="frm"  method="post" enctype="multipart/form-data">
              <input type="file" multiple="multiple" name="fileload" accept="image/*" class="btnFile">
              <br>
              <br>
              <input type = "hidden" id="file_where_use" name="file_where_use" value="1">
              <input type = "hidden" id="file_use_id" name="file_use_id" value="1">
              <i ><img  src="//static.lotteon.com/p/product/plugin/assets/img/btn_icon_upload_camera_new.svg" alt=""></i>
              <span >사진첨부</span>
              <button type="button" id="btnsubmit">자료올리기</button>
          </form>
      </div>
</div>
<script>
    $("#btnsubmit").click(function () {
        if(document.getElementsByName("fileload").length<1 || document.getElementsByName("fileload")[0].value == '') {
            alert("파일을 업로드 해주세요");
            document.getElementById("btnsubmit").focus();
            return;
        }
        $("#frm").submit();
    });
</script>
</body>

</html>
