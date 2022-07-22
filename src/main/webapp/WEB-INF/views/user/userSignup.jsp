<%--
  Created by IntelliJ IDEA.
  User: BTC-N15
  Date: 2022-07-18
  Time: 오후 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userSignUp</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        #container {
            height: 100vh;
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

        .checkEmail {
            width: 420px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .checkEmail button {
            align-self: end;
            margin-bottom: 10px;
            border: none;
            background-color: transparent;
            color: #999;
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

        .selectGender {
            display: flex;
            justify-content: center;
            width: 420px;
        }

        .selectGender input {
            width: 12px;
            margin-bottom: 0;
            margin-right: 5px;
        }

        #mRadio {
            margin-right: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #lRadio {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #submitBtn {
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

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
</head>

<%
    String user_kakao_identifier = (String) request.getParameter("user_kakao_identifier");
%>
<body>
<div id="container">
    <form id="userSignup" action="<%=request.getContextPath() %>/addUser.do" method="post">
        <div id="loginBox">
            <div class="title">회원가입</div>
            <div class="inputSet login">
                <input type="text" id="user_email" name="user_email" placeholder="이메일 아이디">
                <%--카카오아이디--%>
                <input type="hidden" id="user_kakao_identifier" name="user_kakao_identifier"
                       value=<%=user_kakao_identifier%>>
                <div class="checkEmail">
                    <p id="idCheck" style="font-size: 12px; margin-left: 15px"></p>
                    <button type="button" id="idBtn">이메일 확인</button>
                </div>
                <div>
                    <input type="password" id="user_password" name="user_password"
                           placeholder="비밀번호 (8자리 이상 영문+숫자+특수문자 조합)">
                </div>
                <p id="pwCheck"
                   style="font-size: 12px; width: 420px; padding-left: 15px; display: none; justify-content: start"></p>
                <div>
                    <input type="text" id="user_name" name="user_name" placeholder="이름">
                </div>
                <div>
                    <input type="text" id="user_phone" name="user_phone" placeholder="핸드폰 번호">
                </div>
                <div class="selectGender">
                    <div id="mRadio">
                        <input type="radio" name="user_gender" value=0>남
                    </div>
                    <div id="lRadio">
                        <input type="radio" name="user_gender" value=1>여
                    </div>
                </div>
                <div class="searchAddress">
                    <div>
                        <input id="user_zipcode" name="user_zipcode" type="text" readonly
                               placeholder="우편번호" onclick="findAddr()">
                    </div>
                    <div>
                        <input id="user_address" name="user_address" type="text" readonly
                               placeholder="주소" onclick="findAddr()">
                    </div>
                    <input type="text" id="user_detail_address" name="user_detail_address"
                           placeholder="상세주소">
                    <button type="button" onclick="findAddr()"> 주소 검색</button>
                </div>
            </div>
            <div class="confirmWarp">
                <button type="button" id="submitBtn">회원가입</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    let isSId = false;
    let isSPw = false;

    // id중복 체크
    $(function () {
        $("#idBtn").click(function () {
            // 아이디가 입력되지 않았을 때
            if ($("#user_email").val().length == 0) {
                $("#idCheck").css("color", "#ff0000");
                $("#idCheck").html('id를 입력해주세요');
                return;
            }
            $.ajax({
                type: "post",
                url: "userIdCheck.do",
                data: {"user_id": $("#user_email").val()},
                success: function (data) {
                    if (data.trim() == "YES") {
                        $("#idCheck").css("color", "#0000ff");
                        $("#idCheck").html('사용할 수 있는 id입니다');
                        isSId = true;
                    } else {
                        $("#idCheck").css("color", "#ff0000");
                        $("#idCheck").html('사용 중인 id입니다');
                        $("#user_email").val("");
                        isSId = false;
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        });
    });

    // 비밀번호 양식 체크
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

    // 다음 주소 받아오기
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
    const userSignup = document.getElementById("userSignup");
    document.getElementById("submitBtn").addEventListener("click", function () {
        const user_name = document.getElementById("user_name");
        const user_zipcode = document.getElementById("user_zipcode");
        let user_address = document.getElementById("user_address");
        const user_detail_address = document.getElementById("user_detail_address");
        const user_phone = document.getElementById("user_phone");

        if (!isSId) {
            alert("아이디를 확인해주세요");
        } else if (!isSPw) {
            alert("비밀번호를 확인해주세요");
        } else if (user_name.value === '') {
            alert("이름을 확인해주세요");
        } else if (user_zipcode.value === '') {
            alert("주소번호를 입력해주세요");
        } else if (user_address.value === '') {
            alert("주소를 입력해주세요");
        } else if (user_phone.value === '') {
            alert("핸드폰 번호를 입력해주세요");
        }
        /*      사업자번호 유효성체크
                핸드폰번호 유효성체크*/
        else {
            user_address.value = (user_address.value + " " + user_detail_address.value); // 주소 합치기
            alert("회원가입에 성공하였습니다.");
            userSignup.submit()   // 회원가입 성공
        }
    })
</script>
</body>
</html>

