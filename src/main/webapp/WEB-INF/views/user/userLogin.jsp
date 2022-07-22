<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userLogin</title>
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

        #loginBtn {
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

        .autoLogin {
            width: 420px;
            display: flex;
            justify-content: space-between;
            margin-bottom: 78px;
        }

        .autoLogin input {
            width: 18px;
            height: 18px;
            background-color: #EF2A23;
            margin-right: 5px;
        }

        .saveId{
            display: flex;
            align-items: center;
        }

        .btnSignupWrap{
            display: flex;
            align-items: center;
        }

        #registerBtn{
            color: #999;
            background-color: transparent;
            font-size: 13px;
            border: none;
        }

        .kakaoLogin{
            width: 420px;
            height: 52px;
            background-color: #FEE500;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18px;
            border: none;
            border-radius: 10px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
</head>
<body>
<div id="container">
    <form id="userLogin" action="<%=request.getContextPath() %>/userLoginAf.do" method="post">
    <div id="loginBox">
        <div class="title">로그인</div>
        <div class="inputSet login">
            <div>
                <input type="text" id="user_email" name="user_email" placeholder="이메일 아이디"></div>
            <div>
                <input type="password" id="user_password" name="user_password" placeholder="8자리 이상 영문+숫자+특수문자 조합"></div>
        </div>
        <div class="confirmWarp">
            <button id="loginBtn" type="button">로그인하기</button>
        </div>
        <div class="autoLogin">
            <div class="saveId">
                <input type="checkbox" id="chk_save_id">아이디 저장
            </div>
            <div class="btnSignupWrap">
                <button id="registerBtn" type="button" onclick="location.href='<%=request.getContextPath() %>/userSignup.do'">회원가입</button>
            </div>
        </div>

        <div class="socialSignupWrap">
            <button class="kakaoLogin" type="button" onclick="location.href  ='https://kauth.kakao.com/oauth/authorize?client_id=a7b71fe2e271db4868dd5a0203d15d30&redirect_uri=http://localhost:8091/login_callback.do&response_type=code'">카카오로 시작하기</button>
        </div>
    </div>
    </form>
</div>
<script !src="">
    // 로그인 유효성 체크
    const userLogin = document.getElementById("userLogin");
    document.getElementById("loginBtn").addEventListener("click", function () {
        const user_email = document.getElementById("user_email");
        const user_password = document.getElementById("user_password");

        if (user_email.value === '') {
            alert("아이디를 입력해주세요");
        } else if (user_password.value === '') {
            alert("비밀번호를 입력해주세요");
        }
        else {
            userLogin.submit()   // 로그인 성공
        }
    })

    // 아이디 저장
    let user_email = $.cookie("user_email");
    if(user_email != null){
        $("#user_email").val(user_email);
        $("#chk_save_id").prop("checked", true);
    }

    $("#chk_save_id").click(function() {

        if($("#chk_save_id").is(":checked")){

            if($("#user_email").val().trim() == ""){
                alert("id를 입력해 주십시오");
                $("#chk_save_id").prop("checked", false);
            }else{
                // cookie를 저장
                $.cookie("user_email", $("#user_email").val().trim(), {expires:7, path:'./'});
            }

        }else{
            $.removeCookie("user_email", { path:'./' });
        }
    });
</script>
</body>
</html>
