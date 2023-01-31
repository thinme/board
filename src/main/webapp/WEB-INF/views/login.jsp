<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
	

	<script src="./resources/js/member.js" charset="UTF-8"></script> 
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	
<meta charset="UTF-8">
<title>Login page</title>
<style type="text/css">
.loginBox{
	float:right;
	
	text-align:center;
	z-index:1;
	border: 5px solid #F4E8F6;
	position: realitive;
	background-color:white;
	font-color:white;
	cursor:pointer;
}
.imgfile{
	width:70px;
	height:70px;
	cursor:pointer;
}
</style>
</head>
<body>
<div class="logo">
	<a onclick="goBoard()"><img src="./resources/img/logo.png"></a>
	<div class="loginBox">
	<a onclick="goLogin()"><img src="./resources/img/memberlogin.png" class="imgfile"/></a>	
	</div>
</div>
<div class="center">
	<h1>Login</h1>
	<form id="memberAuth" method="post" onsubmit="return false;" class="detail">
		<div>
			<label>ID</label>
		</div>
		<div>
			<input type="text" id="idLogin" name="memberId" placeholder="아이디를 입력해주시기 바랍니다"/>
		</div>
		<div>
			<label>PASWORD</label>
		</div>
		<div>
			<input type="password" id="pwLogin" name="memberPassword" placeholder="비밀번호를 입력해주시기 바랍니다"/>
		</div>
		<div class="centerBtn">
			<button  id="loginBtn">로그인</button>
		</div>
		<br>
		<div>
		 	아직 회원이 아니십니까?
		</div>
		<div class="centerBtn">
			<button id="goRegBtn" value="회원가입" >회원가입</button>
		</div>
	</form>
</div>

</body>
</html>