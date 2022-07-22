<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BTC-N06
  Date: 2022-07-22
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>Title</title>
    <style>
        #container {
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #loginBox {
            width: 500px;
            height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .title {
            width: 420px;
            text-align: left;
            font-size: 36px;
            margin-bottom: 20px;
        }

        .inputSet {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

        }

        .inputSet input {
            padding-left: 20px;
            margin-bottom: 10px;
            width: 420px;
            height: 50px;
            border: none;
            border-radius: 10px;
            color: #333;
            background-color: #f5f5f5;
        }

        input:focus {
            outline: none;
        }

        .confirmWarp {
            margin-bottom: 10px;
        }

        .searchAddress {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .searchAddress button {
            align-self: end;
            margin-bottom: 10px;
            border: none;
            background-color: transparent;
            color: #999;
        }

        .selectGender input {
            width: 12px;
            margin-bottom: 0;
            margin-right: 5px;
        }

        .submitBtn {
            width: 420px;
            height: 52px;
            color: white;
            background-color: #EF2A23;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 17px;
            border: none;
            border-radius: 10px;
        }

        .autoLogin input {
            width: 18px;
            height: 18px;
            background-color: #EF2A23;
            margin-right: 5px;
        }
    </style>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div>
    <c:choose>
        <c:when test="${sessionScope.userLogin.user_kakao_identifier eq 0}">
            <div id="container">
                <form id="userUpdate" action="updateUserInfoAf.do" method="post">
                    <div id="loginBox">
                        <div class="title">회원정보 수정</div>
                        <div class="inputSet login">
                            <input type="text" id="user_email" placeholder="${sessionScope.userLogin.user_email}" readonly>
                            <div>
                                <input type="text" name="userName" placeholder="이름을 입력해주세요">
                            </div>
                            <div>
                                <input id="user_password" type="password" name="userPassword" placeholder="비밀번호를 입력해주세요">
                            </div>
                            <p id="pwCheck" style="font-size: 12px; width: 420px; padding-left: 15px; display: none; justify-content: start"></p>
                            <div>
                                <input type="text" name="userPhone" placeholder="전화번호를 입력해주세요">
                            </div>
                            <div class="searchAddress">
                                <div>
                                    <input id="user_zipcode" name="userZipcode" type="text" readonly
                                           placeholder="우편번호" onclick="findAddr()">
                                </div>
                                <div>
                                    <input id="user_address" name="userAddress" type="text" readonly
                                           placeholder="주소" onclick="findAddr()">
                                </div>
                                <input type="text" id="user_detail_address" name="user_detail_address"
                                       placeholder="상세주소">
                                <button type="button" onclick="findAddr()"> 주소 검색</button>
                            </div>
                        </div>
                        <div class="confirmWarp">
                            <button type="button" class="submitBtn" id="submitBtn">변경하기</button>
                        </div>
                    </div>
                </form>
            </div>
            <script>
                $(function () {
                    $("#user_password").change(function (e) {
                        const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
                        let isRightPw = regex.test(e.target.value);
                        if (isRightPw) {
                            $("#pwCheck").css("color", "#0000ff");
                            $("#pwCheck").css("display", "inline-block");
                            $("#pwCheck").html('사용할 수 있는 pw 입니다.');
                            isSPw = true;
                        } else {
                            $("#pwCheck").css("color", "#ff0000");
                            $("#pwCheck").css("display", "inline-block");
                            $("#pwCheck").html('비밀번호 양식이 일치하지 않습니다');
                            $("#user_password").val("");
                            isSPw = false;
                        }
                    });
                });

                function findAddr() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            console.log(data);
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            let roadAddr = data.roadAddress; // 도로명 주소 변수
                            let jibunAddr = data.jibunAddress; // 지번 주소 변수
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('user_zipcode').value = data.zonecode;
                            if (roadAddr !== '') {
                                document.getElementById("user_address").value = roadAddr;
                            } else if (jibunAddr !== '') {
                                document.getElementById("user_address").value = jibunAddr;
                            }
                        }
                    }).open();
                }

                // 회원가입, 유효성 체크
                const userUpdate = document.getElementById("userUpdate");
                console.log(document.getElementById("submitBtn"));
                console.log(document.getElementById("ksubmitBtn"));
                document.getElementById("submitBtn").addEventListener("click", function () {
                    const user_name = document.getElementById("user_name");
                    const user_zipcode = document.getElementById("user_zipcode");
                    let user_address = document.getElementById("user_address");
                    const user_detail_address = document.getElementById("user_detail_address");
                    const user_phone = document.getElementById("user_phone");

                    if (user_name.value === '') {
                        alert("이름을 확인해주세요");
                    } else if (user_zipcode.value === '') {
                        alert("주소번호를 입력해주세요");
                    } else if (user_address.value === '') {
                        alert("주소를 입력해주세요");
                    } else if (user_phone.value === '') {
                        alert("핸드폰 번호를 입력해주세요");
                    }
                    else {
                        user_address.value = (user_address.value + " " + user_detail_address.value); // 주소 합치기
                        alert("회원가입에 성공하였습니다.");
                        userUpdate.submit()   // 회원가입 성공
                    }
                })
            </script>
        </c:when>
        <c:otherwise>
            <div id="container">
                <form id="kuserUpdate" action="updateUserInfoAf.do" method="post">
                    <div id="kloginBox">
                        <div class="title">회원정보 수정</div>
                        <div class="inputSet login">
                            <input type="text" id="kuser_email" value="${sessionScope.userLogin.user_email}" readonly>
                            <div>
                                <input type="text" id="kuser_name" name="userName" placeholder="이름을 입력해주세요">
                            </div>
                            <div>
                                <input type="text" id="kuser_phone" name="userPhone" placeholder="전화번호를 입력해주세요">
                            </div>
                            <div class="searchAddress">
                                <div>
                                    <input id="kuser_zipcode" name="userZipcode" type="text" readonly
                                           placeholder="우편번호" onclick="kfindAddr()">
                                </div>
                                <div>
                                    <input id="kuser_address" name="userAddress" type="text" readonly
                                           placeholder="주소" onclick="kfindAddr()">
                                </div>
                                <input type="text" id="kuser_detail_address" name="user_detail_address"
                                       placeholder="상세주소">
                                <button type="button" onclick="kfindAddr()"> 주소 검색</button>
                            </div>
                        </div>
                        <div class="confirmWarp">
                            <button type="button" class="submitBtn" id="ksubmitBtn">변경하기</button>
                        </div>
                    </div>
                </form>
            </div>
            <script>
                function kfindAddr() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            console.log(data);
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            let roadAddr = data.roadAddress; // 도로명 주소 변수
                            let jibunAddr = data.jibunAddress; // 지번 주소 변수
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('kuser_zipcode').value = data.zonecode;
                            if (roadAddr !== '') {
                                document.getElementById("kuser_address").value = roadAddr;
                            } else if (jibunAddr !== '') {
                                document.getElementById("kuser_address").value = jibunAddr;
                            }
                        }
                    }).open();
                }

                // 회원가입, 유효성 체크
                const kuserUpdate = document.getElementById("kuserUpdate");
                document.getElementById("ksubmitBtn").addEventListener("click", function () {
                    const kuser_name = document.getElementById("kuser_name");
                    const kuser_zipcode = document.getElementById("kuser_zipcode");
                    let kuser_address = document.getElementById("kuser_address");
                    const kuser_detail_address = document.getElementById("kuser_detail_address");
                    const kuser_phone = document.getElementById("kuser_phone");

                    if (kuser_name.value === '') {
                        alert("이름을 확인해주세요");
                    } else if (kuser_zipcode.value === '') {
                        alert("우편번호를 입력해주세요");
                    } else if (kuser_address.value === '') {
                        alert("주소를 입력해주세요");
                    } else if (kuser_phone.value === '') {
                        alert("핸드폰 번호를 입력해주세요");
                    }
                    else {
                        kuser_address.value = (kuser_address.value + " " + kuser_detail_address.value); // 주소 합치기
                        alert("회원가입에 성공하였습니다.");
                        kuserUpdate.submit()   // 회원가입 성공
                    }
                })
            </script>
        </c:otherwise>
    </c:choose>

</body>
</html>
