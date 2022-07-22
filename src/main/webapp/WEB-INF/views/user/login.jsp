<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        #container{
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #loginBox{
            width: 500px;
            height: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        img{
            border-radius: 1vw;
            margin: 10px;
            width: 500px;
            height: 300px;
            cursor: pointer;
            transition: all 0.25s linear;
        }
        img:hover{
            transform: scale(1.03);
        }
    </style>
</head>
<body>
<div id="container">
    <div id="loginBox">
        <div id="userLoginBox">
            <img src="<%=request.getContextPath() %>/resources/images/userLogin.png" onclick="location.href = 'userLogin.do'">
        </div>
        <div id="sellerLoginBox">
            <img src="<%=request.getContextPath() %>/resources/images/sellerLogin.png" onclick="location.href = 'sellerLogin.do'">
        </div>
    </div>
</div>
</body>
</html>
