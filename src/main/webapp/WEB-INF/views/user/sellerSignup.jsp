<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>sellerSignup</title>
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

        .checkEmail{
            width: 420px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .checkEmail button{
            align-self: end;
            margin-bottom: 10px;
            border: none;
            background-color: transparent;
            color: #999;
        }

        .searchAddress{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .searchAddress button{
            align-self: end;
            margin-bottom: 10px;
            border: none;
            background-color: transparent;
            color: #999;
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
</head>
<body>

<div id="container">
    <form id="sellerSignup" action="<%=request.getContextPath() %>/addSeller.do" method="post">
        <div id="loginBox">
            <div class="title">셀러 회원가입</div>
            <div class="inputSet login">
                <div>
                    <input type="text" id="seller_business_number" name="seller_business_number" placeholder="사업자 번호">
                </div>
                    <input type="text" id="seller_email" name="seller_email" placeholder="이메일 아이디">
                <div class="checkEmail">
                    <p id="idCheck" style="font-size: 12px; margin-left: 15px"></p>
                    <button type="button" id="idBtn">이메일 확인</button>
                </div>
                <div>
                    <input type="password" id="seller_password" name="seller_password"
                           placeholder="8자리 이상 영문+숫자+특수문자 조합">
                </div>
                <p id="pwCheck" style="font-size: 12px; width: 420px; padding-left: 15px; display: none; justify-content: start"></p>
                <div>
                    <input type="text" id="seller_name" name="seller_name" placeholder="이름">
                </div>
                <div>
                    <input type="text" id="seller_phone" name="seller_phone" placeholder="핸드폰 번호">
                </div>
                <div>
                    <input type="text" id="seller_company_name" name="seller_company_name" placeholder="회사 이름">
                </div>
                <div>
                    <input type="text" id="seller_company_number" name="seller_company_number" placeholder="회사 전화번호">
                </div>
                <div class="searchAddress">
                    <div>
                        <input id="seller_zipcode" name="seller_zipcode" type="text" readonly
                               placeholder="우편번호"  onclick="findAddr()">
                    </div>
                    <div>
                        <input id="seller_address" name="seller_address" type="text" readonly
                               placeholder="회사 주소"  onclick="findAddr()">
                    </div>
                    <input type="text" id="seller_detail_address" name="seller_detail_address"
                            placeholder="회사 상세주소">
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
            if($("#user_email").val().length == 0){
                $("#idCheck").css("color", "#ff0000");
                $("#idCheck").html('id를 입력해주세요');
                return;
            }
            $.ajax({
                type: "post",
                url: "sellerIdCheck.do",
                data: {"seller_id": $("#seller_email").val()},
                success: function (data) {
                    if (data.trim() == "YES") {
                        $("#idCheck").css("color", "#0000ff");
                        $("#idCheck").html('사용할 수 있는 id입니다');
                        isSId = true;
                    } else {
                        $("#idCheck").css("color", "#ff0000");
                        $("#idCheck").html('사용 중인 id입니다');
                        $("#seller_email").val("");
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
        $("#seller_password").change(function (e) {
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
                $("#seller_password").val("");
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
                document.getElementById('seller_zipcode').value = data.zonecode;
                if (roadAddr !== '') {
                    document.getElementById("seller_address").value = roadAddr;
                } else if (jibunAddr !== '') {
                    document.getElementById("seller_address").value = jibunAddr;
                }
            }
        }).open();
    }

    // 회원가입, 유효성 체크
    const sellerSignup = document.getElementById("sellerSignup");
    document.getElementById("submitBtn").addEventListener("click", function () {
        const seller_name = document.getElementById("seller_name");
        const seller_zipcode = document.getElementById("seller_zipcode");
        const seller_address = document.getElementById("seller_address");
        const seller_detail_address = document.getElementById("seller_detail_address");
        const seller_phone = document.getElementById("seller_phone");
        const seller_company_name = document.getElementById("seller_company_name");
        const seller_company_number = document.getElementById("seller_company_number");
        const seller_business_number = document.getElementById("seller_business_number");

        if (!isSId) {
            alert("아이디를 확인해주세요");
        } else if (!isSPw) {
            alert("비밀번호를 확인해주세요");
        } else if (seller_name.value === '') {
            alert("이름을 확인해주세요");
        } else if (seller_zipcode.value === '') {
            alert("주소번호를 입력해주세요");
        } else if (seller_address.value === '') {
            alert("주소를 입력해주세요");
        } else if (seller_phone.value === '') {
            alert("핸드폰 번호를 입력해주세요");
        } else if (seller_company_name.value === '') {
            alert("회사명을 입력해주세요");
        } else if (seller_company_number.value === '') {
            alert("회사 전화번호를 입력해주세요");
        } else if (seller_business_number.value === '') {
            alert("사업자번호를 입력해주세요");
        }
        /*      사업자번호 유효성체크
                핸드폰번호 유효성체크*/
        else {
            seller_address.value = (seller_address.value + " " + seller_detail_address.value); // 주소 합치기
            alert("회원가입에 성공하였습니다.");
            sellerSignup.submit()   // 회원가입 성공
        }
    })
</script>
</body>
</html>
